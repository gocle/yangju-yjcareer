package com.gocle.yangju.forest.adm.login.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.login.service.AdminLoginService;
import com.gocle.yangju.forest.adm.login.vo.LoginVO;

import egovframework.com.cmm.service.Globals;

@Controller
@RequestMapping("/staff/")
public class StaffLoginController {

	@Autowired
	AdminLoginService adminLoginService;
	
	/**
	 * 담당자 로그인페이지
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("loginPage.do")
	public String loginPage() throws Exception {
		return "staff/login/login";
	}
	
	/**
	 * 담당자 로그인
	 * @param commandMap
	 * @param request
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("login.do")
	public String adminLogin(@RequestParam Map<String, Object> commandMap, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		
		String retMsg = "";
		String nextUrl = "";
		
		HttpSession session = request.getSession(true);
		String id = StringUtils.defaultIfBlank( (String) commandMap.get("memId"), "");
		String password = StringUtils.defaultIfBlank( (String) commandMap.get("memPassword"), "");
		
		if("".equals(id) || "".equals(password)){
			retMsg = "로그인에 실패하였습니다.";
			redirectAttributes.addFlashAttribute("retMsg", retMsg );
			return "redirect:/staff/loginPage.do";
		}
		
		String redirect_url = StringUtils.defaultIfBlank( (String) session.getAttribute("redirect_url"), "");
		String usrIP = request.getHeader("HTTP_X_FORWARDED_FOR");
		
		if( StringUtils.isBlank( usrIP ) || usrIP.toLowerCase().equals("unknown") ){
			usrIP = request.getHeader("REMOTE_ADDR");
		}
		if( StringUtils.isBlank( usrIP ) || usrIP.toLowerCase().equals("unknown") ){
			usrIP = request.getRemoteAddr();
		}
		
		LoginVO loginVO = new LoginVO();
		loginVO.setMemId(id);
		loginVO.setMemPassword(password);
		loginVO = adminLoginService.staffLogin(loginVO);
		
		if(loginVO != null) {
			session.setAttribute(Globals.SESSION_USER_VO, loginVO); 
			session.setAttribute(Globals.M_IDX, loginVO.getMemSeq());
			session.setAttribute(Globals.MEM_SEQ, loginVO.getMemSeq());
			session.setAttribute(Globals.M_ID, loginVO.getMemId());
			session.setAttribute(Globals.MEM_NAME, loginVO.getMemName());
			session.setAttribute(Globals.MEM_TYPE, loginVO.getMemType());
			session.setAttribute(Globals.EMAIL, loginVO.getEmail());
			session.setAttribute(Globals.IP, usrIP);
			session.setAttribute("redirect_url", "");
			
			if(!redirect_url.equals("")){
				 nextUrl = redirect_url;
			} else {
				String memType = (String)session.getAttribute(Globals.MEM_TYPE);
				if ("WOOD_STAFF".equals(memType)) {
			        nextUrl = "/staff/program/wood/list.do?menuId=2025MENU0000182";
			    } else if ("FOREST_STAFF".equals(memType)) {
			        nextUrl = "/staff/program/forest/list.do?menuId=2025MENU0000190";
			    }
			}
		} else {
		   retMsg = "로그인에 실패하였습니다.";
		   nextUrl = "/staff/loginPage.do";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg );
		return "redirect:" + nextUrl;
	}
	
	/**
	 * 담당자 로그아웃
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("logout.do")
	public String adminLogout(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(false);
		if (session != null) {
	        session.invalidate();
	    }
	    return "redirect:/staff/loginPage.do";
	}
}
