package com.gocle.yangju.forest.adm.banner.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocle.yangju.forest.adm.banner.vo.BannerVO;

public interface AdminBannerService {

	/**
	 * 배너/팝업목록
	 * @param bannerVO
	 * @return
	 * @throws Exception
	 */
	List<BannerVO> selectBannerList(BannerVO bannerVO) throws Exception;

	/**
	 * 배너/팝업 등록
	 * @param bannerVO
	 * @param multiRequest
	 * @return
	 * @throws Exception
	 */
	int insertBanner(BannerVO bannerVO, MultipartHttpServletRequest multiRequest) throws Exception;

	/**
	 * 배너/팝업 조회
	 * @param bannerVO
	 * @return
	 * @throws Exception
	 */
	BannerVO selectBanner(BannerVO bannerVO) throws Exception;

	/**
	 * 배너/팝업 수정
	 * @param bannerVO
	 * @param multiRequest
	 * @return
	 * @throws Exception
	 */
	int updateBanner(BannerVO bannerVO, MultipartHttpServletRequest multiRequest) throws Exception;

	/**
	 * 배너/팝업 삭제
	 * @param bannerVO
	 * @return
	 * @throws Exception
	 */
	int deleteBanner(BannerVO bannerVO) throws Exception;

}
