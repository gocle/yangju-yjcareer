package com.gocle.yangju.forest.usr.login.web;

import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.login.vo.LoginVO;
import com.gocle.yangju.forest.usr.login.service.UserLoginService;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.Globals;
import nice.intc.module.IntcClient;
import nice.intc.module.model.AuthResultData;
import nice.intc.module.model.IntcResultReqInfo;
import nice.intc.module.model.IntcResultResInfo;
import nice.intc.module.model.IntcUrlReqInfo;
import nice.intc.module.model.IntcUrlResInfo;

@Controller
@RequestMapping("/usr/login/")
public class UserLoginController {
	
	@Autowired
	UserLoginService userLoginService;
	
	private static final String CLIENT_ID = EgovProperties.getProperty("Globals.clientId");
	private static final String CLIENT_SECRET = EgovProperties.getProperty("Globals.clientSecret");
	
	/**
	 * 본인인증 팝업 호출
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
//	@RequestMapping("requestAuth.do")
//	@ResponseBody
//	public Map<String, String> requestAuth(HttpSession session, HttpServletRequest request, @RequestParam(value="redirectUrl", required=false) String redirectUrl) throws Exception {
//	    NiceID.Check.CPClient niceCheck = new NiceID.Check.CPClient();
//
//	    String sSiteCode = S_SITE_CODE;
//	    String sSitePassword = S_SITE_PASSWORD;
//	    String sRequestNumber = niceCheck.getRequestNO(sSiteCode);
//	    session.setAttribute("REQ_SEQ", sRequestNumber); // 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
//
//	    String sAuthType = "M";      	// 없으면 기본 선택화면, M(휴대폰), X(인증서공통), U(공동인증서), F(금융인증서), S(PASS인증서), C(신용카드)
//		String customize 	= "";		//없으면 기본 웹페이지 / Mobile : 모바일페이지
//
//	    String baseUrl = request.getScheme() + "://" + request.getServerName();
//	    if (!((request.getScheme().equals("http") && request.getServerPort() == 80)
//	          || (request.getScheme().equals("https") && request.getServerPort() == 443))) {
//	        baseUrl += ":" + request.getServerPort();
//	    }
//	    baseUrl += request.getContextPath();
//
//	    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
//		//리턴url은 인증 전 인증페이지를 호출하기 전 url과 동일해야 합니다. ex) 인증 전 url : http://www.~ 리턴 url : http://www.~
//	    String sReturnUrl = baseUrl + "/usr/login/successAuth.do";      // 성공시 이동될 URL
//	    if (redirectUrl != null && !redirectUrl.isEmpty()) {
//	        sReturnUrl += "?redirectUrl=" + URLEncoder.encode(redirectUrl, "UTF-8");
//	    }
//	    String sErrorUrl = baseUrl + "/usr/login/failAuth.do";          // 실패시 이동될 URL
//	    
//	    // 입력될 plain 데이타를 만든다.
//	    String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
//	                        "8:SITECODE" + sSiteCode.getBytes().length + ":" + sSiteCode +
//	                        "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
//	                        "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl +
//	                        "7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl +
//	                        "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize;
//
//	    int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
//	    String sEncData = "";
//	    if (iReturn == 0) {
//	        sEncData = niceCheck.getCipherData();
//	    } else {
//	        throw new RuntimeException("본인인증 암호화 실패 iReturn=" + iReturn);
//	    }
//
//	    Map<String, String> result = new HashMap<>();
//	    result.put("encData", sEncData);
//	    return result;
//	}
	/**
	 * 본인인증 팝업 호출 모듈 변경
	 * @param session
	 * @param request
	 * @param redirectUrl
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("requestAuth.do")
	@ResponseBody
	public Map<String, String> requestAuth(HttpSession session, HttpServletRequest request, @RequestParam(value="redirectUrl", required=false) String redirectUrl) throws Exception {
		
		String scheme = request.getScheme();
		String serverName = request.getServerName();
		int serverPort = request.getServerPort();
		
		String baseUrl = scheme + "://" + serverName;

		if (!(scheme.equals("http") && serverPort == 80) &&
		    !(scheme.equals("https") && serverPort == 443)) {
		    baseUrl += ":" + serverPort;
		}
		
		// 인증할 표준창 URL 요청을 위한 항목 세팅
		IntcUrlReqInfo intcUrlReqInfo = new IntcUrlReqInfo();
		// 필수 항목
		intcUrlReqInfo.setApiDomain("https://auth.niceid.co.kr");
		intcUrlReqInfo.setClientId(CLIENT_ID);
		intcUrlReqInfo.setClientSecret(CLIENT_SECRET);
		intcUrlReqInfo.setResultUrl(baseUrl + redirectUrl);
		intcUrlReqInfo.setSvcTypes(Arrays.asList("M"));
		
		// 선택 항목
		/*
		 * intcUrlReqInfo.setCloseUrl("https://your-domain/close");
		 * intcUrlReqInfo.setRequestNo("회원사 요청고유번호");
		 * intcUrlReqInfo.setMethodType(IntcCodeUtil.METHOD_TYPE.GET);
		 * intcUrlReqInfo.setExpMods(Collections.singletonList("closeButtonOn"));
		 * intcUrlReqInfo.setConnectTimeout(3000); intcUrlReqInfo.setReadTimeout(7000);
		 */
		
