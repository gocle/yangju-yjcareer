package com.gocle.yangju.forest.usr.login.service.impl;

import com.gocle.yangju.forest.adm.login.vo.LoginVO;

public interface UserLoginMapper {

	LoginVO selectUserLogin(LoginVO loginVO) throws Exception;
	
	void insertUser(LoginVO loginVO) throws Exception;
	
}
