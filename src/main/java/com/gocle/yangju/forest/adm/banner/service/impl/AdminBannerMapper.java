package com.gocle.yangju.forest.adm.banner.service.impl;

import java.util.List;

import com.gocle.yangju.forest.adm.banner.vo.BannerVO;

public interface AdminBannerMapper {

	List<BannerVO> selectBannerList(BannerVO bannerVO) throws Exception;

	int insertBanner(BannerVO bannerVO) throws Exception;

	BannerVO selectBanner(BannerVO bannerVO) throws Exception;

	int updateBanner(BannerVO bannerVO) throws Exception;

	int deleteBanner(BannerVO bannerVO) throws Exception;
}
