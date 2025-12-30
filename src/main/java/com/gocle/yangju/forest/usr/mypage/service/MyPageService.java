package com.gocle.yangju.forest.usr.mypage.service;

import java.util.List;

import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;
import com.gocle.yangju.forest.usr.mypage.vo.MyPageVo;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;

public interface MyPageService  {
	
	/**
	 * 나의 예약 개수
	 */
	int myReservationCnt(MyPageVo myPageVo) throws Exception;
	
	/**
	 * 나의 예약 리스트
	 */
	List<MyPageVo> myReservationList(MyPageVo myPageVo) throws Exception;

	/**
	 * 나의 예약 상세
	 */
	MyPageVo myReservationView(MyPageVo myPageVo) throws Exception;

	/**
	 * 나의 예약 취소
	 */
	void myReservationCancl(MyPageVo myPageVo) throws Exception;
	
	/**
	 * 나의 예약 수정
	 */
	void myReservationUpdate(EnrollManageVo enrollManageVo) throws Exception;
	
	/**
	 * 예약취소
	 * @param userReservationVO
	 * @return
	 * @throws Exception
	 */
	void cancelResv(UserReservationVO userReservationVO) throws Exception;

}
