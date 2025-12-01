package com.gocle.yangju.forest.adm.reservation.service;

import java.util.List;
import java.util.Map;

import com.gocle.yangju.forest.adm.reservation.vo.ReservationVO;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;

public interface AdminReservationService {

	/**
	 * 신청자 목록
	 * @param reservationVO
	 * @return
	 * @throws Exception
	 */
	List<ReservationVO> selectApplyList(ReservationVO reservationVO) throws Exception;

	/**
	 * 신청자 등록
	 * @param reservationVO
	 * @return
	 * @throws Exception
	 */
	int insertApply(ReservationVO reservationVO) throws Exception;

	/**
	 * 신청자 상세 조회
	 * @param reservationVO
	 * @return
	 * @throws Exception
	 */
	ReservationVO selectReservation(ReservationVO reservationVO) throws Exception;

	/**
	 * 신청자 정보 수정
	 * @param reservationVO
	 * @return
	 * @throws Exception
	 */
	int updateApplicant(ReservationVO reservationVO) throws Exception;

	/**
	 * 신청자 삭제
	 * @param reservationVO
	 * @return
	 * @throws Exception
	 */
	int deleteApplicant(ReservationVO reservationVO) throws Exception;

	/**
	 * 신청자 수 조회
	 * @param pgId
	 * @return
	 */
	int getApplyCnt(String pgId) throws Exception;

	int regPlaceCnt(ReservationVO reservationVO) throws Exception;

	List<UserReservationVO> regPlace(ReservationVO reservationVO) throws Exception;

	List<UserReservationVO> selectHeadsByLocation(String pgId) throws Exception;

	List<Map<String, Object>> selectUsedByLocation(String pgId) throws Exception;

	/**
	 * 신청자 목록 전체
	 * @param reservationVO
	 * @return
	 * @throws Exception
	 */
	List<ReservationVO> selectApplyListAll(ReservationVO reservationVO) throws Exception;

}
