package com.gocle.yangju.forest.usr.program.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocle.yangju.forest.adm.banner.service.AdminBannerService;
import com.gocle.yangju.forest.adm.banner.vo.BannerVO;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.usr.program.service.UserProgramService;
import com.gocle.yangju.forest.usr.program.vo.UserProgramVO;


@Service
public class UserProgramServiceImpl extends EgovAbstractServiceImpl implements UserProgramService {

	@Autowired
	UserProgramMapper userProgramMapper;
	
	@Override
	public List<UserProgramVO> selectProgramList(UserProgramVO userProgramVO) throws Exception {
		return userProgramMapper.selectProgramList(userProgramVO);
	}

	@Override
	public UserProgramVO selectProgram(UserProgramVO userProgramVO) throws Exception {
		return userProgramMapper.selectProgram(userProgramVO);
	}

	

}
