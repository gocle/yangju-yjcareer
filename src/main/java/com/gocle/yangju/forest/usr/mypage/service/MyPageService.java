package com.gocle.yangju.forest.usr.mypage.service;

import java.util.List;

import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;

public interface MyPageService  {

	/**
	 * 나의 예약 리스트
	 * @param urVO
	 * @return
	 * @throws Exception
	 */
	List<UserReservationVO> myReservationList(UserReservationVO urVO) throws Exception;

	/**
	 * 나의 예약 상세
	 * @param urVO
	 * @return
	 * @throws Exception
	 */
	UserReservationVO myReservationView(UserReservationVO urVO) throws Exception;

	/**
	 * 예약취소
	 * @param userReservationVO
	 * @return
	 * @throws Exception
	 */
	void cancelResv(UserReservationVO userReservationVO) throws Exception;

}
