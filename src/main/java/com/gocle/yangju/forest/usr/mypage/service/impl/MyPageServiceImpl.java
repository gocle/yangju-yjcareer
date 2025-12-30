package com.gocle.yangju.forest.usr.mypage.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;
import com.gocle.yangju.forest.comm.vo.LoginInfo;
import com.gocle.yangju.forest.usr.mypage.service.MyPageService;
import com.gocle.yangju.forest.usr.mypage.vo.MyPageVo;
import com.gocle.yangju.forest.usr.reservation.service.impl.UserReservationMapper;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;


@Transactional(rollbackFor=Exception.class)
@Service
public class MyPageServiceImpl extends EgovAbstractServiceImpl implements MyPageService {

	@Autowired
	MyPageMapper myPageMapper;
	
	@Autowired
	UserReservationMapper userReservationMapper;

	@Override
	public int myReservationCnt(MyPageVo myPageVo) throws Exception {
		return myPageMapper.myReservationCnt(myPageVo);
	}
	
	@Override
	public List<MyPageVo> myReservationList(MyPageVo myPageVo) throws Exception {
		return myPageMapper.myReservationList(myPageVo);
	}
	
	@Override
	public MyPageVo myReservationView(MyPageVo myPageVo) throws Exception {
		return myPageMapper.myReservationView(myPageVo);
	}

	@Override
	public void myReservationCancl(MyPageVo myPageVo) throws Exception {
		myPageMapper.myReservationCancl(myPageVo);
		
		EnrollManageVo enrollManageVo = new EnrollManageVo();
		enrollManageVo.setSeqCd(myPageVo.getSeqCd());
		enrollManageVo.setDiKey(myPageVo.getDiKey());
		// 히스토리 저장타입 - 수정(U)
		enrollManageVo.setConnectionType("U");
		// 수강등록 테이블 히스토리 입력
		userReservationMapper.insertEnrollHistory(enrollManageVo);
	}
	
	@Override
	public void myReservationUpdate(EnrollManageVo enrollManageVo) throws Exception {
		myPageMapper.myReservationUpdate(enrollManageVo);
		// 히스토리 저장타입 - 수정(U)
		enrollManageVo.setConnectionType("U");
		// 수강등록 테이블 히스토리 입력
		userReservationMapper.insertEnrollHistory(enrollManageVo);
	}
	
	@Override
	public void cancelResv(UserReservationVO userReservationVO) throws Exception {
		myPageMapper.cancelResv(userReservationVO);
	}
	
	
}
