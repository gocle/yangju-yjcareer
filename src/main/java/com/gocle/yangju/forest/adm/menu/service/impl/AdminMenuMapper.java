package com.gocle.yangju.forest.adm.menu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.gocle.yangju.forest.adm.menu.vo.MenuVO;

@Mapper
public interface AdminMenuMapper {

	List<MenuVO> listMenuTree(MenuVO menuVO) throws Exception;

	int insertMenu(MenuVO menuVO) throws Exception;

	int updateMenu(MenuVO menuVO) throws Exception;

	MenuVO getMenu(MenuVO menuVO) throws Exception;
}
