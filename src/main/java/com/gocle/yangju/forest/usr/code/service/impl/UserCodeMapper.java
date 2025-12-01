package com.gocle.yangju.forest.usr.code.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gocle.yangju.forest.usr.code.vo.CodeVO;

@Mapper
public interface UserCodeMapper {

	List<CodeVO> codeList(CodeVO codeVO);

}
