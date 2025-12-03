package com.gocle.yangju.forest.adm.chsgr.service;

import com.gocle.yangju.forest.adm.chsgr.vo.SgrManageVo;

import java.util.List;

public interface SgrManageService {

	List<SgrManageVo> selectList(SgrManageVo sgrManageVo) throws Exception;

	SgrManageVo select(SgrManageVo sgrManageVo) throws Exception;

}
