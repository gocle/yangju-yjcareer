package com.gocle.yangju.forest.usr.mypage.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;
import com.gocle.yangju.forest.usr.mypage.vo.MyPageVo;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;

@Mapper
public interface MyPageMapper {

	int myReservationCnt(MyPageVo myPageVo) throws Exception;
	
	List<MyPageVo> myReservationList(MyPageVo myPageVo) throws Exception;

	MyPageVo myReservationView(MyPageVo myPageVo) throws Exception;

	void myReservationCancl(MyPageVo myPageVo) throws Exception;
	
	void myReservationUpdate(EnrollManageVo enrollManageVo) throws Exception;
	
	void cancelResv(UserReservationVO userReservationVO) throws Exception;
}
