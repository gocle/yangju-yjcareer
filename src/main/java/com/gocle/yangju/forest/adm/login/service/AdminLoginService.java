package com.gocle.yangju.forest.adm.login.service;

import java.util.Map;

import com.gocle.yangju.forest.adm.login.vo.LoginVO;

public interface AdminLoginService {

	LoginVO adminLogin(LoginVO loginVO) throws Exception;

	LoginVO staffLogin(LoginVO loginVO) throws Exception;

	Map<String, Object> logonAdmin(LoginVO loginVO) throws Exception;
	
	Map<String, Object> logonStaff(LoginVO loginVO) throws Exception;
}
