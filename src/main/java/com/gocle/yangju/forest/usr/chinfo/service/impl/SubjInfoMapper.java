package com.gocle.yangju.forest.usr.chinfo.service.impl;

import java.util.List;

import com.gocle.yangju.forest.usr.chinfo.vo.SubjInfoVo;

public interface SubjInfoMapper {

	int selectMainTotalCount(SubjInfoVo subjInfoVo) throws Exception;
	
	List<SubjInfoVo> selectMainList(SubjInfoVo subjInfoVo) throws Exception;
	
}
