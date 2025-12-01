package com.gocle.yangju.forest.adm.program.service.impl;

import java.util.List;

import com.gocle.yangju.forest.adm.program.vo.ProgramVO;

public interface AdminProgramMapper {

	List<ProgramVO> selectProgramList(ProgramVO programVO) throws Exception;

	int insertProgram(ProgramVO programVO) throws Exception;

	ProgramVO selectProgram(ProgramVO programVO) throws Exception;

	int updateProgram(ProgramVO programVO) throws Exception;

	int deleteProgram(ProgramVO programVO) throws Exception;

	List<ProgramVO> locationList(ProgramVO programVO) throws Exception;

	int peopleCnt(ProgramVO programVO) throws Exception;

	String selectProgramInfo(ProgramVO programVO) throws Exception;

}
