package com.gocle.yangju.forest.adm.chsubj.service.impl;

import java.util.List;

import com.gocle.yangju.forest.adm.chsubj.vo.SubjManageVo;

public interface SubjManageMapper {
	
	int selectTotalCount(SubjManageVo subjManageVo) throws Exception;
	
	List<SubjManageVo> selectList(SubjManageVo subjManageVo) throws Exception;
	
	String selectSubjCd(SubjManageVo subjManageVo) throws Exception;
	
	int insert(SubjManageVo subjManageVo) throws Exception;
	
	SubjManageVo select(SubjManageVo subjManageVo) throws Exception;
	
	int update(SubjManageVo subjManageVo) throws Exception;
	
	int delete(SubjManageVo subjManageVo) throws Exception;
	
	int selectSubjSubSubSeqCnt(SubjManageVo subjManageVo) throws Exception;
}
