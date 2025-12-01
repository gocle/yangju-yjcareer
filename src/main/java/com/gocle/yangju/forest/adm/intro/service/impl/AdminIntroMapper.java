package com.gocle.yangju.forest.adm.intro.service.impl;

import java.util.List;

import com.gocle.yangju.forest.adm.intro.vo.IntroVO;


public interface AdminIntroMapper {

	List<IntroVO> selectIntroList(IntroVO introVO) throws Exception;

	int insertIntro(IntroVO introVO) throws Exception;

	IntroVO selectIntro(IntroVO introVO) throws Exception;

	int updateIntro(IntroVO introVO) throws Exception;

	int deleteIntro(IntroVO introVO) throws Exception;

	int introOrderUpdate(IntroVO introVO) throws Exception;

}
