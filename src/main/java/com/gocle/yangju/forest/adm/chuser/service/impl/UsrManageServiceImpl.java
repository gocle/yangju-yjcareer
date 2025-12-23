package com.gocle.yangju.forest.adm.chuser.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.chsubj.service.SubjManageService;
import com.gocle.yangju.forest.adm.chuser.service.UsrManageService;
import com.gocle.yangju.forest.adm.chuser.vo.UsrManageVo;

@Transactional(rollbackFor = {Exception.class})
@Service(value = "usrManageService")
public class UsrManageServiceImpl extends EgovAbstractServiceImpl implements UsrManageService {
	
	@Autowired
	UsrManageMapper usrManageMapper;
	
	@Override
	public int selectUserSearchTotalCount(UsrManageVo usrManageVo) throws Exception {
		return usrManageMapper.selectUserSearchTotalCount(usrManageVo);
	}
	
	@Override
	public List<UsrManageVo> selectUserSearchList(UsrManageVo usrManageVo) throws Exception {
		return usrManageMapper.selectUserSearchList(usrManageVo);
	}
	
}
