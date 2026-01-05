package com.gocle.yangju.forest.adm.chsearch.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.chsearch.service.SearchManageService;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageVo;
import com.gocle.yangju.forest.adm.chsubjopen.vo.SubjSeqManageVo;
import com.gocle.yangju.forest.adm.company.vo.CompanyManageVo;
import com.gocle.yangju.forest.adm.login.vo.LoginVO;

@Transactional(rollbackFor = {Exception.class})
@Service(value = "searchManageService")
public class SearchManageServiceImpl extends EgovAbstractServiceImpl implements SearchManageService {
	
	@Autowired
	SearchManageMapper searchManageMapper;
	
	@Override
	public List<SubjCateManageVo> selectSgrList() throws Exception {
		return searchManageMapper.selectSgrList();
	}
	
	@Override
	public List<SubjCateManageVo> selectCateCdList(String sgrCd) throws Exception {
		return searchManageMapper.selectCateCdList(sgrCd);
	}
	
	@Override
	public List<CompanyManageVo> selectCompanyList(LoginVO loginVO) throws Exception {
		return searchManageMapper.selectCompanyList(loginVO);
	}
	
	@Override
	public List<CompanyManageVo> selectLocationList(String comId) throws Exception {
		return searchManageMapper.selectLocationList(comId);
	}
	
	@Override
	public List<SubjSeqManageVo> selectSubjSeqList(String subjCd) throws Exception {
		return searchManageMapper.selectSubjSeqList(subjCd);
	}
}
