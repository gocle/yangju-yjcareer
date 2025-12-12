package com.gocle.yangju.forest.adm.chsubjopen.service;

import java.util.List;

import com.gocle.yangju.forest.adm.chsubjopen.vo.SubjSeqManageVo;

public interface SubjSeqManageService {
	
	int selectTotalCount(SubjSeqManageVo subjSeqManageVo) throws Exception;
	
	List<SubjSeqManageVo> selectList(SubjSeqManageVo subjSeqManageVo) throws Exception;
	
	SubjSeqManageVo select(SubjSeqManageVo subjSeqManageVo) throws Exception;
	
	int insert(SubjSeqManageVo subjSeqManageVo) throws Exception;
	
	int update(SubjSeqManageVo subjSeqManageVo) throws Exception;
	
	int delete(SubjSeqManageVo subjSeqManageVo) throws Exception;
}
