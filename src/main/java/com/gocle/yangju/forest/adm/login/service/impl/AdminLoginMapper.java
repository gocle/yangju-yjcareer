package com.gocle.yangju.forest.adm.login.service.impl;

import org.apache.ibatis.annotations.Mapper;

import com.gocle.yangju.forest.adm.login.vo.LoginVO;

@Mapper
public interface AdminLoginMapper {

	LoginVO adminLogin(LoginVO loginVO) throws Exception;

	LoginVO staffLogin(LoginVO loginVO) throws Exception;

	LoginVO selectAdminLogin(LoginVO loginVO) throws Exception;
	
	void updateAdminLoginFailCntAdd(LoginVO loginVO) throws Exception;
	
	int selectAdminLoginFailCnt(LoginVO loginVO) throws Exception;
	
	void updateAdminLoginSuccessInit(LoginVO loginVO) throws Exception;
}
