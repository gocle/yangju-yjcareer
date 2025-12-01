package com.gocle.yangju.forest.adm.code.service;

import java.util.List;

import com.gocle.yangju.forest.adm.code.vo.CodeVO;

public interface AdminCodeService {

	/**
	 * 관리자 코드관리 리스트조회
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */
	List<CodeVO> codeConfigList(CodeVO codeVO) throws Exception;

	List<CodeVO> codeConfigFormList(CodeVO codeVO) throws Exception;

	/**
	 * 코드 등록
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */
	int codeInsert(CodeVO codeVO) throws Exception;

	/**
	 * 코드 조회
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */
	CodeVO selectCode(CodeVO codeVO) throws Exception;

	/**
	 * 코드 수정
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */
	int codeUpdate(CodeVO codeVO) throws Exception;

	/**
	 * 코드 삭제
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */
	int codeDelete(CodeVO codeVO) throws Exception;

	/**
	 * 최상위코드 조회
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */
	List<CodeVO> codeUpperList() throws Exception;

	/**
	 * 코드조회(그룹)
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */
	List<CodeVO> selectCodeList(CodeVO codeVO) throws Exception;

	/**
	 * 특정 코드조회
	 * @param codeVO
	 * @return
	 * @throws Exception
	 */
	List<CodeVO> selectAudCode(CodeVO cvo) throws Exception;
}
