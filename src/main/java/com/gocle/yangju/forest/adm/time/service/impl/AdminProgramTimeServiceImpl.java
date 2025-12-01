package com.gocle.yangju.forest.adm.time.service.impl;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.program.vo.ProgramVO;
import com.gocle.yangju.forest.adm.reservation.vo.ReservationVO;
import com.gocle.yangju.forest.adm.time.service.AdminProgramTimeService;
import com.gocle.yangju.forest.adm.time.vo.ProgramTimeVO;

@Transactional(rollbackFor=Exception.class)
@Service
public class AdminProgramTimeServiceImpl extends EgovAbstractServiceImpl implements AdminProgramTimeService {

	@Autowired
	AdminProgramTimeMapper adminProgramTimeMapper;
	
	@Override
	public List<ProgramTimeVO> selectProgramTimeList(ReservationVO reservationVO) throws Exception {
		return adminProgramTimeMapper.selectProgramTimeList(reservationVO);
	}

	@Override
	public List<ProgramTimeVO> selectSlotDateList(ReservationVO reservationVO) throws Exception {
		return adminProgramTimeMapper.selectSlotDateList(reservationVO);
	}

	@Override
	public List<ProgramTimeVO> selectDayList(Map<String, Object> param) throws Exception {
		return adminProgramTimeMapper.selectDayList(param);
	}

	@Override
	public void deleteSlot(ProgramTimeVO programTimeVO) throws Exception {
		adminProgramTimeMapper.deleteSlot(programTimeVO);
	}

	@Override
	public int getApplyCnt(ProgramTimeVO programTimeVO) throws Exception {
		return adminProgramTimeMapper.getApplyCnt(programTimeVO);
	}

}
