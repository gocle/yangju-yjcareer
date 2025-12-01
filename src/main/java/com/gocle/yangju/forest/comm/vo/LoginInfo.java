package com.gocle.yangju.forest.comm.vo;

import java.io.Serializable;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.gocle.yangju.forest.adm.login.vo.LoginVO;

import egovframework.com.cmm.service.Globals;


/**
 * 로그인 세션정보
 * @author gocle_4
 *
 */
public class LoginInfo implements Serializable {

	private static final long serialVersionUID = 7690558608753861017L;

	private final Map paramMap;
	private final HttpSession session;
	public final HttpServletRequest request;
	public final HttpServletResponse response;
	public final String reqUri;
	
	public LoginInfo() {
		ServletRequestAttributes servletRequestAttribute = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletRequest httpRequest = servletRequestAttribute.getRequest();
		HttpSession httpSession = httpRequest.getSession(true);
		
		this.request = httpRequest;
		this.response = null;
		this.session = httpSession;
		this.reqUri = httpRequest.getRequestURI();
		this.paramMap = httpRequest.getParameterMap();
		this.session.setAttribute("LANGUAGE", "KOR");
	}
	
	public LoginInfo(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.session = request.getSession();
		this.reqUri = request.getRequestURI();
		this.paramMap = request.getParameterMap();
		this.session.setAttribute("LANGUAGE", "KOR");
	}
	
	public void putSessionToParameterMap(Map pMap) {
		pMap.put("sessionMemSeq", getMemSeq());
    	pMap.put("sessionMemId", getMemId());
    	pMap.put("sessionMemName", getMemName());
    	pMap.put("sessionMemType" , getMemType() );
    	pMap.put("sessionEmail" , getEmail() );
    	pMap.put("sessionDeptNo", getDeptNo());
    	pMap.put("sessionIp", getIp());
	}
	
	public void putSessionToVo(BaseVO baseVO) {
		baseVO.setSessionMemSeq(getMemSeq());
    	baseVO.setSessionMemId(getMemId());
    	baseVO.setSessionMemName(getMemName());
    	baseVO.setSessionMemType(getMemType() );
    	baseVO.setSessionEmail(getEmail() );
    	baseVO.setSessionIp(getIp());
	}
	
	public LoginVO getLoginInfo() {
		
		LoginVO vo = null;
		if(this.isLogin() && null != RequestContextHolder.getRequestAttributes()) {
			ServletRequestAttributes servletRequestAttribute = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
			HttpSession httpSession = servletRequestAttribute.getRequest().getSession(true);
			if( null != httpSession){
				if( httpSession.getAttribute(Globals.SESSION_USER_VO) instanceof LoginVO ){
					vo = (LoginVO)httpSession.getAttribute(Globals.SESSION_USER_VO);
				}else{
					//LOG
				}
			}
		}
		return vo;
	}
	
	public boolean isLogin() {
		String usrId = "";
		boolean isLogin = false;
		try {
			usrId = (String) session.getAttribute(Globals.SESSION_USER_ID);
			ServletRequestAttributes servletRequestAttribute = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
			HttpSession httpSession = servletRequestAttribute.getRequest().getSession(true);
			if( null != httpSession){
				if(StringUtils.isNotBlank(usrId) && httpSession.getAttribute(Globals.SESSION_USER_VO) instanceof LoginVO) {
					isLogin = true;
				}
			}
		} catch (Exception e) {
			//LOG
		}
		return isLogin;
	}
	
	public String getAttribute(String pAttributeName) {
		String rtnValue;
		if (session == null)
			return "";
		try {
			rtnValue = (String) session.getAttribute(pAttributeName);
			if (rtnValue == null)
				return "";
		} catch (Exception e) {
			return "";
		}
		return rtnValue;
	}
	
	public String getMemSeq() {
        return getAttribute(Globals.MEM_SEQ);
    }
	
	public String getMemId() {
        return getAttribute(Globals.M_ID);
    }
	
	public String getMemName() {
        return getAttribute(Globals.MEM_NAME);
    }
	
	public String getMemType() {
        return getAttribute(Globals.MEM_TYPE);
    }
	
	public String getEmail() {
        return getAttribute(Globals.EMAIL);
    }
	
	public String getDeptNo(){
    	return getAttribute(Globals.DEPT_NO);
    }
	
	public String getIp(){
    	return getAttribute(Globals.IP);
    }
}
