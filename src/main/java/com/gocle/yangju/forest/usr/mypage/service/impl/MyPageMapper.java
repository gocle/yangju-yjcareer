package com.gocle.yangju.forest.usr.mypage.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gocle.yangju.forest.usr.mypage.vo.MyPageVo;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;

@Mapper
public interface MyPageMapper {

	List<UserReservationVO> myReservationList(UserReservationVO urVO) throws Exception;

	UserReservationVO myReservationView(UserReservationVO urVO) throws Exception;

	void cancelResv(UserReservationVO userReservationVO) throws Exception;

	int selectTotalCount(MyPageVo myPageVo) throws Exception;
	
	List<MyPageVo> selectList(MyPageVo myPageVo) throws Exception;
}
