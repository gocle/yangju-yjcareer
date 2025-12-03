package com.gocle.yangju.forest.adm.chsgr.service.impl;

import com.gocle.yangju.forest.adm.chsgr.vo.SgrManageVo;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

public interface SgrManageMapper {

	List<SgrManageVo> selectList(SgrManageVo sgrManageVo) throws Exception;

	SgrManageVo select(SgrManageVo sgrManageVo) throws Exception;

}