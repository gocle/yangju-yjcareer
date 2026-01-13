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
import com.gocle.yangju.yjcareer.sms.service.SmsService;
import com.gocle.yangju.yjcareer.sms.vo.MmsMsgVO;
import com.gocle.yangju.yjcareer.sms.vo.SmsVO;


@Transactional(rollbackFor=Exception.class)
@Service
public class MyPageServiceImpl extends EgovAbstractServiceImpl implements MyPageService {

	@Autowired
	MyPageMapper myPageMapper;
	
	@Autowired
	UserReservationMapper userReservationMapper;
	
	@Autowired
	SmsService smsService;

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
		
		MyPageVo cancelVo = myPageMapper.myReservationView(myPageVo);
		
		myPageMapper.myReservationCancl(myPageVo);
		
		EnrollManageVo enrollManageVo = new EnrollManageVo();
		enrollManageVo.setSeqCd(myPageVo.getSeqCd());
		enrollManageVo.setDiKey(myPageVo.getDiKey());
		// 히스토리 저장타입 - 수정(U)
		enrollManageVo.setConnectionType("U");
		// 수강등록 테이블 히스토리 입력
		userReservationMapper.insertEnrollHistory(enrollManageVo);
		
		String tel = cancelVo.getTel();
		tel = (tel == null) ? "" : tel.replaceAll("\\-", "");
		
		if("Y".equals(cancelVo.getSmsYn()) && tel != "") {
			if(cancelVo.getHpTel1() != null && cancelVo.getHpTel2() != null && cancelVo.getHpTel3() != null) {
				try {
					String msg = cancelVo.getSubjNm() + " 교육강좌 예약이 취소 되었습니다.";
					String hpTel = cancelVo.getHpTel1() + cancelVo.getHpTel2() + cancelVo.getHpTel3();
					
					if(msg.length() > 45) {
						MmsMsgVO vo = new MmsMsgVO();
			            vo.setPhone(hpTel);
			            vo.setCallback(tel);
			            vo.setMsg(msg);
			            vo.setType("1");
			            vo.setId("edu");
			            
			            smsService.sendMms(vo);
					} else {
						SmsVO vo = new SmsVO();
			            vo.setTrPhone(hpTel);
			            vo.setTrMsg(msg);
			            vo.setTrCallback(tel);
			            vo.setTrId("edu");
			            
			            smsService.sendSms(vo);
					}
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
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
