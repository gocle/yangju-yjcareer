package com.gocle.yangju.forest.adm.product.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocle.yangju.forest.adm.product.vo.ProductVO;

public interface AdminProductService {

	/** 
	 * 목재 공예품 리스트
	 * @param productVO
	 * @return
	 * @throws Exception
	 */
	List<ProductVO> selectProductList(ProductVO productVO) throws Exception;

	/**
	 * 목재 공예품 등록
	 * @param productVO
	 * @param multiRequest
	 * @return
	 * @throws Exception
	 */
	int insertProduct(ProductVO productVO, MultipartHttpServletRequest multiRequest) throws Exception;

	/**
	 * 목재공예품 조회
	 * @param productVO
	 * @return
	 * @throws Exception
	 */
	ProductVO selectProduct(ProductVO productVO) throws Exception;

	/**
	 * 목재공예품 수정
	 * @param productVO
	 * @return
	 * @throws Exception
	 */
	int updateProduct(ProductVO productVO, MultipartHttpServletRequest multiRequest) throws Exception;

	/**
	 * 목재공예품 삭제
	 * @param productVO
	 * @return
	 * @throws Exception
	 */
	int deleteProduct(ProductVO productVO) throws Exception;
	
	

}
