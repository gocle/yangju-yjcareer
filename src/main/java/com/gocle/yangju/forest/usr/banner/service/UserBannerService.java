package com.gocle.yangju.forest.usr.banner.service;

import java.util.List;

import com.gocle.yangju.forest.usr.banner.vo.BannerVO;

public interface UserBannerService {

	List<BannerVO> bannerList(BannerVO bannerVO)throws Exception; 

}
