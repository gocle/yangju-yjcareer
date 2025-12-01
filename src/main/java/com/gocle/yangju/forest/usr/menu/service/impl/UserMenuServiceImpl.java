package com.gocle.yangju.forest.usr.menu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.menu.service.AdminMenuService;
import com.gocle.yangju.forest.usr.menu.service.UserMenuService;
import com.gocle.yangju.forest.usr.menu.vo.MenuVO;

@Transactional(rollbackFor=Exception.class)
@Service
public class UserMenuServiceImpl extends EgovAbstractServiceImpl implements UserMenuService {
	
	private static final Logger LOG = LoggerFactory.getLogger(UserMenuServiceImpl.class);

	@Autowired
    private EgovIdGnrService menuIdGnrService;
    
	@Autowired
    private UserMenuMapper menuMapper;

	@Override
	public List<MenuVO> listMenu(MenuVO menuVO) throws Exception {
		LOG.debug("listMenu");
		List<MenuVO> data = menuMapper.listMenu(menuVO);
		return data;
	}

	@Override
	public Integer getMenuCnt(MenuVO menuVO) throws Exception {
		LOG.debug("getMenuCnt");
		return menuMapper.getMenuCnt(menuVO);
	}

	@Override
	public MenuVO getMenu(MenuVO menuVO) throws Exception {
		LOG.debug("getMenu");
		MenuVO data = menuMapper.getMenu(menuVO);
		return data;
	}


	@Override
	public int saveMenu(MenuVO menuVO) throws Exception {
		LOG.debug("saveMenu");

		// PK Key 값 여부에따라 분기처리.( or MERGE INTO )
		if ( StringUtils.isBlank((String)menuVO.getMenuId()) ){
			String pkStr = menuIdGnrService.getNextStringId();
			menuVO.setMenuId(pkStr);
		}

//        LoginInfo loginInfo = new LoginInfo();
//		loginInfo.putSessionToVo(MenuVO); // session의 정보를 VO에 추가.
		return menuMapper.saveMenu(menuVO);
	}
	

	@Override
	public String insertMenu(MenuVO menuVO) throws Exception {
		LOG.debug("insertMenu");
		String returnStr = "";
		String pkStr = menuIdGnrService.getNextStringId();
		menuVO.setMenuId(pkStr);

//        LoginInfo loginInfo = new LoginInfo();
//		loginInfo.putSessionToVo(MenuVO); // session의 정보를 VO에 추가. 
		  
		int sqlResultInt = menuMapper.insertMenu(menuVO);
		if( 0 < sqlResultInt ){
			returnStr = pkStr;
		}
		return returnStr;
	}


	@Override
	public int updateMenu(MenuVO menuVO) throws Exception {
		LOG.debug("updateMenu");
//        LoginInfo loginInfo = new LoginInfo();
//		loginInfo.putSessionToVo(MenuVO); // session의 정보를 VO에 추가. 
		int sqlResultInt = menuMapper.updateMenu(menuVO); 
		return sqlResultInt;
	}


	@Override
	public int deleteMenu(MenuVO menuVO) throws Exception {
		LOG.debug("deleteMenu");
		return menuMapper.deleteMenu(menuVO);
	}

	@Override
	public List<MenuVO> listMenuTree(MenuVO menuVO) throws Exception {

		List<MenuVO> data = menuMapper.listMenuTree(menuVO);
		return data;
	}

	@Override
	public List<HashMap<String, Object>> listMenuTree(Map<String, Object> commandMap) throws Exception {

		List<HashMap<String, Object>> data = menuMapper.listMenuTree(commandMap);
		return data;
	}
	
	@Override
	public List<MenuVO> listTopMenu(MenuVO menuVO) throws Exception {
		List<MenuVO> data = menuMapper.listTopMenu(menuVO);
		return data;
	}
	
	@Override
	public List<MenuVO> listSubMenu(MenuVO menuVO) throws Exception {
		List<MenuVO> data = menuMapper.listSubMenu(menuVO);
		return data;
	}

	@Override
	public List<MenuVO> listSubSubMenu(MenuVO menuVO) throws Exception {
		List<MenuVO> data = menuMapper.listSubSubMenu(menuVO);
		return data;
	}


	@Override
	public MenuVO menuInfo(MenuVO menu) throws Exception {
		MenuVO data = menuMapper.menuInfo(menu);
		return data;
	}
}
