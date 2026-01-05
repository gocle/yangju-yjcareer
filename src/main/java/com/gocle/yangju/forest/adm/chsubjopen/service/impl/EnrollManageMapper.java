package com.gocle.yangju.forest.adm.chsubjopen.service.impl;

import java.util.List;

import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;

public interface EnrollManageMapper {
	
	int selectTotalCountA(EnrollManageVo enrollManageVo) throws Exception;
	
	List<EnrollManageVo> selectListA(EnrollManageVo enrollManageVo) throws Exception;
	
	int selectTotalCount(EnrollManageVo enrollManageVo) throws Exception;
	
	List<EnrollManageVo> selectList(EnrollManageVo enrollManageVo) throws Exception;
	
	int selectEnrollDetailTotalCountA(EnrollManageVo enrollManageVo) throws Exception;
	
	List<EnrollManageVo> selectEnrollDetailListA(EnrollManageVo enrollManageVo) throws Exception;
	
	int selectEnrollDetailTotalCount(EnrollManageVo enrollManageVo) throws Exception;
	
	List<EnrollManageVo> selectEnrollDetailList(EnrollManageVo enrollManageVo) throws Exception;
	
	void insert(EnrollManageVo enrollManageVo) throws Exception;
	
	int update(EnrollManageVo enrollManageVo) throws Exception;
	
	void delete(EnrollManageVo enrollManageVo) throws Exception;
	
	void updateEnrollApply(EnrollManageVo enrollManageVo) throws Exception;
	
	void updateEnrollApplyCancel(EnrollManageVo enrollManageVo) throws Exception;
	
	EnrollManageVo selectEnrollUserInfo(EnrollManageVo enrollManageVo) throws Exception;
	
	void insertEnrollHistory(EnrollManageVo enrollManageVo) throws Exception;
}
