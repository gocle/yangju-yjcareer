package com.gocle.yangju.forest.adm.stats.service;

import java.util.List;

import com.gocle.yangju.forest.adm.stats.vo.StatsVO;

public interface AdminStatsService {

	List<StatsVO> selectMonthStats(StatsVO statsVO) throws Exception;

	/**
	 * 연도 조회
	 * @return
	 * @throws Exception
	 */
	List<String> selectYearsByClassType(StatsVO statsVO) throws Exception;

	/**
	 * 월 조회
	 * @param year
	 * @param year2 
	 * @return
	 * @throws Exception
	 */
	List<String> selectMonthByYear(StatsVO statsVO) throws Exception;

}
