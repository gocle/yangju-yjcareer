package com.gocle.yangju.forest.adm.pay.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gocle.yangju.forest.adm.pay.vo.PayVO;
import com.gocle.yangju.forest.adm.program.vo.ProgramVO;

@Mapper
public interface AdminPayMapper {

	List<ProgramVO> selectProgramList(ProgramVO pvo) throws Exception;

	List<PayVO> getPayList(PayVO payVO) throws Exception;

	PayVO getPayInfo(PayVO payVO) throws Exception;

	void insertPayInfo(PayVO payVO) throws Exception;

	void updatePayInfo(PayVO payVO) throws Exception;

}
