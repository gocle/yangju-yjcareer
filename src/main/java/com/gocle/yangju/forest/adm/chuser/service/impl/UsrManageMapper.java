package com.gocle.yangju.forest.adm.chuser.service.impl;

import java.util.List;

import com.gocle.yangju.forest.adm.chuser.vo.UsrManageVo;

public interface UsrManageMapper {
	
	int selectUserSearchTotalCount(UsrManageVo usrManageVo) throws Exception;
	
	List<UsrManageVo> selectUserSearchList(UsrManageVo usrManageVo) throws Exception;
	
}
