package com.gocle.yangju.forest.adm.time.service.impl;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gocle.yangju.forest.adm.program.vo.ProgramVO;
import com.gocle.yangju.forest.adm.reservation.vo.ReservationVO;
import com.gocle.yangju.forest.adm.time.vo.ProgramTimeVO;

@Mapper
public interface AdminProgramTimeMapper {

	int insertSlot(ProgramTimeVO ptVO) throws Exception;

	List<ProgramTimeVO> selectProgramTimeList(ReservationVO reservationVO) throws Exception;

	List<ProgramTimeVO> selectSlotDateList(ReservationVO reservationVO) throws Exception;

	List<ProgramTimeVO> selectDayList(Map<String, Object> param) throws Exception;

	void deleteByPgId(String programId) throws Exception;

	void deleteSlot(ProgramTimeVO programTimeVO) throws Exception;

	int getApplyCnt(ProgramTimeVO programTimeVO) throws Exception;
}
