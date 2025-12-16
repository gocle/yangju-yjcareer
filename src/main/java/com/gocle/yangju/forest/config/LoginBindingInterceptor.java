package com.gocle.yangju.forest.config;

import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.util.UrlPathHelper;

import egovframework.com.cmm.service.Globals;

@Component("loginBinding")
public class LoginBindingInterceptor extends ControllerInterceptorAdaptor{
	
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginBindingInterceptor.class);

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		UrlPathHelper urlPathHelper = new UrlPathHelper();
		String originalURL = urlPathHelper.getOriginatingRequestUri(request);
		String contextPath = request.getContextPath();
		String path = originalURL.substring(contextPath.length());

		List<String> excludeUrls = Arrays.asList(
		    "/adm/loginPage.do",  
		    "/adm/login.do",
		    "/adm/logout.do",
		    "/staff/loginPage.do",
		    "/staff/login.do",
		    "/staff/logout.do",
		    "/adm/modifyLoginPw.do",
		    "/staff/modifyLoginPw.do"
		);

		if (excludeUrls.contains(path)) {
		    return true;
		}
		
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("redirect_url", referer);
		
		LOGGER.debug("");
		LOGGER.debug("#####################################################################################################");
		LOGGER.debug("#### CHECK URI : " + originalURL + " ####");
		LOGGER.debug("#####################################################################################################");
		LOGGER.debug("");
		
		String retMsg = "로그인이 필요한 서비스입니다.";
		String targetUrl = "";
		if(originalURL.contains("/adm/")) {
		    targetUrl = contextPath + "/adm/loginPage.do";
		}
		if(originalURL.contains("/staff/")) {
		    targetUrl = contextPath + "/staff/loginPage.do";
		}
		if(originalURL.contains("/usr/")) {
			retMsg = "잘못된 접근입니다.";
		    targetUrl = contextPath + "/usr/main.do";
		}
		
		HttpSession session = request.getSession();
		String memSeq = (String)session.getAttribute(Globals.MEM_SEQ) ;
		String memType = (String) session.getAttribute(Globals.MEM_TYPE);
		
		if(StringUtils.isEmpty(memSeq) || memType.equalsIgnoreCase("USR")) {
			retMsg = URLEncoder.encode(retMsg, "UTF-8");
			if(targetUrl.indexOf("?") != -1){
				targetUrl = targetUrl + "&retMsgEncode=" + retMsg;
			} else {
				targetUrl = targetUrl + "?retMsgEncode=" + retMsg;
			}
			response.sendRedirect( targetUrl );
			return false;
		} else {
			//IP기반 접근제한 필요시 추가
		}
		
		if (memType != null) {
			if (originalURL.contains("/adm/") && !(memType.equalsIgnoreCase("ADM") || memType.equalsIgnoreCase("OPR"))
			    || originalURL.contains("/staff/") && !memType.equalsIgnoreCase("STAFF")) {

			    response.sendError(HttpServletResponse.SC_FORBIDDEN, "권한이 없습니다.");
			    return false;
			}
        }
		return true;
	}
}
