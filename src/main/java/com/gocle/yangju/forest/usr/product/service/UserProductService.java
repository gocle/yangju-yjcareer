package com.gocle.yangju.forest.usr.product.service;

import java.util.List;

import com.gocle.yangju.forest.usr.product.vo.UserProductVO;

public interface UserProductService {

	List<UserProductVO> selectProductList(UserProductVO userProductVO) throws Exception;

}
