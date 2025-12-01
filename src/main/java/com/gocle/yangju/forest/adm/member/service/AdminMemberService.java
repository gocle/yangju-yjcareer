package com.gocle.yangju.forest.adm.member.service;

import java.util.List;

import com.gocle.yangju.forest.adm.member.vo.MemberVO;

public interface AdminMemberService {

	/**
	 * 관리자 회원 조회
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	List<MemberVO> getMemberList(MemberVO memberVO) throws Exception;

	/**
	 * 회원 등록
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	int memberInsert(MemberVO memberVO) throws Exception;

	/**
	 * 아이디 중복체크
	 * @param memId
	 * @return
	 * @throws Exception
	 */
	String idDupCheck(String memId) throws Exception;

	/**
	 * 회원 상세조회
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	MemberVO adminUpdateResult(MemberVO memberVO) throws Exception;

	/**
	 * 회원정보 수정
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	int memberUpdate(MemberVO memberVO) throws Exception;

	/**
	 * 회원 삭제
	 * @param memberVO
	 * @return
	 */
	int memberDelete(MemberVO memberVO) throws Exception;

	/**
	 * 회원 조회
	 * @param memberVO
	 * @return
	 */
	MemberVO getMember(MemberVO memberVO) throws Exception;

	/**
	 * 비밀번호 초기화
	 * @param mvo
	 * @return
	 * @throws Exception
	 */
	int resetPassword(MemberVO mvo) throws Exception;
}
