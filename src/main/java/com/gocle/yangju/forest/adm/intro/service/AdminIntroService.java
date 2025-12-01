package com.gocle.yangju.forest.adm.intro.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocle.yangju.forest.adm.intro.vo.IntroVO;


public interface AdminIntroService {

	/**
	 * 프로그램 리스트
	 * @param introVO
	 * @return
	 * @throws Exception
	 */
	List<IntroVO> selectIntroList(IntroVO introVO) throws Exception;

	/**
	 * 프로그램 등록
	 * @param introVO
	 * @param multiRequest
	 * @return
	 * @throws Exception
	 */
	int insertIntro(IntroVO introVO, MultipartHttpServletRequest multiRequest) throws Exception;

	/**
	 * 프로그램 상세
	 * @param introVO
	 * @return
	 * @throws Exception
	 */
	IntroVO selectIntro(IntroVO introVO) throws Exception;

	/**
	 * 프로그램 수정
	 * @param introVO
	 * @param multiRequest
	 * @return
	 * @throws Exception
	 */
	int updateIntro(IntroVO introVO, MultipartHttpServletRequest multiRequest) throws Exception;

	/**
	 * 프로그램 삭제
	 * @param introVO
	 * @return
	 * @throws Exception
	 */
	int deleteIntro(IntroVO introVO) throws Exception;

	int introOrderUpdate(IntroVO introVO) throws Exception;

}
