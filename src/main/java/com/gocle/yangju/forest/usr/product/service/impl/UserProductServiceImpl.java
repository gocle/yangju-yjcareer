package com.gocle.yangju.forest.usr.product.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.product.vo.ProductVO;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.usr.product.service.UserProductService;
import com.gocle.yangju.forest.usr.product.vo.UserProductVO;


@Transactional(rollbackFor=Exception.class)
@Service
public class UserProductServiceImpl extends EgovAbstractServiceImpl implements UserProductService{

	@Autowired
	UserProductMapper userProductMapper;
	
	@Autowired
	FileService fileService;
	
	@Override
	public List<UserProductVO> selectProductList(UserProductVO userProductVO) throws Exception {
		return userProductMapper.selectProductList(userProductVO);
	}
}
