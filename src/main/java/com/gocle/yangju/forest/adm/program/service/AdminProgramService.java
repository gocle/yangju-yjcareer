package com.gocle.yangju.forest.adm.program.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocle.yangju.forest.adm.program.vo.ProgramVO;

public interface AdminProgramService {

	/**
	 * 프로그램 리스트
	 * @param programVO
	 * @return
	 * @throws Exception
	 */
	List<ProgramVO> selectProgramList(ProgramVO programVO) throws Exception;

	/**
	 * 프로그램 등록
	 * @param programVO
	 * @param multiRequest
	 * @return
	 * @throws Exception
	 */
	int insertProgram(ProgramVO programVO, MultipartHttpServletRequest multiRequest) throws Exception;

	/**
	 * 프로그램 상세
	 * @param programVO
	 * @return
	 * @throws Exception
	 */
	ProgramVO selectProgram(ProgramVO programVO) throws Exception;

	/**
	 * 프로그램 수정
	 * @param programVO
	 * @param multiRequest
	 * @return
	 * @throws Exception
	 */
	int updateProgram(ProgramVO programVO, MultipartHttpServletRequest multiRequest) throws Exception;

	/**
	 * 프로그램 삭제
	 * @param programVO
	 * @return
	 * @throws Exception
	 */
	int deleteProgram(ProgramVO programVO) throws Exception;

	/**
	 * 프로그램 복사
	 * @param programVO
	 * @return
	 * @throws Exception
	 */
	int copyProgram(ProgramVO programVO) throws Exception;

	List<ProgramVO> locationList(ProgramVO programVO) throws Exception;

	int peopleCnt(ProgramVO programVO) throws Exception;

}
