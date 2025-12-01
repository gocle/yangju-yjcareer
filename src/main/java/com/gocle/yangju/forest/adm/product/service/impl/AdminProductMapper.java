package com.gocle.yangju.forest.adm.product.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gocle.yangju.forest.adm.product.vo.ProductVO;

@Mapper
public interface AdminProductMapper {

	List<ProductVO> selectProductList(ProductVO productVO) throws Exception;

	int insertProduct(ProductVO productVO) throws Exception;

	ProductVO selectProduct(ProductVO productVO) throws Exception;

	int updateProduct(ProductVO productVO) throws Exception;

	int deleteProduct(ProductVO productVO) throws Exception;
}
