package com.gocle.yangju.forest.adm.chsubjopen.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.chsubjopen.service.EnrollManageService;
import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;
import com.gocle.yangju.forest.adm.chsubjopen.vo.SubjSeqManageVo;

@Transactional(rollbackFor = {Exception.class})
@Service(value = "enrollManageService")
public class EnrollManageServiceImpl extends EgovAbstractServiceImpl implements EnrollManageService {
	
	@Autowired
	EnrollManageMapper enrollManageMapper;
	
	@Autowired
	SubjSeqManageMapper subjSeqManageMapper;
	
	@Override
	public int selectTotalCountA(EnrollManageVo enrollManageVo) throws Exception {
		return enrollManageMapper.selectTotalCountA(enrollManageVo);
	}
	
	@Override
	public List<EnrollManageVo> selectListA(EnrollManageVo enrollManageVo) throws Exception {
		return enrollManageMapper.selectListA(enrollManageVo);
	}
	
	@Override
	public int selectTotalCount(EnrollManageVo enrollManageVo) throws Exception {
		return enrollManageMapper.selectTotalCount(enrollManageVo);
	}
	
	@Override
	public List<EnrollManageVo> selectList(EnrollManageVo enrollManageVo) throws Exception {
		return enrollManageMapper.selectList(enrollManageVo);
	}
	
	@Override
	public int selectEnrollDetailTotalCountA(EnrollManageVo enrollManageVo) throws Exception {
		return enrollManageMapper.selectEnrollDetailTotalCountA(enrollManageVo);
	}
	
	@Override
	public List<EnrollManageVo> selectEnrollDetailListA(EnrollManageVo enrollManageVo) throws Exception {
		return enrollManageMapper.selectEnrollDetailListA(enrollManageVo);
	}
	
	@Override
	public int selectEnrollDetailTotalCount(EnrollManageVo enrollManageVo) throws Exception {
		return enrollManageMapper.selectEnrollDetailTotalCount(enrollManageVo);
	}
	
	@Override
	public List<EnrollManageVo> selectEnrollDetailList(EnrollManageVo enrollManageVo) throws Exception {
		return enrollManageMapper.selectEnrollDetailList(enrollManageVo);
	}
	
	@Override
	public void insert(EnrollManageVo enrollManageVo) throws Exception {
		
		int userCnt = 0;
		int dupErrCnt = 0;
		
		SubjSeqManageVo subjSeqManageVo = new SubjSeqManageVo();
		subjSeqManageVo.setSeqCd(enrollManageVo.getSeqCd());
		SubjSeqManageVo result = subjSeqManageMapper.select(subjSeqManageVo);
		
		String enrollType = result.getEnrollType();
		int capacity =  Integer.parseInt(result.getCapacity());
		
		int enrollCnt = 0;
		// 1: 선착순 / 2: 승인
		if("1".equals(enrollType)) {
			enrollManageVo.setSearchEnrollStatusCd("B");
			enrollCnt = selectEnrollDetailTotalCount(enrollManageVo);
			if(enrollCnt < capacity) {
				enrollManageVo.setEnrollStatusCd("B");
			} else {
				enrollManageVo.setEnrollStatusCd("A");
			}
			enrollManageVo.setSearchEnrollStatusCd("");
		}else {
			enrollManageVo.setEnrollStatusCd("A");
		}
		
		for(String diKey : enrollManageVo.getDiKeys()) {
			enrollManageVo.setDiKey(diKey);
			
			// 현재 신청상태
			EnrollManageVo enroll = enrollManageMapper.selectEnrollUserInfo(enrollManageVo);
			
			if(enroll != null) {
				// 이미 등록된 사용자
				dupErrCnt++;
			} else {
				enrollManageMapper.insert(enrollManageVo);
				
				// 히스토리 저장타입 - 등록(I)
				enrollManageVo.setConnectionType("I");
				// 수강등록 테이블 히스토리 입력
				enrollManageMapper.insertEnrollHistory(enrollManageVo);
				
				userCnt++;
			}
		}
		
		enrollManageVo.setUserCnt(userCnt);
		enrollManageVo.setDupErrCnt(dupErrCnt);
	}
	
