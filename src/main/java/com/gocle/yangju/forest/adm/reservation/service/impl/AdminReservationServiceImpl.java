package com.gocle.yangju.forest.adm.reservation.service.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.program.service.impl.AdminProgramMapper;
import com.gocle.yangju.forest.adm.program.vo.ProgramVO;
import com.gocle.yangju.forest.adm.reservation.service.AdminReservationService;
import com.gocle.yangju.forest.adm.reservation.vo.ReservationVO;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;


@Transactional(rollbackFor=Exception.class)
@Service
public class AdminReservationServiceImpl extends EgovAbstractServiceImpl implements AdminReservationService {

	@Autowired
	AdminReservationMapper adminReservationMapper;
	
	@Autowired
	AdminProgramMapper adminProgramMapper;
	
	@Autowired
	EgovIdGnrService reservationIdGnrService;

	@Override
	public List<ReservationVO> selectApplyList(ReservationVO reservationVO) throws Exception {
		
		List<ReservationVO> result = null;
		
		if(reservationVO.getPgType().equals("wood")) {
			result = adminReservationMapper.selectApplyList(reservationVO);
		} else if(reservationVO.getPgType().equals("forest")) {
			result = adminReservationMapper.selectApplyListF(reservationVO);
		}
		
		return result;
	}

	@Override
	public int insertApply(ReservationVO reservationVO) throws Exception {
		reservationVO.setResvId(reservationIdGnrService.getNextStringId());
		
		if(reservationVO.getPgType().equals("forest")) {
			ProgramVO programVO = new ProgramVO();
			programVO.setPgId(reservationVO.getPgId());
			programVO.setPgType(reservationVO.getPgType());
			programVO.setPgCode(reservationVO.getPgCode());
			programVO.setLocation(reservationVO.getLocation());
			
			String programDt = adminProgramMapper.selectProgramInfo(programVO);
			reservationVO.setProgramDt(programDt);
		}
		
		return adminReservationMapper.insertApply(reservationVO);
	}

	@Override
	public ReservationVO selectReservation(ReservationVO reservationVO) throws Exception {
		return adminReservationMapper.selectReservation(reservationVO);
	}

	@Override
	public int updateApplicant(ReservationVO reservationVO) throws Exception {
		return adminReservationMapper.updateApplicant(reservationVO);
	}

	@Override
	public int deleteApplicant(ReservationVO reservationVO) throws Exception {
		return adminReservationMapper.deleteApplicant(reservationVO);
	}

	@Override
	public int getApplyCnt(String pgId) throws Exception {
		return adminReservationMapper.getApplyCnt(pgId);
	}

	@Override
	public int regPlaceCnt(ReservationVO reservationVO) throws Exception {
		return adminReservationMapper.regPlaceCnt(reservationVO);
	}

	@Override
	public List<UserReservationVO> regPlace(ReservationVO reservationVO) throws Exception {
		return adminReservationMapper.regPlace(reservationVO);
	}

	@Override
	public List<UserReservationVO> selectHeadsByLocation(String pgId) throws Exception {
		return adminReservationMapper.selectHeadsByLocation(pgId);
	}

	@Override
	public List<Map<String, Object>> selectUsedByLocation(String pgId) throws Exception {
		return adminReservationMapper.selectUsedByLocation(pgId);
	}

	@Override
	public List<ReservationVO> selectApplyListAll(ReservationVO reservationVO) throws Exception {
		return adminReservationMapper.selectApplyListAll(reservationVO);
	}
}
