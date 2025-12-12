package com.gocle.yangju.forest.adm.chsubjopen.service;

import java.util.List;

import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;

public interface EnrollManageService {
	
	int selectTotalCount(EnrollManageVo enrollManageVo) throws Exception;
	
	List<EnrollManageVo> selectList(EnrollManageVo enrollManageVo) throws Exception;
	
	int selectEnrollDetailTotalCount(EnrollManageVo enrollManageVo) throws Exception;
	
	List<EnrollManageVo> selectEnrollDetailList(EnrollManageVo enrollManageVo) throws Exception;
	
	int insert(EnrollManageVo enrollManageVo) throws Exception;
	
	int update(EnrollManageVo enrollManageVo) throws Exception;
	
	int delete(EnrollManageVo enrollManageVo) throws Exception;
	
	void updateEnrollApply(EnrollManageVo enrollManageVo) throws Exception;
	
	void updateEnrollApplyCancel(EnrollManageVo enrollManageVo) throws Exception;
	
	EnrollManageVo selectEnrollUserInfo(EnrollManageVo enrollManageVo) throws Exception;
}
