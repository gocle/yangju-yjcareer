package com.gocle.yangju.forest.usr.menu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.usr.menu.vo.MenuVO;


public interface UserMenuService {

	/**
	 * COM_MENU 에서 Data를 여러건 조회하는 로직을 수행한다.
	 * @param MenuVO
	 * @return
	 * List<MenuVO>
	 */
	List<MenuVO> listMenu(MenuVO menuVO) throws Exception;
	
	/**
	 * 목록은 조회와 동일한 검색 조건을 수행하였을 때의 총 data건수를 조회하는 SQL 을 호출한다.
	 * @param MenuVO
	 * @return
	 * @throws Exception
	 * Integer
	 */
	Integer getMenuCnt(MenuVO menuVO) throws Exception;
	
	/**
	 * COM_MENU 에서 Data를 한건 조회하는 로직을 수행한다.
	 * @param MenuVO
	 * @return
	 * MenuVO
	 */
	MenuVO getMenu(MenuVO menuVO) throws Exception;

	/**
	 * COM_MENU 에서 Data를 추가하는 로직을 수행한다.
	 * @param MenuVO
	 * @return
	 * String
	 */
	String insertMenu(MenuVO menuVO) throws Exception;

	/**
	 * COM_MENU 에서 Data를 수정하는 로직을 수행한다.
	 * @param MenuVO
	 * @return
	 * String
	 */
	int updateMenu(MenuVO menuVO) throws Exception;

	/**
	 * COM_MENU 에서 Data를 삭제하는 로직을 수행한다.
	 * @param MenuVO
	 * @return
	 * int
	 */
	int deleteMenu(MenuVO menuVO) throws Exception;

	/**
	 * COM_MENU 에서 PK값 여부로 Data를 추가 or 수정하는 로직을 수행한다.
	 * @param MenuVO
	 * @return
	 * @throws Exception
	 * MenuVO
	 */
	int saveMenu(MenuVO menuVO) throws Exception;

	/**
	 * 메소드에 대한 설명을 작성한다.
	 * @param commandMap
	 * @return
	 * List<HashMap<String,Object>>
	 * @throws Exception 
	 */
	List<HashMap<String, Object>> listMenuTree(Map<String, Object> commandMap) throws Exception;

	/**
	 * 메소드에 대한 설명을 작성한다.
	 * @param MenuVO
	 * @return
	 * @throws Exception
	 * List<MenuVO>
	 */
	List<MenuVO> listMenuTree(MenuVO menuVO) throws Exception;
	
	List<MenuVO> listTopMenu(MenuVO menuVO) throws Exception;	
	
	List<MenuVO> listSubMenu(MenuVO menuVO) throws Exception;
	
	List<MenuVO> listSubSubMenu(MenuVO menuVO) throws Exception;

	MenuVO menuInfo(MenuVO menu) throws Exception;
	
	List<MenuVO> listTopSubMenu(MenuVO menuVO) throws Exception;
}
