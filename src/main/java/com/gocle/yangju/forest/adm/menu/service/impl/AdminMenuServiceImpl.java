package com.gocle.yangju.forest.adm.menu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.menu.service.AdminMenuService;
import com.gocle.yangju.forest.adm.menu.vo.MenuVO;


@Transactional(rollbackFor=Exception.class)
@Service
public class AdminMenuServiceImpl extends EgovAbstractServiceImpl implements AdminMenuService {

	@Autowired
    private EgovIdGnrService menuIdGnrService;
	
	@Autowired
    private AdminMenuMapper adminMenuMapper;
	
	@Override
	public List<MenuVO> listMenuTree(MenuVO menuVO) throws Exception {
		List<MenuVO> data = adminMenuMapper.listMenuTree(menuVO);
		return data;
	}

	@Override
	public String insertMenu(MenuVO menuVO) throws Exception {
		String ret = "";
		String pk = menuIdGnrService.getNextStringId();
		menuVO.setMenuId(pk);
		int result = adminMenuMapper.insertMenu(menuVO);
		if(result > 0) {
			ret = pk;
		}
		return ret;
	}

	@Override
	public int updateMenu(MenuVO menuVO) throws Exception {
		int result = adminMenuMapper.updateMenu(menuVO);
		return result;
	}
	
	@Override
	public MenuVO getMenu(MenuVO menuVO) throws Exception {
		MenuVO data = adminMenuMapper.getMenu(menuVO);
		return data;
	}
}
