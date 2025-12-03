package com.gocle.yangju.forest.adm.chsubj.service;

import com.gocle.spring.vo.OrderVo;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageVo;

import java.util.List;

public interface SubjCateManageService {

	List<SubjCateManageVo> selectList(SubjCateManageVo subjCateManageVo) throws Exception;

	Integer selectNextSortOrder(SubjCateManageVo subjCateManageVo) throws Exception;

	SubjCateManageVo selectUpper(SubjCateManageVo subjCateManageVo) throws Exception;

	int insert(SubjCateManageVo subjCateManageVo) throws Exception;

	SubjCateManageVo select(SubjCateManageVo subjCateManageVo) throws Exception;

	int update(SubjCateManageVo subjCateManageVo) throws Exception;

	int delete(SubjCateManageVo subjCateManageVo) throws Exception;

	String orderSave(OrderVo orderVo) throws Exception;
}