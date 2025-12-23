package com.gocle.yangju.forest.usr.chinfo.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.usr.chinfo.service.SubjInfoService;
import com.gocle.yangju.forest.usr.chinfo.vo.SubjInfoVo;

@Transactional(rollbackFor = {Exception.class})
@Service(value = "subjInfoService")
public class SubjInfoServiceImpl extends EgovAbstractServiceImpl implements SubjInfoService {

	@Autowired
	SubjInfoMapper subjInfoMapper;
	
	@Autowired
	FileService fileService;
	
	@Override
	public List<SubjInfoVo> selectMainList(SubjInfoVo subjInfoVo) throws Exception {
		return subjInfoMapper.selectMainList(subjInfoVo);
	}
}
