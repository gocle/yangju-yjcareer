package com.gocle.yangju.forest.adm.member.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.member.service.AdminMemberService;
import com.gocle.yangju.forest.adm.member.vo.MemberVO;


@Transactional(rollbackFor=Exception.class)
@Service
public class AdminMemberServiceImpl extends EgovAbstractServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberMapper adminMemberMapper;
	
	@Autowired
	private EgovIdGnrService memberIdGnrService;
	
	@Override
	public List<MemberVO> getMemberList(MemberVO memberVO) throws Exception {
		return adminMemberMapper.getMemberList(memberVO);
	}

	@Override
	public int memberInsert(MemberVO memberVO) throws Exception {
		memberVO.setMemSeq(memberIdGnrService.getNextStringId());
		int result = adminMemberMapper.memberInsert(memberVO);
		return result;
	}

	@Override
	public String idDupCheck(String memId) throws Exception {
		return adminMemberMapper.idDupCheck(memId);
	}

	@Override
	public MemberVO adminUpdateResult(MemberVO memberVO) throws Exception {
		return adminMemberMapper.adminUpdateResult(memberVO);
	}

	@Override
	public int memberUpdate(MemberVO memberVO) throws Exception {
		return adminMemberMapper.memberUpdate(memberVO);
	}

	@Override
	public int memberDelete(MemberVO memberVO) throws Exception {
		return adminMemberMapper.memberDelete(memberVO);
	}

	@Override
	public MemberVO getMember(MemberVO memberVO) throws Exception {
		return adminMemberMapper.getMember(memberVO);
	}

	@Override
	public int resetPassword(MemberVO mvo) throws Exception {
		return adminMemberMapper.resetPassword(mvo);
	}

}
