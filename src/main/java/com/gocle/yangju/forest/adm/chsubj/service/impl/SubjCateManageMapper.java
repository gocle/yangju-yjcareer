package com.gocle.yangju.forest.adm.chsubj.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.gocle.spring.vo.OrderVo;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageDefaultVo;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageVo;

public interface SubjCateManageMapper {

	List<SubjCateManageVo> selectList(SubjCateManageVo subjCateManageVo);

	Integer selectNextSortOrder(SubjCateManageVo subjCateManageVo);

	SubjCateManageVo selectUpper(SubjCateManageVo subjCateManageVo);

	int insert(SubjCateManageVo subjCateManageVo);

	SubjCateManageVo select(SubjCateManageVo subjCateManageVo);

	int update(SubjCateManageVo subjCateManageVo);

	int delete(SubjCateManageVo subjCateManageVo);

	void orderUpdate(OrderVo orderVo);

}
