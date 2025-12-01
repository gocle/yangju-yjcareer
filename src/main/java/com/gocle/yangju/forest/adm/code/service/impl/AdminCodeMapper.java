package com.gocle.yangju.forest.adm.code.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gocle.yangju.forest.adm.code.vo.CodeVO;

@Mapper
public interface AdminCodeMapper {

	List<CodeVO> codeConfigList(CodeVO codeVO) throws Exception;

	List<CodeVO> codeConfigFormList(CodeVO codeVO) throws Exception;

	int codeInsert(CodeVO codeVO) throws Exception;

	CodeVO selectCode(CodeVO codeVO) throws Exception;

	int codeUpdate(CodeVO codeVO) throws Exception;

	int codeDelete(CodeVO codeVO) throws Exception;

	List<CodeVO> codeUpperList() throws Exception;

	List<CodeVO> selectCodeList(CodeVO codeVO) throws Exception;

	List<CodeVO> selectAudCode(CodeVO cvo) throws Exception;

}
