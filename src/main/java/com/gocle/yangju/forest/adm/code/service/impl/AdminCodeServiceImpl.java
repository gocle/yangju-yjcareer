package com.gocle.yangju.forest.adm.code.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.code.service.AdminCodeService;
import com.gocle.yangju.forest.adm.code.vo.CodeVO;


@Transactional(rollbackFor=Exception.class)
@Service
public class AdminCodeServiceImpl extends EgovAbstractServiceImpl implements AdminCodeService {

	@Autowired
	AdminCodeMapper adminCodeMapper;
	
	@Autowired
    private EgovIdGnrService comcodeIdGnrService;
	
	@Override
	public List<CodeVO> codeConfigList(CodeVO codeVO) throws Exception {
		return adminCodeMapper.codeConfigList(codeVO);
	}

	@Override
	public List<CodeVO> codeConfigFormList(CodeVO codeVO) throws Exception {
		return adminCodeMapper.codeConfigFormList(codeVO);
	}

	@Override
	public int codeInsert(CodeVO codeVO) throws Exception {
		codeVO.setCodeId(comcodeIdGnrService.getNextStringId());
		return adminCodeMapper.codeInsert(codeVO);
	}

	@Override
	public CodeVO selectCode(CodeVO codeVO) throws Exception {
		return adminCodeMapper.selectCode(codeVO);
	}

	@Override
	public int codeUpdate(CodeVO codeVO) throws Exception {
		return adminCodeMapper.codeUpdate(codeVO);
	}

	@Override
	public int codeDelete(CodeVO codeVO) throws Exception {
		return adminCodeMapper.codeDelete(codeVO);
	}

	@Override
	public List<CodeVO> codeUpperList() throws Exception {
		return adminCodeMapper.codeUpperList();
	}

	@Override
	public List<CodeVO> selectCodeList(CodeVO codeVO) throws Exception {
		return adminCodeMapper.selectCodeList(codeVO);
	}

	@Override
	public List<CodeVO> selectAudCode(CodeVO cvo) throws Exception {
		return adminCodeMapper.selectAudCode(cvo);
	}
}
