package com.gocle.yangju.forest.usr.menu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.gocle.yangju.forest.usr.menu.vo.MenuVO;

@Mapper
public interface UserMenuMapper {

	/**
	 * COM_MENU의 목록을 조회하는 SQL 을 호출한다.
	 * @param MenuVO
	 * @return
	 * List<MenuVO>
	 */
	List<MenuVO> listMenu(MenuVO menuVO) throws Exception;
	/**
	 * COM_MENU의 목록을 조회와 동일한 검색 조건을 수행하였을 때의 총 data건수를 조회하는 SQL 을 호출한다.
	 * @param MenuVO
	 * @return
	 * @throws Exception
	 * Integer
	 */
	Integer getMenuCnt(MenuVO menuVO) throws Exception;

	/**
	 * COM_MENU에서 단건 조회하는 SQL 을 호출한다.
	 * @param MenuVO
	 * @return
	 * MenuVO
	 */
	MenuVO getMenu(MenuVO menuVO) throws Exception;

	/**
	 *COM_MENU에  mergeInto 처리하는 SQL 을 호출한다.
	 * @param MenuVO
	 * @return
	 * MenuVO
	 */
	int saveMenu(MenuVO menuVO) throws Exception;

	/**
	 * COM_MENU에 정보를 단건 저장하는 SQL 을 호출한다.
	 * @param MenuVO
	 * @return
	 * String
	 */
	int insertMenu(MenuVO menuVO) throws Exception;

	/**
	 * COM_MENU에 정보를 수정하는 SQL 을 호출한다.
	 * @param MenuVO
	 * @return
	 * String
	 */
	int updateMenu(MenuVO menuVO) throws Exception;

	/**
	 * COM_MENU에서 정보를 삭제하는 SQL 을 호출한다.
	 * @param MenuVO
	 * @return
	 * int
	 */
	int deleteMenu(MenuVO menuVO) throws Exception;
	/**
	 * 메소드에 대한 설명을 작성한다.
	 * @param commandMap
	 * @return
	 * List<MenuVO>
	 */
	List<HashMap<String, Object>> listMenuTree(Map<String, Object> commandMap) throws Exception;
	
	List<MenuVO> listMenuTree(MenuVO menuVO) throws Exception;	
	
	List<MenuVO> listTopMenu(MenuVO menuVO) throws Exception;	
	
	List<MenuVO> listSubMenu(MenuVO menuVO) throws Exception;
	
	List<MenuVO> listSubSubMenu(MenuVO menuVO) throws Exception;
	
	MenuVO menuInfo(MenuVO menu) throws Exception;
}
