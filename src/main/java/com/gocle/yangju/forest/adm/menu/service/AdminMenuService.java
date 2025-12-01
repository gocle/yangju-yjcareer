package com.gocle.yangju.forest.adm.menu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.menu.vo.MenuVO;

public interface AdminMenuService {

	/**
	 * 메뉴 트리 조회
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */
	List<MenuVO> listMenuTree(MenuVO menuVO) throws Exception;

	/**
	 * 메뉴등록
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */
	String insertMenu(MenuVO menuVO) throws Exception;

	/**
	 * 메뉴수정
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */
	int updateMenu(MenuVO menuVO) throws Exception;

	/**
	 * 메뉴트리 조회
	 * @param menuVO
	 * @return
	 * @throws Exception
	 */
	MenuVO getMenu(MenuVO menuVO) throws Exception;
}
