package com.gocle.yangju.forest.usr.code.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.usr.code.service.UserCodeService;
import com.gocle.yangju.forest.usr.code.vo.CodeVO;


@Transactional(rollbackFor=Exception.class)
@Service
public class UserCodeServiceImpl extends EgovAbstractServiceImpl implements UserCodeService {

	@Autowired
	UserCodeMapper codeMapper;
	
	@Autowired
    private EgovIdGnrService comcodeIdGnrService;
	
	@Override
	public List<CodeVO> codeList(CodeVO codeVO) throws Exception {
		List<CodeVO> resultList = codeMapper.codeList(codeVO);
		return resultList;
	}
}
