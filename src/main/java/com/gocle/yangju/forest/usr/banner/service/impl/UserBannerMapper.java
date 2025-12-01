package com.gocle.yangju.forest.usr.banner.service.impl;

import java.util.List;

import com.gocle.yangju.forest.usr.banner.vo.BannerVO;

public interface UserBannerMapper {

	List<BannerVO> bannerList(BannerVO bannerVO)throws Exception;
}
