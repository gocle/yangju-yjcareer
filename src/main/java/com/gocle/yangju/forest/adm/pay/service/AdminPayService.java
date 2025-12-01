package com.gocle.yangju.forest.adm.pay.service;

import java.util.List;
import java.util.Map;

import com.gocle.yangju.forest.adm.pay.vo.PayVO;
import com.gocle.yangju.forest.adm.program.vo.ProgramVO;

public interface AdminPayService {

	List<ProgramVO> selectProgramList(ProgramVO pvo) throws Exception;

	/**
	 * 결제 목록
	 * @param payVO
	 * @return
	 * @throws Exception
	 */
	List<PayVO> getPayList(PayVO payVO) throws Exception;

	/**
	 * 결제정보
	 * @param payVO
	 * @return
	 * @throws Exception
	 */
	PayVO getPayInfo(PayVO payVO) throws Exception;

	/**
	 * 결제정보 등록
	 * @param vo
	 * @throws Exception
	 */
	void insertPayInfo(PayVO vo) throws Exception;

	/**
	 * 결제정보 수정
	 * @param vo
	 * @throws Exception
	 */
	void updatePayInfo(PayVO vo) throws Exception;

}
