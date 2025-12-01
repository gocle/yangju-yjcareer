package com.gocle.yangju.forest.usr.mypage.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.usr.mypage.service.MyPageService;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;


@Transactional(rollbackFor=Exception.class)
@Service
public class MyPageServiceImpl extends EgovAbstractServiceImpl implements MyPageService {

	@Autowired
	MyPageMapper myPageMapper;
	
	
	@Override
	public List<UserReservationVO> myReservationList(UserReservationVO urVO) throws Exception {
		return myPageMapper.myReservationList(urVO);
	}

	@Override
	public UserReservationVO myReservationView(UserReservationVO urVO) throws Exception {
		return myPageMapper.myReservationView(urVO);
	}

	@Override
	public void cancelResv(UserReservationVO userReservationVO) throws Exception {
		myPageMapper.cancelResv(userReservationVO);
	}
	
}
