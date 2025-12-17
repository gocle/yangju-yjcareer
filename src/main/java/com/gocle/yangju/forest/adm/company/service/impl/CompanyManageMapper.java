package com.gocle.yangju.forest.adm.company.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.gocle.spring.vo.OrderVo;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageDefaultVo;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageVo;
import com.gocle.yangju.forest.adm.company.vo.CompanyManageVo;

public interface CompanyManageMapper {

	List<CompanyManageVo> listBoardArticle(CompanyManageVo companyManageVo) throws Exception;

	int insertBoardArticle(CompanyManageVo companyManageVo) throws Exception;

	CompanyManageVo getBoardArticle(CompanyManageVo companyManageVo) throws Exception;

	int updateBoardArticle(CompanyManageVo companyManageVo) throws Exception;

	int deleteBoardArticle(CompanyManageVo companyManageVo) throws Exception;

	void insertCompanyLocation(CompanyManageVo companyManageVo) throws Exception;
	
	void deleteCompanyLocation(CompanyManageVo companyManageVo) throws Exception;

	List<CompanyManageVo> getLocation(CompanyManageVo companyManageVo) throws Exception;
	
	void updateCompanyLocation(CompanyManageVo companyManageVo) throws Exception;
	
	List<String> selectLocIdsCompany(CompanyManageVo companyManageVo) throws Exception;
}
