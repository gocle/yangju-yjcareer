package com.gocle.yangju.forest.adm.stats.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.stats.service.AdminStatsService;
import com.gocle.yangju.forest.adm.stats.vo.StatsVO;


@Transactional(rollbackFor=Exception.class)
@Service
public class AdminStatsServiceImpl extends EgovAbstractServiceImpl implements AdminStatsService {

	@Autowired
	AdminStatsMapper adminStatsMapper;

	@Override
	public List<StatsVO> selectMonthStats(StatsVO statsVO) throws Exception {
		return adminStatsMapper.selectMonthStats(statsVO);
	}

	@Override
	public List<String> selectYearsByClassType(StatsVO statsVO) throws Exception {
		return adminStatsMapper.selectYearsByClassType(statsVO);
	}

	@Override
	public List<String> selectMonthByYear(StatsVO statsVO) throws Exception {
		return adminStatsMapper.selectMonthByYear(statsVO);
	}

}
