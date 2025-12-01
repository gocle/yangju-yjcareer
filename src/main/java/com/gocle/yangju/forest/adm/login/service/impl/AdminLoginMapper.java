package com.gocle.yangju.forest.adm.login.service.impl;

import org.apache.ibatis.annotations.Mapper;

import com.gocle.yangju.forest.adm.login.vo.LoginVO;

@Mapper
public interface AdminLoginMapper {

	LoginVO adminLogin(LoginVO loginVO) throws Exception;

	LoginVO staffLogin(LoginVO loginVO) throws Exception;

}
