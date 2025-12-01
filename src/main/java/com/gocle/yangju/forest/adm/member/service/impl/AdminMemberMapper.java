package com.gocle.yangju.forest.adm.member.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gocle.yangju.forest.adm.member.vo.MemberVO;

@Mapper
public interface AdminMemberMapper {

	List<MemberVO> getMemberList(MemberVO memberVO) throws Exception;

	int memberInsert(MemberVO memberVO) throws Exception;

	String idDupCheck(String memId) throws Exception;

	MemberVO adminUpdateResult(MemberVO memberVO) throws Exception;

	int memberUpdate(MemberVO memberVO) throws Exception;

	int memberDelete(MemberVO memberVO) throws Exception;

	MemberVO getMember(MemberVO memberVO) throws Exception;

	int resetPassword(MemberVO mvo) throws Exception;
}
