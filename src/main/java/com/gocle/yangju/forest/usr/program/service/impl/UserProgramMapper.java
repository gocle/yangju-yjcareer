package com.gocle.yangju.forest.usr.program.service.impl;

import java.util.List;

import com.gocle.yangju.forest.usr.program.vo.UserProgramVO;

public interface UserProgramMapper {

	List<UserProgramVO> selectProgramList(UserProgramVO userProgramVO) throws Exception;

	UserProgramVO selectProgram(UserProgramVO userProgramVO) throws Exception;
	
}
