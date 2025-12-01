package com.gocle.yangju.forest.usr.program.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocle.yangju.forest.adm.banner.vo.BannerVO;
import com.gocle.yangju.forest.usr.program.vo.UserProgramVO;

public interface UserProgramService {

	List<UserProgramVO> selectProgramList(UserProgramVO userProgramVO) throws Exception;

	UserProgramVO selectProgram(UserProgramVO userProgramVO) throws Exception;

	

}
