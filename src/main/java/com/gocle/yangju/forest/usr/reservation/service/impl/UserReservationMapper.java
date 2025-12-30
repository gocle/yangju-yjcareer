package com.gocle.yangju.forest.usr.reservation.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;
import com.gocle.yangju.forest.adm.chsubjopen.vo.SubjSeqManageVo;
import com.gocle.yangju.forest.usr.product.vo.UserProductVO;
import com.gocle.yangju.forest.usr.program.vo.UserProgramVO;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;

public interface UserReservationMapper {
	
	List<UserReservationVO> selectReservationList(UserReservationVO userReservationVO) throws Exception;
	
	UserReservationVO selectReservation(UserReservationVO userReservationVO) throws Exception;

	List<UserProgramVO> selectScheduleList(@Param("types") List<String> types) throws Exception;

	int insertReservation(UserReservationVO reservationVO) throws Exception;

	int getResvDupChk(UserReservationVO reservationVO) throws Exception;

	int regChk(UserReservationVO reservationVO) throws Exception;

	int regPlaceCnt(UserReservationVO reservationVO) throws Exception;

	List<UserReservationVO> regPlace(UserReservationVO reservationVO) throws Exception;

	List<UserReservationVO> selectHeadsByLocation(String pgId) throws Exception;

	List<UserReservationVO> sumHeadsByDate(@Param("pgId") String pgId) throws Exception;

	String selectResvCheck(UserProductVO userProductVO) throws Exception;
	
	int selectTotalCount(EnrollManageVo enrollManageVo) throws Exception;
	
	List<EnrollManageVo> selectList(EnrollManageVo enrollManageVo) throws Exception;
	
	List<Map<String, Object>> selectConsultingList(EnrollManageVo enrollManageVo) throws Exception;
	
	SubjSeqManageVo selectSubjSeqEduInfo(SubjSeqManageVo subjSeqManageVo) throws Exception;
	
	Map<String, Object> selectEnrollValidInfo(EnrollManageVo enrollManageVo) throws Exception;
	
	void insertEnroll(EnrollManageVo enrollManageVo) throws Exception;
	
	void insertEnrollHistory(EnrollManageVo enrollManageVo) throws Exception;
}
