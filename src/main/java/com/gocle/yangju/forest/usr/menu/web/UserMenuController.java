package com.gocle.yangju.forest.usr.menu.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.BadRequestException;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.usr.menu.service.UserMenuService;
import com.gocle.yangju.forest.usr.menu.vo.MenuVO;

@Controller
@RequestMapping("/usr/menu/")
public class UserMenuController{
	
	@Autowired
	private UserMenuService menuService;
	

	private void validateInput(String value, String fieldName) {
        if (value != null && !value.matches("^[a-zA-Z0-9_-]{1,50}$")) {
            throw new BadRequestException("Invalid value for " + fieldName);
        }
    }

    @RequestMapping(value = "leftMenu.do")
    public String leftMenu(@PathVariable("menuType") String menuType,
                           HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestParam Map<String, Object> commandMap,
                           ModelMap model) throws Exception {

        HttpSession session = request.getSession();
        String rootMenuId = StringUtils.defaultIfBlank((String) commandMap.get("rootMenuId"), (String) model.get("rootMenuId"));
        String menuId = StringUtils.defaultIfBlank((String) commandMap.get("menuId"), (String) model.get("menuId"));

        rootMenuId = StringUtils.defaultIfBlank(rootMenuId, (String) session.getAttribute("rootMenuId"));
        menuId = StringUtils.defaultIfBlank(menuId, (String) session.getAttribute("menuId"));

        validateInput(menuId, "menuId");
        validateInput(rootMenuId, "rootMenuId");

        HashMap<String, Object> menuList = new HashMap<>();
        MenuVO menu = new MenuVO();
        menu.setMenuType(menuType);
        List<MenuVO> menuStructureList = menuService.listMenuTree(menu);

        for( MenuVO menuVO : menuStructureList ) {
			
			String upperMenuNo = menuVO.getUpMenuId();
			String menuLevel = menuVO.getMenuDepth();
			String key = upperMenuNo + "_" +  menuLevel;

			List<MenuVO> list =  (List<MenuVO>)menuList.get(key);
			
			if(list == null)
				list =  new ArrayList<MenuVO>();
			
			list.add( menuVO);
			
			menuList.put( key, list);
 

			if( menuVO.getMenuId().equals( menuId ) ){

			    model.addAttribute( "menuPathLeafNode", menuVO.getMenuPathLeafNode() );
			    model.addAttribute( "menuIdPathLeafNode", menuVO.getMenuIdPathLeafNode());
			}
		}

        model.addAttribute("menuId", menuId);
        model.addAttribute("menuList", menuList);

        return "admin/layout/left";
    }
	
    @RequestMapping(value = "header.do")
    public String header(HttpServletRequest request,
                         HttpServletResponse response,
                         @RequestParam Map<String, Object> commandMap,
                         ModelMap model) throws Exception {

        HttpSession session = request.getSession();
        String rootMenuId = StringUtils.defaultIfBlank((String) commandMap.get("rootMenuId"), (String) model.get("rootMenuId"));
        String menuId = StringUtils.defaultIfBlank((String) commandMap.get("menuId"), (String) model.get("menuId"));

        rootMenuId = StringUtils.defaultIfBlank(rootMenuId, (String) session.getAttribute("rootMenuId"));
        menuId = StringUtils.defaultIfBlank(menuId, (String) session.getAttribute("menuId"));

        validateInput(menuId, "menuId");
        validateInput(rootMenuId, "rootMenuId");

        HashMap<String, Object> menuList = new HashMap<>();
        MenuVO menu = new MenuVO();
        menu.setMenuType("USR");
        List<MenuVO> menuStructureList = menuService.listMenuTree(menu);

        for( MenuVO menuVO : menuStructureList ) {
			
			String upperMenuNo = menuVO.getUpMenuId();
			String menuLevel = menuVO.getMenuDepth();
			String key = upperMenuNo + "_" +  menuLevel;

			List<MenuVO> list =  (List<MenuVO>)menuList.get(key);
			
			if(list == null)
				list =  new ArrayList<MenuVO>();
			
			list.add( menuVO);
			
			menuList.put( key, list);
 

			if( menuVO.getMenuId().equals( menuId ) ){

			    model.addAttribute( "menuPathLeafNode", menuVO.getMenuPathLeafNode() );
			    model.addAttribute( "menuIdPathLeafNode", menuVO.getMenuIdPathLeafNode());
			}
		}

        model.addAttribute("menuList", menuList);

        return "usr/layout/header";
    }
	
    @RequestMapping(value = "sub.do")
    public String sub(
                      HttpServletRequest request,
                      HttpServletResponse response,
                      @RequestParam Map<String, Object> commandMap,
                      ModelMap model) throws Exception {

        String rootMenuId = StringUtils.defaultIfBlank((String) commandMap.get("rootMenuId"), (String) model.get("rootMenuId"));
        String menuId = StringUtils.defaultIfBlank((String) commandMap.get("menuId"), (String) model.get("menuId"));

        validateInput(menuId, "menuId");
        validateInput(rootMenuId, "rootMenuId");

        MenuVO menu = new MenuVO();
        menu.setMenuType("USR");
        menu.setMenuId(menuId);

        List<MenuVO> listTopMenu = menuService.listTopMenu(menu);
        List<MenuVO> listSubMenu = menuService.listSubMenu(menu);

        menu = menuService.getMenu(menu);
        MenuVO menuInfo = menuService.menuInfo(menu);
        model.addAttribute("menuInfo", menuInfo);

        if (menuInfo != null && "3".equals(menuInfo.getMenuDepth())) {
            List<MenuVO> listSubSubMenu = menuService.listSubSubMenu(menu);
            model.addAttribute("listSubSubMenu", listSubSubMenu);

            menu.setMenuId(menuInfo.getUpMenuId());
            listTopMenu = menuService.listTopMenu(menu);
            listSubMenu = menuService.listSubMenu(menu);

            menu = menuService.getMenu(menu);
            model.addAttribute("menuId", menuId);
        }
        
        if (menuInfo != null && "1".equals(menuInfo.getMenuDepth())) {
        	listSubMenu = menuService.listTopSubMenu(menu);
        }
        
        model.addAttribute("menuVO", menu);
        model.addAttribute("listTopMenu", listTopMenu);
        model.addAttribute("listSubMenu", listSubMenu);

        return "usr/layout/sub";
    }
    
