package com.gocle.yangju.forest.adm.stats.service.impl;

import java.util.List;

import com.gocle.yangju.forest.adm.stats.vo.StatsVO;

public interface AdminStatsMapper {

	List<StatsVO> selectMonthStats(StatsVO statsVO) throws Exception;

	List<String> selectYearsByClassType(StatsVO statsVO) throws Exception;

	List<String> selectMonthByYear(StatsVO statsVO) throws Exception;

}