	@Override
	public int update(EnrollManageVo enrollManageVo) throws Exception {
		int upd = enrollManageMapper.update(enrollManageVo);
		
		// 히스토리 저장타입 - 수정(U)
		enrollManageVo.setConnectionType("U");
		// 수강등록 테이블 히스토리 입력
		enrollManageMapper.insertEnrollHistory(enrollManageVo);
				
		return upd; 
	}
	
	@Override
	public int delete(EnrollManageVo enrollManageVo) throws Exception {
		int deleteCnt = 0;
		for(String diKey : enrollManageVo.getDiKeys()) {
			String[] parts = diKey.split("_");
		    
			enrollManageVo.setSeqCd(parts[0]);
			enrollManageVo.setDiKey(parts[1]);
			
			// 히스토리 저장타입 - 삭제(D)
			enrollManageVo.setConnectionType("D");
			// 수강등록 테이블 히스토리 입력
			enrollManageMapper.insertEnrollHistory(enrollManageVo);
			
			enrollManageMapper.delete(enrollManageVo);
			deleteCnt++;
		}
		return deleteCnt;
	}
	
	@Override
	public void updateEnrollApply(EnrollManageVo enrollManageVo) throws Exception {
		int userCnt = 0;
		int dupErrCnt = 0;
		int eduErrCnt = 0;
		
		for(String diKey : enrollManageVo.getDiKeys()) {
		    String[] parts = diKey.split("_");
		    
			enrollManageVo.setSeqCd(parts[0]);
			enrollManageVo.setDiKey(parts[1]);
			
			// 현재 신청상태
			EnrollManageVo enroll = enrollManageMapper.selectEnrollUserInfo(enrollManageVo);
			
			if (enroll != null) {
				if("B".equals(enroll.getEnrollStatusCd())) {
					// 이미 수강승인된 사용자
					dupErrCnt++;
				} else {
					// 수강승인 처리
					enrollManageMapper.updateEnrollApply(enrollManageVo);
					userCnt++;
					
					// 히스토리 저장타입 - 수정(U)
					enrollManageVo.setConnectionType("U");
					// 수강등록 테이블 히스토리 입력
					enrollManageMapper.insertEnrollHistory(enrollManageVo);
				}
			} else {
				// 수강신청 이력이 없거나 삭제된 오류
				eduErrCnt++;
			}
		}
		
		enrollManageVo.setUserCnt(userCnt);
		enrollManageVo.setDupErrCnt(dupErrCnt);
		enrollManageVo.setEduErrCnt(eduErrCnt);
	}
	
	@Override
	public void updateEnrollApplyCancel(EnrollManageVo enrollManageVo) throws Exception {
		int userCnt = 0;
		int dupErrCnt = 0;
		int eduErrCnt = 0;
		
		for(String diKey : enrollManageVo.getDiKeys()) {
			String[] parts = diKey.split("_");
		    
			enrollManageVo.setSeqCd(parts[0]);
			enrollManageVo.setDiKey(parts[1]);
			
			// 현재 신청상태
			EnrollManageVo enroll = enrollManageMapper.selectEnrollUserInfo(enrollManageVo);
			
			if (enroll != null) {
				if("C".equals(enroll.getEnrollStatusCd())) {
					// 이미 승인취소된 사용자
					dupErrCnt++;
				} else {
					// 승인취소 처리
					enrollManageMapper.updateEnrollApplyCancel(enrollManageVo);
					userCnt++;
					
					// 히스토리 저장타입 - 수정(U)
					enrollManageVo.setConnectionType("U");
					// 수강등록 테이블 히스토리 입력
					enrollManageMapper.insertEnrollHistory(enrollManageVo);
				}
			} else {
				// 수강신청 이력이 없거나 삭제된 오류
				eduErrCnt++;
			}
		}
		
		enrollManageVo.setUserCnt(userCnt);
		enrollManageVo.setDupErrCnt(dupErrCnt);
		enrollManageVo.setEduErrCnt(eduErrCnt);
	}
	
	@Override
	public EnrollManageVo selectEnrollUserInfo(EnrollManageVo enrollManageVo) throws Exception {
		return enrollManageMapper.selectEnrollUserInfo(enrollManageVo);
	}
}
