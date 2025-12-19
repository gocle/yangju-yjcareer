package com.gocle.yangju.forest.usr.login.service;

import com.gocle.yangju.forest.adm.login.vo.LoginVO;

public interface UserLoginService {
	
	LoginVO selectUserLogin(LoginVO loginVO) throws Exception;
	
	void insertUser(LoginVO loginVO) throws Exception;
	
}
