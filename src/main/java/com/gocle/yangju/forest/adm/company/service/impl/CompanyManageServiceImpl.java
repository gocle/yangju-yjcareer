package com.gocle.yangju.forest.adm.company.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.company.service.CompanyManageService;
import com.gocle.yangju.forest.adm.company.vo.CompanyManageVo;



@Transactional(rollbackFor = {Exception.class})
@Service(value = "companyManageService")
public class CompanyManageServiceImpl extends EgovAbstractServiceImpl implements CompanyManageService {

	@Autowired
	CompanyManageMapper companyManageMapper;
	
	@Autowired
	EgovIdGnrService companyIdGnrService;

	@Override
	public List<CompanyManageVo> listBoardArticle(CompanyManageVo companyManageVo) throws Exception{
		
		return companyManageMapper.listBoardArticle(companyManageVo);
	}

	@Override
	public int insertBoardArticle(CompanyManageVo companyManageVo) throws Exception {
		
		companyManageVo.setComId(companyIdGnrService.getNextStringId());
		
		int data = companyManageMapper.insertBoardArticle(companyManageVo);
		
		String[] locations = companyManageVo.getLocation().split(",");
		
		for (int i = 0; i < locations.length; i++) {

		    String loc = locations[i].trim(); // 공백 제거
		    if (loc.isEmpty()) continue;      // 빈 값은 건너뛰기

		    companyManageVo.setSeqNo(i + 1);  // i=0 → seq 1
		    companyManageVo.setLocation(loc); // 각 location 세팅

		    companyManageMapper.insertCompanyLocation(companyManageVo);
		}
		
		return data;
	}

	@Override
	public CompanyManageVo getBoardArticle(CompanyManageVo companyManageVo) throws Exception {
		
		return companyManageMapper.getBoardArticle(companyManageVo);
	}

	@Override
	public int updateBoardArticle(CompanyManageVo companyManageVo) throws Exception {
		
		int data = companyManageMapper.updateBoardArticle(companyManageVo);
		
		companyManageMapper.deleteCompanyLocation(companyManageVo);
		
		String[] locations = companyManageVo.getLocation().split(",");
		
		for (int i = 0; i < locations.length; i++) {

		    String loc = locations[i].trim(); // 공백 제거
		    if (loc.isEmpty()) continue;      // 빈 값은 건너뛰기

		    companyManageVo.setSeqNo(i + 1);  // i=0 → seq 1
		    companyManageVo.setLocation(loc); // 각 location 세팅

		    companyManageMapper.insertCompanyLocation(companyManageVo);
		}
		
		return data;
	}
	
	@Override
	public int deleteBoardArticle(CompanyManageVo companyManageVo) throws Exception {
		
		int data = companyManageMapper.deleteBoardArticle(companyManageVo);
		
		companyManageMapper.deleteCompanyLocation(companyManageVo);
		
		return data;
	}

	@Override
	public List<CompanyManageVo> getLocation(CompanyManageVo companyManageVo) throws Exception {
		
		return companyManageMapper.getLocation(companyManageVo);
	}
	
}
