package com.gocle.yangju.forest.usr.reservation.service;

import java.util.List;
import java.util.Map;

import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;
import com.gocle.yangju.forest.adm.chsubjopen.vo.SubjSeqManageVo;
import com.gocle.yangju.forest.usr.product.vo.UserProductVO;
import com.gocle.yangju.forest.usr.program.vo.UserProgramVO;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;

public interface UserReservationService {

	/**
	 * 프로그램신청 목록
	 * @param userReservationVO
	 * @return
	 * @throws Exception
	 */
	List<UserReservationVO> selectReservationList(UserReservationVO userReservationVO) throws Exception;
	
	/**
	 * 프로그램신청 상세
	 * @param userReservationVO
	 * @return
	 * @throws Exception
	 */
	UserReservationVO selectReservation(UserReservationVO userReservationVO) throws Exception;

	List<UserProgramVO> selectScheduleList(List<String> types) throws Exception;

	/**
	 * 프로그램 신청 등록
	 * @param reservationVO
	 * @return
	 * @throws Exception
	 */
	int insertReservation(UserReservationVO reservationVO) throws Exception;

	/**
	 * 중복 신청 조회
	 * @param reservationVO
	 * @return
	 * @throws Exception
	 */
	int getResvDupChk(UserReservationVO reservationVO) throws Exception;

	int regChk(UserReservationVO reservationVO) throws Exception;

	int regPlaceCnt(UserReservationVO reservationVO) throws Exception;

	List<UserReservationVO> regPlace(UserReservationVO reservationVO) throws Exception;

	List<UserReservationVO> selectHeadsByLocation(String pgId) throws Exception;

	List<UserReservationVO> sumHeadsByDate(String pgId) throws Exception;

	String selectResvCheck(UserProductVO userProductVO) throws Exception;
	
	int selectTotalCount(EnrollManageVo enrollManageVo) throws Exception;
	
	List<EnrollManageVo> selectList(EnrollManageVo enrollManageVo) throws Exception;
	
	List<Map<String, Object>> selectConsultingList(EnrollManageVo enrollManageVo) throws Exception;

	List<Map<String, Object>> selectProgramList(EnrollManageVo enrollManageVo) throws Exception;
	
	SubjSeqManageVo selectSubjSeqEduInfo(SubjSeqManageVo subjSeqManageVo) throws Exception;
	
	Map<String, Object> selectEnrollValidInfo(EnrollManageVo enrollManageVo) throws Exception;
	
	void insertEnroll(EnrollManageVo enrollManageVo) throws Exception;
}
