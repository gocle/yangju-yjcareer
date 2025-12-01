package com.gocle.yangju.forest.adm.login.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gocle.yangju.forest.adm.login.service.AdminLoginService;
import com.gocle.yangju.forest.adm.login.vo.LoginVO;


@Service
public class AdminLoginServiceImpl extends EgovAbstractServiceImpl implements AdminLoginService  {

	@Autowired
	AdminLoginMapper adminLoginMapper;
	
	@Override
	public LoginVO adminLogin(LoginVO loginVO) throws Exception {
		return adminLoginMapper.adminLogin(loginVO);
	}

	@Override
	public LoginVO staffLogin(LoginVO loginVO) throws Exception {
		return adminLoginMapper.staffLogin(loginVO);
	}

}
