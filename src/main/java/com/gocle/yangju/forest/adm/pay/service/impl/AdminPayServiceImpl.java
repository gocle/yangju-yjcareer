package com.gocle.yangju.forest.adm.pay.service.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.pay.service.AdminPayService;
import com.gocle.yangju.forest.adm.pay.vo.PayVO;
import com.gocle.yangju.forest.adm.program.vo.ProgramVO;

@Transactional(rollbackFor=Exception.class)
@Service
public class AdminPayServiceImpl extends EgovAbstractServiceImpl implements AdminPayService {

	@Autowired
    private EgovIdGnrService payIdGnrService;
	
	@Autowired
    private AdminPayMapper adminPayMapper;

	@Override
	public List<ProgramVO> selectProgramList(ProgramVO pvo) throws Exception {
		return adminPayMapper.selectProgramList(pvo);
	}

	@Override
	public List<PayVO> getPayList(PayVO payVO) throws Exception {
		return adminPayMapper.getPayList(payVO);
	}

	@Override
	public PayVO getPayInfo(PayVO payVO) throws Exception {
		return adminPayMapper.getPayInfo(payVO);
	}

	@Override
	public void insertPayInfo(PayVO payVO) throws Exception {
		payVO.setPayId(payIdGnrService.getNextStringId());
		adminPayMapper.insertPayInfo(payVO);
	}

	@Override
	public void updatePayInfo(PayVO payVO) throws Exception {
		adminPayMapper.updatePayInfo(payVO);
	}
}
