package com.gocle.yangju.forest.adm.login.service.impl;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gocle.yangju.forest.adm.login.service.AdminLoginService;
import com.gocle.yangju.forest.adm.login.vo.LoginVO;


@Service
public class AdminLoginServiceImpl extends EgovAbstractServiceImpl implements AdminLoginService  {

	@Autowired
	AdminLoginMapper adminLoginMapper;
	
	@Override
	public LoginVO adminLogin(LoginVO loginVO) throws Exception {
		return adminLoginMapper.adminLogin(loginVO);
	}

	@Override
	public LoginVO staffLogin(LoginVO loginVO) throws Exception {
		return adminLoginMapper.staffLogin(loginVO);
	}

	
	@Override
	public Map<String, Object> logonAdmin(LoginVO loginVO) throws Exception {
		LoginVO loginAdminVO = adminLoginMapper.selectAdminLogin(loginVO);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("LogonYn", "N");
		
		// 컨트롤러로 넘길 에러 메세지
		String logonMsg = "";
		
		if(loginAdminVO == null) {
			logonMsg = "등록되어있지 않거나, 아이디, 패스워드가 틀립니다.";
		} else {
			if(!loginVO.getEncryptPassword().equals(loginAdminVO.getMemPassword())){
				if("Y".equals(loginAdminVO.getDeleteYn()) || "Y".equals(loginAdminVO.getScsnYn())) {
					logonMsg = "삭제되었거나 탈퇴한 관리자입니다.";
				} else if("Y".equals(loginAdminVO.getLockYn())) {
					logonMsg = "잠금처리된 관리자입니다.";
				} else {
					//로그인 실패 카운트 추가 및 5회 이상이면 잠금처리
					adminLoginMapper.updateAdminLoginFailCntAdd(loginAdminVO);
					
					int loginFailCnt = adminLoginMapper.selectAdminLoginFailCnt(loginAdminVO);
					
					if(loginFailCnt > 0 && loginFailCnt <= 5) {
						logonMsg = "패스워드가 틀립니다.\\n5회이상 틀릴시 계정이 잠금처리 됩니다.("+ loginFailCnt +"/5)";
					} else {
						logonMsg = "등록되어있지 않거나, 아이디, 패스워드가 틀립니다.";
					}
				}
			} else {
				// 접근기한 날짜계산
				String permitDtYn = "Y";
				LocalDate today = LocalDate.now();
				
				if(loginAdminVO.getStartDate() != null) {
					LocalDate startDate = LocalDate.parse(loginAdminVO.getStartDate());
					if (startDate.isAfter(today)) {
						permitDtYn = "N";
					}
				}
					
				if(loginAdminVO.getEndDate() != null) {
					LocalDate endDate = LocalDate.parse(loginAdminVO.getEndDate());
					if (endDate.isBefore(today)) {
						permitDtYn = "N";
					}
				}
				
				// 비밀번호 변경일 날짜계산
				LocalDate before6Months = LocalDate.now().minusMonths(6);
				LocalDate updatePwDate = null;
				
				// 비밀번호 변경일이 Null이 아닐 때 값을 LocalDate 타입으로 변경
				if(loginAdminVO.getLastPwUpdtYmd() != null){
					updatePwDate = LocalDate.parse(loginAdminVO.getLastPwUpdtYmd());
				}
				
				if("Y".equals(loginAdminVO.getDeleteYn()) || "Y".equals(loginAdminVO.getScsnYn())) {
					logonMsg = "삭제되었거나 탈퇴한 관리자입니다.";
				} else if("Y".equals(loginAdminVO.getLockYn())) {
					logonMsg = "잠금처리된 관리자입니다.";
				} else if (loginAdminVO.getPermitIp() != null && !loginAdminVO.getPermitIp().trim().isEmpty() && !loginVO.getIp().equals(loginAdminVO.getPermitIp())){
					logonMsg = "허용된 IP가 아닙니다.";
				} else if ("N".equals(permitDtYn)) {
					logonMsg = "접속 가능한 기간이 아닙니다.";
				} else if(updatePwDate == null || updatePwDate.isBefore(before6Months)) {
					logonMsg = "비밀번호 변경이 필요합니다.";
				} else {
					adminLoginMapper.updateAdminLoginSuccessInit(loginAdminVO);
					
					resultMap.put("LogonYn", "Y");
					resultMap.put("loginAdminVO", loginAdminVO);
				}
			}
		}
		
		resultMap.put("LogonMsg", logonMsg);
		
		return resultMap;
	}
}
