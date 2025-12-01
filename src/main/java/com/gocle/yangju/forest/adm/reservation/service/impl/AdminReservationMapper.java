package com.gocle.yangju.forest.adm.reservation.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gocle.yangju.forest.adm.reservation.vo.ReservationVO;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;

@Mapper
public interface AdminReservationMapper {

	List<ReservationVO> selectApplyList(ReservationVO reservationVO) throws Exception;

	int insertApply(ReservationVO reservationVO) throws Exception;

	ReservationVO selectReservation(ReservationVO reservationVO) throws Exception;

	int updateApplicant(ReservationVO reservationVO) throws Exception;

	int deleteApplicant(ReservationVO reservationVO) throws Exception;

	int getApplyCnt(String pgId) throws Exception;

	List<ReservationVO> selectApplyListF(ReservationVO reservationVO) throws Exception;

	int regPlaceCnt(ReservationVO reservationVO) throws Exception;

	List<UserReservationVO> regPlace(ReservationVO reservationVO) throws Exception;

	List<UserReservationVO> selectHeadsByLocation(String pgId) throws Exception;

	List<Map<String, Object>> selectUsedByLocation(@Param("pgId") String pgId) throws Exception;

	List<ReservationVO> selectApplyListAll(ReservationVO reservationVO) throws Exception;
}
