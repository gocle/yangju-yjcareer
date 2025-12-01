package com.gocle.yangju.forest.adm.login.service;

import com.gocle.yangju.forest.adm.login.vo.LoginVO;

public interface AdminLoginService {

	LoginVO adminLogin(LoginVO loginVO) throws Exception;

	LoginVO staffLogin(LoginVO loginVO) throws Exception;

}
