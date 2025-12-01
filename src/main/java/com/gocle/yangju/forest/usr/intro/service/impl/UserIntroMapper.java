package com.gocle.yangju.forest.usr.intro.service.impl;

import java.util.List;

import com.gocle.yangju.forest.usr.intro.vo.UserIntroVO;

public interface UserIntroMapper {

	List<UserIntroVO> selectIntroList(UserIntroVO userIntroVO) throws Exception;

	UserIntroVO selectOneIntro(UserIntroVO userIntroVO) throws Exception;
}
