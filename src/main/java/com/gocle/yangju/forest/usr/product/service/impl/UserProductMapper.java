package com.gocle.yangju.forest.usr.product.service.impl;

import java.util.List;

import com.gocle.yangju.forest.adm.product.vo.ProductVO;
import com.gocle.yangju.forest.usr.product.vo.UserProductVO;

public interface UserProductMapper {

	List<UserProductVO> selectProductList(UserProductVO userProductVO) throws Exception;

}
