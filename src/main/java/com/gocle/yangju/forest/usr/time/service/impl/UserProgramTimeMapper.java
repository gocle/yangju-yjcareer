package com.gocle.yangju.forest.usr.time.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gocle.yangju.forest.usr.program.vo.UserProgramVO;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;
import com.gocle.yangju.forest.usr.time.vo.UserProgramTimeVO;

@Mapper
public interface UserProgramTimeMapper {

	List<UserProgramTimeVO> selectTimeList(UserProgramVO userProgramVO) throws Exception;

	List<UserProgramTimeVO> selectTimeByDate(UserProgramTimeVO userProgramTimeVO) throws Exception;

	UserProgramTimeVO selectTimeSlotBySlotId(UserReservationVO reservationVO) throws Exception;
}
