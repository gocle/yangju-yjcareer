package com.gocle.yangju.forest.adm.chuser.service;

import java.util.List;

import com.gocle.yangju.forest.adm.chuser.vo.UsrManageVo;

public interface UsrManageService {

	int selectUserSearchTotalCount(UsrManageVo usrManageVo) throws Exception;
	
	List<UsrManageVo> selectUserSearchList(UsrManageVo usrManageVo) throws Exception;
	
}
