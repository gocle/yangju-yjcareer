package com.gocle.yangju.forest.usr.time.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.usr.program.vo.UserProgramVO;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;
import com.gocle.yangju.forest.usr.time.service.UserProgramTimeService;
import com.gocle.yangju.forest.usr.time.vo.UserProgramTimeVO;


@Transactional(rollbackFor=Exception.class)
@Service
public class UserProgramTimeServiceImpl extends EgovAbstractServiceImpl implements UserProgramTimeService{

	@Autowired
	UserProgramTimeMapper userProgramTimeMapper;
	
	
	@Override
	public List<UserProgramTimeVO> selectTimeList(UserProgramVO userProgramVO) throws Exception {
		return userProgramTimeMapper.selectTimeList(userProgramVO);
	}


	@Override
	public List<UserProgramTimeVO> selectTimeByDate(UserProgramTimeVO userProgramTimeVO) throws Exception {
		return userProgramTimeMapper.selectTimeByDate(userProgramTimeVO);
	}


	@Override
	public UserProgramTimeVO selectTimeSlotBySlotId(UserReservationVO reservationVO) throws Exception {
		return userProgramTimeMapper.selectTimeSlotBySlotId(reservationVO);
	}

}
