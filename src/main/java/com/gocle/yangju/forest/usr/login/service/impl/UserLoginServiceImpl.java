package com.gocle.yangju.forest.usr.login.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.login.vo.LoginVO;
import com.gocle.yangju.forest.usr.login.service.UserLoginService;

@Transactional(rollbackFor = {Exception.class})
@Service(value = "userLoginService")
public class UserLoginServiceImpl extends EgovAbstractServiceImpl implements UserLoginService {
	
	@Autowired
	UserLoginMapper userLoginMapper;
	
	@Override
	public LoginVO selectUserLogin(LoginVO loginVO) throws Exception {
		return userLoginMapper.selectUserLogin(loginVO);
	}
	
	@Override
	public void insertUser(LoginVO loginVO) throws Exception {
		userLoginMapper.insertUser(loginVO);
	}
	
}
