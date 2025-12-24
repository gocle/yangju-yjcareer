package com.gocle.yangju.forest.usr.chinfo.service;

import java.util.List;

import com.gocle.yangju.forest.usr.chinfo.vo.SubjInfoVo;

public interface SubjInfoService {

	int selectMainTotalCount(SubjInfoVo subjInfoVo) throws Exception;
	
	List<SubjInfoVo> selectMainList(SubjInfoVo subjInfoVo) throws Exception;
}
