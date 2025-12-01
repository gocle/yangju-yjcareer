package com.gocle.yangju.forest.adm.time.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import com.gocle.yangju.forest.adm.program.vo.ProgramVO;
import com.gocle.yangju.forest.adm.reservation.vo.ReservationVO;
import com.gocle.yangju.forest.adm.time.vo.ProgramTimeVO;

public interface AdminProgramTimeService {

	List<ProgramTimeVO> selectProgramTimeList(ReservationVO reservationVO) throws Exception;

	List<ProgramTimeVO> selectSlotDateList(ReservationVO reservationVO) throws Exception;

	List<ProgramTimeVO> selectDayList(Map<String, Object> param) throws Exception;

	void deleteSlot(ProgramTimeVO programTimeVO) throws Exception;

	int getApplyCnt(ProgramTimeVO programTimeVO) throws Exception;

}
