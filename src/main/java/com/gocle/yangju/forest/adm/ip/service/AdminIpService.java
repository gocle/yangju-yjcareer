package com.gocle.yangju.forest.adm.ip.service;

import java.util.List;

import com.gocle.yangju.forest.adm.ip.vo.IpVO;

public interface AdminIpService {

	/**
	 * 접근가능 ip리스트
	 * @param ipVO
	 * @return
	 * @throws Exception
	 */
	List<IpVO> selectAccessIpList(IpVO ipVO) throws Exception;

	/**
	 * 접근가능 ip등록
	 * @param ipVO
	 * @return
	 * @throws Exception
	 */
	int insertAccessIp(IpVO ipVO) throws Exception;

	/**
	 * 관리자 접근 ip 삭제
	 * @param ipVO
	 * @return
	 * @throws Exception
	 */
	int deleteIp(IpVO ipVO) throws Exception;

	/**
	 * 접근가능 전체 ip리스트
	 * @param ipVO
	 * @return
	 * @throws Exception
	 */
	List<String> selectAccessAllIpList() throws Exception;
	
}
