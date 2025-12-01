package com.gocle.yangju.forest.adm.menu.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.menu.service.AdminMenuService;
import com.gocle.yangju.forest.adm.menu.vo.MenuVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;

/**
 * @author uj
 *
 */
@Controller
@RequestMapping("/adm/menu/")
public class AdminMenuController {

	@Autowired
	private AdminMenuService adminMenuService;
	
	/**
	 * 사이드 레이아웃 호출
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("leftMenu.do")
    public String leftMenu(HttpServletRequest request, HttpServletResponse response
    		, @RequestParam Map<String, Object> commandMap, ModelMap model ) throws Exception {
        
		String rootMenuId = StringUtils.defaultIfBlank( (String)commandMap.get("rootMenuId") , (String)model.get("rootMenuId") );
		String menuId = StringUtils.defaultIfBlank( (String)commandMap.get("menuId") , (String)model.get("menuId") );
		
		
		HashMap<String, Object> menuList = new HashMap<String, Object>();
		MenuVO menuVO = new MenuVO();
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(menuVO);
		menuVO.setMenuType("ADM");
		List<MenuVO> treeMenuList = adminMenuService.listMenuTree(menuVO);
		
		for(MenuVO mvo : treeMenuList) {
			String upperMenuNo = mvo.getUpMenuId();
			String menuLevel = mvo.getMenuDepth();
			String key = upperMenuNo + "_" + menuLevel;
			
			List<MenuVO> mList = (List<MenuVO>) menuList.get(key);
			if(mList == null) {
				mList = new ArrayList<MenuVO>();
			}
			mList.add(mvo);
			menuList.put(key, mList);
			if(mvo.getMenuId().equals(menuId)) {
				model.addAttribute("menuPathLeafNode", mvo.getMenuPathLeafNode());
				model.addAttribute("menuIdPathLeafNode", mvo.getMenuIdPathLeafNode());
			}
		}
		model.addAttribute( "menuId", menuId);
		model.addAttribute( "menuList", menuList);
		
		return "adm/layout/leftMenu";
    }
	
	/**
	 * 메뉴관리 > 메뉴목록
	 * @param commandMap
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("listMenu.do")
	public String listMenu(@RequestParam Map<String, Object> commandMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		String menuId = StringUtils.defaultIfBlank((String)commandMap.get("menuId"), "");
		
		HashMap<String, Object> menuList = new HashMap<String,Object>();
		MenuVO menu = new MenuVO();
		menu.setMenuType(StringUtils.defaultIfBlank((String)commandMap.get("searchMenuType"), "ADM"));
		menu.setSearchMenuType(StringUtils.defaultIfBlank((String)commandMap.get("searchMenuType"), "ADM"));
		List<MenuVO> treeMenuList = adminMenuService.listMenuTree(menu);
		
		for (MenuVO menuVO : treeMenuList) {
			String upperMenuNo = menuVO.getUpMenuId();
			String menuLevel = menuVO.getMenuDepth();
			String key = upperMenuNo + "_" + menuVO.getMenuDepth();
			
			List<MenuVO> list = (List<MenuVO>)menuList.get(key);
			if(list == null)
				list =  new ArrayList<MenuVO>();
			list.add(menuVO);			
			menuList.put( key, list);
		}
		model.addAttribute( "menuVO", menu);
		model.addAttribute( "menuList1", menuList);
		model.addAttribute( "menuId", menuId);
		
		return "adm/menu/listMenu";
	}
	
	/**
	 * 메뉴관리 > 메뉴등록
	 * @param menuVO
	 * @param commandMap
	 * @param request
	 * @param model
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("insertMenu.do")
	public String insertMenu(@ModelAttribute("frmHtml") MenuVO menuVO, @RequestParam Map<String, Object> commandMap, HttpServletRequest request
			, ModelMap model, RedirectAttributes redirectAttributes) throws Exception {
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(menuVO);
		
		String retMsg = "";
		String menuId = "";
		int result = 0;
		
		if(StringUtils.isNotEmpty(menuVO.getMenuId())) {
			result = adminMenuService.updateMenu(menuVO);
			if(result > 0 ) {
				retMsg = "저장되었습니다.";
			} else {
				retMsg = "관리자에게 문의바랍니다.";
			}
		} else {
			menuId = adminMenuService.insertMenu(menuVO);
			if(StringUtils.isNotEmpty(menuId)) {
				retMsg = "저장되었습니다.";
			} else {
				retMsg = "관리자에게 문의바랍니다.";
			}
		}
		
		redirectAttributes.addFlashAttribute("menuVO", menuVO);
		redirectAttributes.addFlashAttribute("frmHtml", menuVO);
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/adm/menu/listMenu.do?searchMenuType=" + menuVO.getMenuType()+"&menuId=" + menuVO.getMenuId();
	}
	
	/**
	 * 메뉴 팝업
	 * @param menuVO
	 * @param commandMap
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("popupMenu.do")
	public String popupMenu(@ModelAttribute("searchFrm") MenuVO menuVO, @RequestParam Map<String, Object> commandMap, HttpServletRequest request, ModelMap model) throws Exception {
		
		HashMap<String, Object> menuList = new HashMap<String, Object>();
		List<MenuVO> treeMenuList = adminMenuService.listMenuTree(menuVO);
		
		for(MenuVO mvo : treeMenuList) {
			String upperMenuNo = mvo.getUpMenuId();
			String menuLevel = mvo.getMenuDepth();
			String key = upperMenuNo + "_" + menuLevel;
			
			List<MenuVO> mList = (List<MenuVO>) menuList.get(key);
			if(mList == null) {
				mList = new ArrayList<MenuVO>();
			}
			mList.add(mvo);
			menuList.put(key, mList);
		}
		model.addAttribute("menuList1", menuList);
		model.addAttribute("menuVO", menuVO);
		model.addAttribute("menuId", menuVO.getMenuId());
		
		return "/adm/menu/popupMenu";
	}
	
	/**
	 * 메뉴 트리 조회
	 * @param commandMap
	 * @param menuVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("listMenuTree.json")
	@ResponseBody
	public Map<String, Object> listMenuTree(@RequestParam Map<String, Object> commandMap, @ModelAttribute MenuVO menuVO, ModelMap model) throws Exception {
		MenuVO data = adminMenuService.getMenu(menuVO);
		
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("retCd", 200);
		returnMap.put("page", "");
		returnMap.put("total", "");
		returnMap.put("records", data);
		returnMap.put("rows", data);
		
		return returnMap;
	}
}
