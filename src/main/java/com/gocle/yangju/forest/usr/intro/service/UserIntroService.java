package com.gocle.yangju.forest.usr.intro.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocle.yangju.forest.adm.banner.vo.BannerVO;
import com.gocle.yangju.forest.usr.intro.vo.UserIntroVO;

public interface UserIntroService {

	List<UserIntroVO> selectIntroList(UserIntroVO userIntroVO) throws Exception;

	UserIntroVO selectOneIntro(UserIntroVO userIntroVO) throws Exception;

}
