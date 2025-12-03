package com.gocle.yangju.forest.adm.chsgr.service.impl;


import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.board.service.impl.AdminBoardMapper;
import com.gocle.yangju.forest.adm.chsgr.service.impl.SgrManageMapper;
import com.gocle.yangju.forest.adm.chsgr.service.SgrManageService;
import com.gocle.yangju.forest.adm.chsgr.vo.SgrManageDefaultVo;
import com.gocle.yangju.forest.adm.chsgr.vo.SgrManageVo;

@Service
public class SgrManageServiceImpl extends EgovAbstractServiceImpl implements SgrManageService {
	
	@Autowired
	SgrManageMapper sgrManageMapper;

	@Override
    public List<SgrManageVo> selectList(SgrManageVo sgrManageVo) throws Exception {
        return sgrManageMapper.selectList(sgrManageVo);
    }

	@Override
	public SgrManageVo select(SgrManageVo sgrManageVo) throws Exception {
		return sgrManageMapper.select(sgrManageVo);
	}

}