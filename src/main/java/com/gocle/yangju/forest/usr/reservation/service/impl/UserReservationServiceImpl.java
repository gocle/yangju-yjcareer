package com.gocle.yangju.forest.usr.reservation.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.MapUtils;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.gocle.yangju.forest.adm.banner.service.AdminBannerService;
import com.gocle.yangju.forest.adm.banner.vo.BannerVO;
import com.gocle.yangju.forest.adm.chsubjopen.service.impl.EnrollManageMapper;
import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;
import com.gocle.yangju.forest.adm.chsubjopen.vo.SubjSeqManageVo;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.usr.product.vo.UserProductVO;
import com.gocle.yangju.forest.usr.program.vo.UserProgramVO;
import com.gocle.yangju.forest.usr.reservation.service.UserReservationService;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;

import egovframework.com.cmm.service.Globals;

import com.gocle.yangju.forest.usr.reservation.service.UserReservationService;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;

@Transactional(rollbackFor=Exception.class)
@Service
public class UserReservationServiceImpl extends EgovAbstractServiceImpl implements UserReservationService {

	@Autowired
	UserReservationMapper userReservationMapper;
	
	@Autowired
	EgovIdGnrService reservationIdGnrService;
	
	public List<UserReservationVO> selectReservationList(UserReservationVO userReservationVO) throws Exception {
		return userReservationMapper.selectReservationList(userReservationVO);
	}
	
	@Override
	public UserReservationVO selectReservation(UserReservationVO userReservationVO) throws Exception {
		return userReservationMapper.selectReservation(userReservationVO);
	}

	@Override
	public List<UserProgramVO> selectScheduleList(List<String> types) throws Exception {
		return userReservationMapper.selectScheduleList(types);
	}

	@Override
	public int insertReservation(UserReservationVO reservationVO) throws Exception {
		reservationVO.setResvId(reservationIdGnrService.getNextStringId());
		reservationVO.setStatus("WAIT");
		return userReservationMapper.insertReservation(reservationVO);
	}

	@Override
	public int getResvDupChk(UserReservationVO reservationVO) throws Exception {
		return userReservationMapper.getResvDupChk(reservationVO);
	}

	@Override
	public int regChk(UserReservationVO reservationVO) throws Exception {
		return userReservationMapper.regChk(reservationVO);
	}

	@Override
	public int regPlaceCnt(UserReservationVO reservationVO) throws Exception {
		return userReservationMapper.regPlaceCnt(reservationVO);
	}

	@Override
	public List<UserReservationVO> regPlace(UserReservationVO reservationVO) throws Exception {
		return userReservationMapper.regPlace(reservationVO);
	}

	@Override
	public List<UserReservationVO> selectHeadsByLocation(String pgId) throws Exception {
		return userReservationMapper.selectHeadsByLocation(pgId);
	}

	@Override
	public List<UserReservationVO> sumHeadsByDate(String pgId) throws Exception {
		return userReservationMapper.sumHeadsByDate(pgId);
	}

	@Override
	public String selectResvCheck(UserProductVO userProductVO) throws Exception {
		return userReservationMapper.selectResvCheck(userProductVO);
	}

	@Override
	public int selectTotalCount(EnrollManageVo enrollManageVo) throws Exception {
		return userReservationMapper.selectTotalCount(enrollManageVo);
	}
	
	@Override
	public List<EnrollManageVo> selectList(EnrollManageVo enrollManageVo) throws Exception {
		return userReservationMapper.selectList(enrollManageVo);
	}
	
	@Override
	public List<Map<String, Object>> selectConsultingList(EnrollManageVo enrollManageVo) throws Exception {
		return userReservationMapper.selectConsultingList(enrollManageVo);
	}
	
	@Override
	public SubjSeqManageVo selectSubjSeqEduInfo(SubjSeqManageVo subjSeqManageVo) throws Exception {
		return userReservationMapper.selectSubjSeqEduInfo(subjSeqManageVo);
	}
	
	@Override
	public Map<String, Object> selectEnrollValidInfo(EnrollManageVo enrollManageVo) throws Exception {
		return userReservationMapper.selectEnrollValidInfo(enrollManageVo);
	}
	
	@Override
	public void insertEnroll(EnrollManageVo enrollManageVo) throws Exception {
		boolean enrollIns = false;
		String errCd = "";
		
		Map<String, Object> valid = userReservationMapper.selectEnrollValidInfo(enrollManageVo);
		
		if(valid != null) {
			// 수강신청 이력이 없는 경우
			if("X".equals(valid.get("enrollStatusCd"))) {
				// 중복 신청 가능한 경우
				if(!("N".equals(valid.get("duplEnrollYn")) && MapUtils.getIntValue(valid, "subjEnrollCnt") > 0)) {
					// 수강신청 기간인 경우
					if("I".equals(valid.get("enrollDtStsCd"))) {
						// 정원 check
						if(MapUtils.getIntValue(valid, "capacity") > MapUtils.getIntValue(valid, "enrollCnt")) {
						 	// 로그인 필요 
							if(!StringUtils.hasText(enrollManageVo.getDiKey())) {
								errCd = "91";
							} else {
								enrollIns = true;
							}
						} 
						// 정원 초과
						else {
							// 대기자 초과
							if(MapUtils.getIntValue(valid, "waitCnt") >= MapUtils.getIntValue(valid, "waitEnrollCnt")) {
								errCd = "31";
							} else {
								enrollIns = true;
							}
						}
					}
					// 수강신청 기간 외
					else {
						if ("R".equals(valid.get("enrollDtStsCd"))) {
	                        errCd = "11"; // 수강신청 예정
	                    }
	                    else {
	                        errCd = "12"; // 수강신청 종료
	                    }
					}
				}
				// 중복 신청이 불가능한 경우
				else {
					errCd = "22";
				}
			} 
			// 수강신청 이력 존재
			else {
				errCd = (String) valid.get("enrollStatusCd");
			}	
		}
		// 과정 미존재(사용여부 N)
		else {
			errCd = "99";
		}
		
		if(enrollIns) {
			SubjSeqManageVo subjSeqManageVo = new SubjSeqManageVo();
			subjSeqManageVo.setSeqCd(enrollManageVo.getSeqCd());
			SubjSeqManageVo result = userReservationMapper.selectSubjSeqEduInfo(subjSeqManageVo);
			
			String enrollType = result.getEnrollType();
			int capacity = MapUtils.getIntValue(valid, "capacity");
			
			int enrollCnt = 0;
			// 1: 선착순 / 2: 승인
			if("1".equals(enrollType)) {
				enrollCnt = MapUtils.getIntValue(valid, "enrollCnt");
				if(enrollCnt < capacity) {
					enrollManageVo.setEnrollStatusCd("B");
				} else {
					enrollManageVo.setEnrollStatusCd("A");
				}
			}else {
				enrollManageVo.setEnrollStatusCd("A");
			}
			
			userReservationMapper.insertEnroll(enrollManageVo);
			// 히스토리 저장타입 - 등록(I)
			enrollManageVo.setConnectionType("I");
			// 수강등록 테이블 히스토리 입력
			userReservationMapper.insertEnrollHistory(enrollManageVo);
			
		}
		enrollManageVo.setErrCd(errCd);
	}
}
