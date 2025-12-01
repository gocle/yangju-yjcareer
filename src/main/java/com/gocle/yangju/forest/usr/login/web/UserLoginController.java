package com.gocle.yangju.forest.usr.login.web;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.login.vo.LoginVO;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.Globals;

@Controller
@RequestMapping("/usr/login/")
public class UserLoginController {
	
	private static final String S_SITE_CODE = EgovProperties.getProperty("Globals.sSiteCode");
	private static final String S_SITE_PASSWORD = EgovProperties.getProperty("Globals.sSitePassword");
	
	/**
	 * 본인인증 팝업 호출
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("requestAuth.do")
	@ResponseBody
	public Map<String, String> requestAuth(HttpSession session, HttpServletRequest request, @RequestParam(value="redirectUrl", required=false) String redirectUrl) throws Exception {
	    NiceID.Check.CPClient niceCheck = new NiceID.Check.CPClient();

	    String sSiteCode = S_SITE_CODE;
	    String sSitePassword = S_SITE_PASSWORD;
	    String sRequestNumber = niceCheck.getRequestNO(sSiteCode);
	    session.setAttribute("REQ_SEQ", sRequestNumber); // 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.

	    String sAuthType = "M";      	// 없으면 기본 선택화면, M(휴대폰), X(인증서공통), U(공동인증서), F(금융인증서), S(PASS인증서), C(신용카드)
		String customize 	= "";		//없으면 기본 웹페이지 / Mobile : 모바일페이지

	    String baseUrl = request.getScheme() + "://" + request.getServerName();
	    if (!((request.getScheme().equals("http") && request.getServerPort() == 80)
	          || (request.getScheme().equals("https") && request.getServerPort() == 443))) {
	        baseUrl += ":" + request.getServerPort();
	    }
	    baseUrl += request.getContextPath();

	    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
		//리턴url은 인증 전 인증페이지를 호출하기 전 url과 동일해야 합니다. ex) 인증 전 url : http://www.~ 리턴 url : http://www.~
	    String sReturnUrl = baseUrl + "/usr/login/successAuth.do";      // 성공시 이동될 URL
	    if (redirectUrl != null && !redirectUrl.isEmpty()) {
	        sReturnUrl += "?redirectUrl=" + URLEncoder.encode(redirectUrl, "UTF-8");
	    }
	    String sErrorUrl = baseUrl + "/usr/login/failAuth.do";          // 실패시 이동될 URL
	    
	    // 입력될 plain 데이타를 만든다.
	    String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
	                        "8:SITECODE" + sSiteCode.getBytes().length + ":" + sSiteCode +
	                        "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
	                        "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl +
	                        "7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl +
	                        "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize;

	    int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
	    String sEncData = "";
	    if (iReturn == 0) {
	        sEncData = niceCheck.getCipherData();
	    } else {
	        throw new RuntimeException("본인인증 암호화 실패 iReturn=" + iReturn);
	    }

	    Map<String, String> result = new HashMap<>();
	    result.put("encData", sEncData);
	    return result;
	}
	
	
	/**
	 * 본인인증 성공 callback
	 * @param request
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/successAuth.do")
    public String success(HttpServletRequest request, RedirectAttributes redirectAttributes, Model model) throws Exception {

        NiceID.Check.CPClient niceCheck = new NiceID.Check.CPClient();

        String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");

        String sSiteCode = S_SITE_CODE; 
        String sSitePassword = S_SITE_PASSWORD;

        //복호화
        int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

        String sMessage = "";
        String sDupInfo = "";
        String sName = "";
        String sBirthDate = "";
        String sGender = "";
        String sMobileNo = "";
        String sMobileCo = "";
        String usrIP = request.getHeader("HTTP_X_FORWARDED_FOR");
		if( StringUtils.isBlank( usrIP ) || usrIP.toLowerCase().equals("unknown") ){
			usrIP = request.getHeader("REMOTE_ADDR");
		}
		if( StringUtils.isBlank( usrIP ) || usrIP.toLowerCase().equals("unknown") ){
			usrIP = request.getRemoteAddr();
		}

        if (iReturn == 0) {
            String sPlainData = niceCheck.getPlainData();
            java.util.HashMap<String, String> mapResult = niceCheck.fnParse(sPlainData);

            sDupInfo = mapResult.get("DI");
            sName = mapResult.get("NAME");
            sBirthDate = mapResult.get("BIRTHDATE");
            sGender = mapResult.get("GENDER");
            sMobileNo = mapResult.get("MOBILE_NO");
            if (sMobileNo != null && sMobileNo.length() == 11) {
                sMobileNo = sMobileNo.substring(0,3) + "-" + sMobileNo.substring(3,7) + "-" + sMobileNo.substring(7,11);
            }
            sMobileCo = mapResult.get("MOBILE_CO");

            // 세션 REQ_SEQ 확인
            String session_sRequestNumber = (String) request.getSession().getAttribute("REQ_SEQ");
            String sRequestNumber = mapResult.get("REQ_SEQ");
            if (!sRequestNumber.equals(session_sRequestNumber)) {
                sMessage = "세션값 불일치 오류입니다.";
                sDupInfo = null;
            } else {
                HttpSession session = request.getSession(true);
                LoginVO loginVO = new LoginVO();
                loginVO.setMemName(sName);
                loginVO.setHpNo(sMobileNo);
                loginVO.setMemSeq(sDupInfo);
                
                session.setAttribute(Globals.SESSION_USER_VO, loginVO);
                session.setAttribute(Globals.MEM_SEQ, sDupInfo);
    			session.setAttribute(Globals.DI_KEY, sDupInfo);
    			session.setAttribute(Globals.PHONE, sMobileNo);
    			session.setAttribute(Globals.MEM_NAME, sName);
    			session.setAttribute(Globals.MEM_TYPE, "USR");
    			session.setAttribute(Globals.GENDER, sGender);
    			session.setAttribute(Globals.IP, usrIP);
    			session.setAttribute("redirect_url", "");
            }

        } else {
            switch (iReturn) {
                case -1: sMessage = "복호화 시스템 오류입니다."; break;
                case -4: sMessage = "복호화 처리 오류입니다."; break;
                case -5: sMessage = "복호화 해쉬 오류입니다."; break;
                case -6: sMessage = "복호화 데이터 오류입니다."; break;
                case -9: sMessage = "입력 데이터 오류입니다."; break;
                case -12: sMessage = "사이트 패스워드 오류입니다."; break;
                default: sMessage = "알 수 없는 에러입니다. iReturn: " + iReturn;
            }
        }

        // 인증 전 접근 URL
        String redirectUrl = request.getParameter("redirectUrl");
        if (redirectUrl == null || redirectUrl.isEmpty()) {
            redirectUrl = "/usr/main.do";
        }
        
        model.addAttribute("message", sMessage);
        model.addAttribute("redirectUrl", redirectUrl);

        return "usr/main/authSuccess";
    }

    private String requestReplace(String paramValue, String gubun) {
        if (paramValue == null) return "";

        paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;")
                .replaceAll("\\*", "").replaceAll("\\?", "").replaceAll("\\[", "")
                .replaceAll("\\{", "").replaceAll("\\(", "").replaceAll("\\)", "")
                .replaceAll("\\^", "").replaceAll("\\$", "").replaceAll("'", "")
                .replaceAll("@", "").replaceAll("%", "").replaceAll(";", "")
                .replaceAll(":", "").replaceAll("-", "").replaceAll("#", "")
                .replaceAll("--", "").replaceAll(",", "");

        if (!"encodeData".equals(gubun)) {
            paramValue = paramValue.replaceAll("\\+", "").replaceAll("/", "").replaceAll("=", "");
        }
        return paramValue;
    }
    
    /**
     * 본인인증 실패
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/failAuth.do")
    public String failAuth(HttpServletRequest request, Model model) throws Exception {
        String sMessage = request.getParameter("message");
        String redirectUrl = request.getParameter("redirectUrl");
        if (redirectUrl == null || redirectUrl.isEmpty()) {
            redirectUrl = "/usr/main.do";
        }

        model.addAttribute("message", sMessage != null ? sMessage : "본인인증에 실패했습니다.");
        model.addAttribute("redirectUrl", redirectUrl);

        return "usr/main/authFail";
    }
    
    /**
     * 로그아웃
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/logout.do")
    public String logout(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/usr/main.do";
    }
}
