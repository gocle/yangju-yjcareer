package com.gocle.yangju.forest.adm.chsearch.service;

import java.util.List;

import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageVo;
import com.gocle.yangju.forest.adm.company.vo.CompanyManageVo;
import com.gocle.yangju.forest.adm.login.vo.LoginVO;

public interface SearchManageService {
	
	 List<SubjCateManageVo> selectSgrList() throws Exception;
	
	 List<SubjCateManageVo> selectCateCdList(String sgrCd) throws Exception;
	 
	 List<CompanyManageVo> selectCompanyList(LoginVO loginVO) throws Exception;
	 
	 List<CompanyManageVo> selectLocationList(String comId) throws Exception;
}