    @RequestMapping("sitemap.do")
    public String sitemap(HttpServletRequest request,
                      HttpServletResponse response,
                      @RequestParam Map<String, Object> commandMap,
                      ModelMap model) throws Exception {

     HttpSession session = request.getSession();
     String rootMenuId = StringUtils.defaultIfBlank((String) commandMap.get("rootMenuId"), (String) model.get("rootMenuId"));
     String menuId = StringUtils.defaultIfBlank((String) commandMap.get("menuId"), (String) model.get("menuId"));

     rootMenuId = StringUtils.defaultIfBlank(rootMenuId, (String) session.getAttribute("rootMenuId"));
     menuId = StringUtils.defaultIfBlank(menuId, (String) session.getAttribute("menuId"));

     validateInput(menuId, "menuId");
     validateInput(rootMenuId, "rootMenuId");

     HashMap<String, Object> menuList = new HashMap<>();
     MenuVO menu = new MenuVO();
     menu.setMenuType("USR");
     List<MenuVO> menuStructureList = menuService.listMenuTree(menu);

     for( MenuVO menuVO : menuStructureList ) {
			
			String upperMenuNo = menuVO.getUpMenuId();
			String menuLevel = menuVO.getMenuDepth();
			String key = upperMenuNo + "_" +  menuLevel;

			List<MenuVO> list =  (List<MenuVO>)menuList.get(key);
			
			if(list == null)
				list =  new ArrayList<MenuVO>();
			
			list.add( menuVO);
			
			menuList.put( key, list);


			if( menuVO.getMenuId().equals( menuId ) ){

			    model.addAttribute( "menuPathLeafNode", menuVO.getMenuPathLeafNode() );
			    model.addAttribute( "menuIdPathLeafNode", menuVO.getMenuIdPathLeafNode());
			}
		}

     model.addAttribute("menuList", menuList);

     return "/usr/introduce/sitemap";
    }   
	
	
	/**
	 * 메뉴 목록 페이지 이동.
	 * @param commandMap
	 * @param model
	 * @return
	 * @throws Exception
	 * String
	 */
	@RequestMapping(value = { "admin/menu/listMenu.do"})
	public String goListMenu(@RequestParam Map<String, Object> commandMap,HttpServletRequest request, ModelMap model) throws Exception {
		// View호출
		String returnPage = "";		
		returnPage = "admin/menu/listMenu";


//		로그인관련작업후 처리 무조건 조회		
//    	LoginInfo loginInfo = new LoginInfo(request, response);
//		ArrayList<MenuVO> menuStructureList = //(ArrayList<MenuVO>) loginInfo.getSimpleMenuInfo();
		
		String menuId = StringUtils.defaultIfBlank((String)commandMap.get("menuId"),"");
		
		// ✅ menuId와 rootMenuId 값 검증
		if (menuId != null && !menuId.matches("^[a-zA-Z0-9_-]{1,50}$")) {
		    throw new IllegalArgumentException("Invalid menuId");
		}

		HashMap<String, Object> menuList = new HashMap<String,Object>();
		MenuVO menu = new MenuVO();
		menu.setSearchMenuType(StringUtils.defaultIfBlank((String)commandMap.get("searchMenuType"),"USR"));
		List<MenuVO> menuStructureList = menuService.listMenuTree(menu);

		for( MenuVO menuVO : menuStructureList ) {

			String upperMenuNo = menuVO.getUpMenuId();
			String menuLevel = menuVO.getMenuDepth();
			String key = upperMenuNo + "_" +  menuLevel;

			List<MenuVO> list =  (List<MenuVO>)menuList.get(key);
			
			if(list == null)
				list =  new ArrayList<MenuVO>();
			
			list.add( menuVO);			
			menuList.put( key, list);


		}
		model.addAttribute( "menuVO", menu);
		model.addAttribute( "menuList1", menuList);
		model.addAttribute( "menuId", menuId);

		return returnPage;
	}
	

	/**
	 * 관리할 메뉴를 트리 구조로 조회한다.
	 * @param commandMap
	 * @param menuVO
	 * @param model
	 * @return
	 * @throws Exception
	 * Map<String,Object>
	 */
	@RequestMapping(value = "admin/menu/listMenuTree.json")
	public @ResponseBody Map<String, Object> listMenuTree(@RequestParam Map<String, Object> commandMap, @ModelAttribute MenuVO menuVO, ModelMap model) throws Exception {
		
		//List<MenuVO> data = menuService.listMenuTree(menuVO);
		MenuVO data = menuService.getMenu(menuVO);
		
		HashMap<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("retCd", 200);
	//	returnMap.put("retMsg", "[" + data.s + "]건 조회되었습니다." );
		returnMap.put("page", "");
		returnMap.put("total", "");
		returnMap.put("records", data);
	//	returnMap.put("totalRecords", data.size());
		returnMap.put("rows", data );

		return returnMap;
	}		
}