		//  인증할 표준창 URL 요청
		IntcClient intcClient = new IntcClient();
		IntcUrlResInfo intcUrlResInfo = intcClient.getAuthUrl(intcUrlReqInfo);
		
		//  인증할 표준창 URL 응답 처리
		if ("0000".equals(intcUrlResInfo.getReturnCode())) {
//		    System.out.println("응답코드:"+intcUrlResInfo.getReturnCode());
//		    System.out.println("응답메세지:"+intcUrlResInfo.getResultMessage());
//		    System.out.println("요청고유번호:"+intcUrlResInfo.getRequestNo());
//		    System.out.println("트랜잭션아이디:"+intcUrlResInfo.getTransactionId());
//		    System.out.println("인증요청 URL:"+intcUrlResInfo.getAuthUrl());
			session.setAttribute("transactionId", intcUrlResInfo.getTransactionId());
			session.setAttribute("requestNo", intcUrlResInfo.getRequestNo());
		} else {
		    System.out.println("응답코드:"+intcUrlResInfo.getReturnCode());
		    System.out.println("응답메세지:"+intcUrlResInfo.getResultMessage());
		}
		
		Map<String, String> result = new HashMap<>();
		result.put("authUrl", intcUrlResInfo.getAuthUrl());
		result.put("requestNo", intcUrlResInfo.getRequestNo());
		return result;
	}
	
	/**
	 * 본인인증 성공 callback 모듈변경
	 * @param request
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/successAuth.do")
    public String success(HttpServletRequest request, RedirectAttributes redirectAttributes, Model model) throws Exception {
		// 1. 인증결과 받아오기 위한 요청값 세팅
		IntcResultReqInfo intcResultReqInfo = new IntcResultReqInfo();
		
		// 표준창에서 리턴한 web_transaction_id 
		String webTransactionId = request.getParameter("web_transaction_id");
		
		if (StringUtils.isBlank(webTransactionId)) {
	        throw new IllegalStateException("web_transaction_id 없음");
	    }
		HttpSession session = request.getSession(false);
		if (session == null) {
		    throw new IllegalStateException("세션 없음");
		}
		String transactionId = (String) session.getAttribute("transactionId");
		String requestNo = (String) session.getAttribute("requestNo");
		
		if (requestNo == null || transactionId == null) {
	        throw new IllegalStateException("인증 세션 정보 없음");
	    }
		// 필수항목
		intcResultReqInfo.setApiDomain("https://auth.niceid.co.kr");
	    intcResultReqInfo.setClientId(CLIENT_ID);
	    intcResultReqInfo.setClientSecret(CLIENT_SECRET);
	    intcResultReqInfo.setWebTransactionId(webTransactionId);
	    intcResultReqInfo.setRequestNo(requestNo);
	    intcResultReqInfo.setTransactionId(transactionId);
	    // 선택항목
 		/*
 		 * intcResultReqInfo.setConnectTimeout(3000);
 		 * intcResultReqInfo.setReadTimeout(7000);
 		 */
	    
	    // 2. 인증결과 요청
	    IntcClient intcClient = new IntcClient();
	    IntcResultResInfo intcResultResInfo = intcClient.getAuthResult(intcResultReqInfo);
	    
	    String sMessage = "";
        String sDupInfo = "";
        String sName = "";
        String sBirthDate = "";
        String sGender = "";
        String sMobileNo = "";
        String sMobileCo = "";
	    // 3. 인증결과 요청에 대한 응답 처리
	    if ("0000".equals(intcResultResInfo.getReturnCode())) {
	    	session.removeAttribute("transactionId");
	        session.removeAttribute("requestNo");
//	        System.out.println("응답코드:"+intcResultResInfo.getReturnCode());
//	        System.out.println("응답메세지:"+intcResultResInfo.getResultMessage());
//	        System.out.println("인증결과-이름:"+intcResultResInfo.getAuthResultData().getName());
//	        System.out.println("인증결과-생년월일:"+intcResultResInfo.getAuthResultData().getBirthdate());
//	        System.out.println("인증결과-성별:"+intcResultResInfo.getAuthResultData().getGender());
//	        System.out.println("인증결과-내외국인:"+intcResultResInfo.getAuthResultData().getNationalInfo());
//	        System.out.println("인증결과-C1"+intcResultResInfo.getAuthResultData().getCi());
//	        System.out.println("인증결과-CI2:"+intcResultResInfo.getAuthResultData().getCi2());
//	        System.out.println("인증결과-CI업데이트버전:"+intcResultResInfo.getAuthResultData().getCiUpdate());
//	        System.out.println("인증결과-DI:"+intcResultResInfo.getAuthResultData().getDi());
//	        System.out.println("인증결과-통신사:"+intcResultResInfo.getAuthResultData().getMobileCo());
//	        System.out.println("인증결과-휴대폰번호:"+intcResultResInfo.getAuthResultData().getMobileNo());
//	        System.out.println("인증결과-아이핀가상번호:"+intcResultResInfo.getAuthResultData().getVnumber());
//	        System.out.println("인증결과-연령코드:"+intcResultResInfo.getAuthResultData().getAgeCode());
//	        System.out.println("인증결과-아이핀 가입 인증수단:"+intcResultResInfo.getAuthResultData().getAuthMethod());
	    	
	    	AuthResultData resData = intcResultResInfo.getAuthResultData();
	    	
	    	sDupInfo = resData.getDi();
            sName = resData.getName();
            sBirthDate = resData.getBirthdate();
            sGender = resData.getGender();
            sMobileNo = resData.getMobileNo();
            if (sMobileNo != null && sMobileNo.length() == 11) {
                sMobileNo = sMobileNo.substring(0,3) + "-" + sMobileNo.substring(3,7) + "-" + sMobileNo.substring(7,11);
            }
            sMobileCo = resData.getMobileCo();
            
            String usrIP = request.getHeader("HTTP_X_FORWARDED_FOR");
    		if( StringUtils.isBlank( usrIP ) || usrIP.toLowerCase().equals("unknown") ){
    			usrIP = request.getHeader("REMOTE_ADDR");
    		}
    		if( StringUtils.isBlank( usrIP ) || usrIP.toLowerCase().equals("unknown") ){
    			usrIP = request.getRemoteAddr();
    		}
    		
            LoginVO loginVO = new LoginVO();
            loginVO.setMemName(sName);
            loginVO.setHpNo(sMobileNo);
            loginVO.setDiKey(sDupInfo);
            
            session.setAttribute(Globals.SESSION_USER_VO, loginVO);
            session.setAttribute(Globals.MEM_SEQ, sDupInfo);
			session.setAttribute(Globals.DI_KEY, sDupInfo);
			session.setAttribute(Globals.PHONE, sMobileNo);
			session.setAttribute(Globals.MEM_NAME, sName);
			session.setAttribute(Globals.MEM_TYPE, "USR");
			session.setAttribute(Globals.GENDER, sGender);
			session.setAttribute(Globals.IP, usrIP);
			session.setAttribute("redirect_url", "");
			
			// 본인인증 성공 시 TB_USER에서 조회
			if(userLoginService.selectUserLogin(loginVO) == null) {
				userLoginService.insertUser(loginVO);
			}
	    } else {
	    	session.removeAttribute("transactionId");
	        session.removeAttribute("requestNo");
	        sMessage = "응답코드:"+intcResultResInfo.getReturnCode() + "응답메세지:"+intcResultResInfo.getResultMessage();
	        
	        System.out.println("응답코드:"+intcResultResInfo.getReturnCode());
	        System.out.println("응답메세지:"+intcResultResInfo.getResultMessage());
	    
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
	
//	@RequestMapping("/successAuth.do")
//  public String success(HttpServletRequest request, RedirectAttributes redirectAttributes, Model model) throws Exception {
//
//      NiceID.Check.CPClient niceCheck = new NiceID.Check.CPClient();
//
//      String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");
//
//      String sSiteCode = S_SITE_CODE; 
//      String sSitePassword = S_SITE_PASSWORD;
//
//      //복호화
//      int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);
//
//      String sMessage = "";
//      String sDupInfo = "";
//      String sName = "";
//      String sBirthDate = "";
//      String sGender = "";
//      String sMobileNo = "";
//      String sMobileCo = "";
//      String usrIP = request.getHeader("HTTP_X_FORWARDED_FOR");
//		if( StringUtils.isBlank( usrIP ) || usrIP.toLowerCase().equals("unknown") ){
//			usrIP = request.getHeader("REMOTE_ADDR");
//		}
//		if( StringUtils.isBlank( usrIP ) || usrIP.toLowerCase().equals("unknown") ){
//			usrIP = request.getRemoteAddr();
//		}
//
//      if (iReturn == 0) {
//          String sPlainData = niceCheck.getPlainData();
//          java.util.HashMap<String, String> mapResult = niceCheck.fnParse(sPlainData);
//
//          sDupInfo = mapResult.get("DI");
//          sName = mapResult.get("NAME");
//          sBirthDate = mapResult.get("BIRTHDATE");
//          sGender = mapResult.get("GENDER");
//          sMobileNo = mapResult.get("MOBILE_NO");
//          if (sMobileNo != null && sMobileNo.length() == 11) {
//              sMobileNo = sMobileNo.substring(0,3) + "-" + sMobileNo.substring(3,7) + "-" + sMobileNo.substring(7,11);
//          }
//          sMobileCo = mapResult.get("MOBILE_CO");
//
//          // 세션 REQ_SEQ 확인
//          String session_sRequestNumber = (String) request.getSession().getAttribute("REQ_SEQ");
//          String sRequestNumber = mapResult.get("REQ_SEQ");
//          if (!sRequestNumber.equals(session_sRequestNumber)) {
//              sMessage = "세션값 불일치 오류입니다.";
//              sDupInfo = null;
//          } else {
//              HttpSession session = request.getSession(true);
//              LoginVO loginVO = new LoginVO();
//              loginVO.setMemName(sName);
//              loginVO.setHpNo(sMobileNo);
//              loginVO.setDiKey(sDupInfo);
//              
//              session.setAttribute(Globals.SESSION_USER_VO, loginVO);
//              session.setAttribute(Globals.MEM_SEQ, sDupInfo);
//  			session.setAttribute(Globals.DI_KEY, sDupInfo);
//  			session.setAttribute(Globals.PHONE, sMobileNo);
//  			session.setAttribute(Globals.MEM_NAME, sName);
//  			session.setAttribute(Globals.MEM_TYPE, "USR");
//  			session.setAttribute(Globals.GENDER, sGender);
//  			session.setAttribute(Globals.IP, usrIP);
//  			session.setAttribute("redirect_url", "");
//  			
//  			// 본인인증 성공 시 TB_USER에서 조회
//  			if(userLoginService.selectUserLogin(loginVO) == null) {
//  				userLoginService.insertUser(loginVO);
//  			}
//          }
//
//      } else {
//          switch (iReturn) {
//              case -1: sMessage = "복호화 시스템 오류입니다."; break;
//              case -4: sMessage = "복호화 처리 오류입니다."; break;
//              case -5: sMessage = "복호화 해쉬 오류입니다."; break;
//              case -6: sMessage = "복호화 데이터 오류입니다."; break;
//              case -9: sMessage = "입력 데이터 오류입니다."; break;
//              case -12: sMessage = "사이트 패스워드 오류입니다."; break;
//              default: sMessage = "알 수 없는 에러입니다. iReturn: " + iReturn;
//          }
//      }
//
//      // 인증 전 접근 URL
//      String redirectUrl = request.getParameter("redirectUrl");
//      if (redirectUrl == null || redirectUrl.isEmpty()) {
//          redirectUrl = "/usr/main.do";
//      }
//      
//      model.addAttribute("message", sMessage);
//      model.addAttribute("redirectUrl", redirectUrl);
//
//      return "usr/main/authSuccess";
//  }

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
