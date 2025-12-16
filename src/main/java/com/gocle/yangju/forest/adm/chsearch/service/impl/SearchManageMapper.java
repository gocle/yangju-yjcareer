package com.gocle.yangju.forest.adm.chsearch.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageVo;
import com.gocle.yangju.forest.adm.company.vo.CompanyManageVo;
import com.gocle.yangju.forest.adm.login.vo.LoginVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;

public interface SearchManageMapper {
	
	List<SubjCateManageVo> selectSgrList() throws Exception;
	
	List<SubjCateManageVo> selectCateCdList(@Param("sgrCd") String sgrCd) throws Exception;
	
	List<CompanyManageVo> selectCompanyList(LoginVO loginVO) throws Exception;
}
