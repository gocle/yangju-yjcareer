package com.gocle.yangju.forest.adm.ip.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.intro.service.AdminIntroService;
import com.gocle.yangju.forest.adm.ip.service.AdminIpService;
import com.gocle.yangju.forest.adm.ip.vo.IpVO;

@Service
@Transactional(rollbackFor=Exception.class)
public class AdminIpServiceImpl extends EgovAbstractServiceImpl implements AdminIpService{

	@Autowired
	AdminIpMapper adminIpMapper;
	
	@Override
	public List<IpVO> selectAccessIpList(IpVO ipVO) throws Exception {
		return adminIpMapper.selectAccessIpList(ipVO);
	}

	@Override
	public int insertAccessIp(IpVO ipVO) throws Exception {
		return adminIpMapper.insertAccessIp(ipVO);
	}

	@Override
	public int deleteIp(IpVO ipVO) throws Exception {
		return adminIpMapper.deleteIp(ipVO);
	}

	@Override
	public List<String> selectAccessAllIpList() throws Exception {
		return adminIpMapper.selectAccessAllIpList();
	}

}
