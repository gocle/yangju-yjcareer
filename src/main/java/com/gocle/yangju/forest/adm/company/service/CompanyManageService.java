package com.gocle.yangju.forest.adm.company.service;

import java.util.List;

import com.gocle.yangju.forest.adm.company.vo.CompanyManageVo;

public interface CompanyManageService {

	List<CompanyManageVo> listBoardArticle(CompanyManageVo companyManageVo) throws Exception;

	int insertBoardArticle(CompanyManageVo companyManageVo) throws Exception;

	CompanyManageVo getBoardArticle(CompanyManageVo companyManageVo) throws Exception;

	int updateBoardArticle(CompanyManageVo companyManageVo) throws Exception;

	int deleteBoardArticle(CompanyManageVo companyManageVo) throws Exception;

	List<CompanyManageVo> getLocation(CompanyManageVo companyManageVo) throws Exception;
	
}