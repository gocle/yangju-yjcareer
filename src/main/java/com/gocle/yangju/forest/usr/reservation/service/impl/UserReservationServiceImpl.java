package com.gocle.yangju.forest.usr.reservation.service.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.banner.service.AdminBannerService;
import com.gocle.yangju.forest.adm.banner.vo.BannerVO;
import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;
import com.gocle.yangju.forest.adm.chsubjopen.vo.SubjSeqManageVo;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.usr.product.vo.UserProductVO;
import com.gocle.yangju.forest.usr.program.vo.UserProgramVO;
import com.gocle.yangju.forest.usr.reservation.service.UserReservationService;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;

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
}
