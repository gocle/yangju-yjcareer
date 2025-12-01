package com.gocle.yangju.forest.adm.menu.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class MenuVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = -5258515676296476315L;
	
	/** 메뉴ID */
	private String menuId;
	
	/** 메뉴분류 */
	private String menuType;
	
	/** 메뉴노출유형 */
	private String menuViewTypeCode;
	
	/** 상위메뉴ID */
	private String upMenuId;
	
	/** 메뉴레벨 */
	private String menuDepth;
	
	/** 메뉴순서 */
	private String menuOrder;
	
	/** 메뉴상태 */
	private String menuStatus;
	
	/** 메뉴url */
	private String menuUrl;
	
	/** 메뉴이름 */
	private String menuTitle;
	
	/** 활성여부 */
	private String showYn;
	
	/** 검색메뉴 */
	private String searchMenuType;
	
	private String isLeaf;
	
	private String isLeafMenu;
	
	private String menuIdPathLeafNode;
	
	private String menuPathLeafNode;
	

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	public String getMenuViewTypeCode() {
		return menuViewTypeCode;
	}

	public void setMenuViewTypeCode(String menuViewTypeCode) {
		this.menuViewTypeCode = menuViewTypeCode;
	}

	public String getUpMenuId() {
		return upMenuId;
	}

	public void setUpMenuId(String upMenuId) {
		this.upMenuId = upMenuId;
	}

	public String getMenuDepth() {
		return menuDepth;
	}

	public void setMenuDepth(String menuDepth) {
		this.menuDepth = menuDepth;
	}

	public String getMenuOrder() {
		return menuOrder;
	}

	public void setMenuOrder(String menuOrder) {
		this.menuOrder = menuOrder;
	}

	public String getMenuStatus() {
		return menuStatus;
	}

	public void setMenuStatus(String menuStatus) {
		this.menuStatus = menuStatus;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public String getMenuTitle() {
		return menuTitle;
	}

	public void setMenuTitle(String menuTitle) {
		this.menuTitle = menuTitle;
	}

	public String getShowYn() {
		return showYn;
	}

	public void setShowYn(String showYn) {
		this.showYn = showYn;
	}

	public String getSearchMenuType() {
		return searchMenuType;
	}

	public void setSearchMenuType(String searchMenuType) {
		this.searchMenuType = searchMenuType;
	}

	public String getIsLeafMenu() {
		return isLeafMenu;
	}

	public void setIsLeafMenu(String isLeafMenu) {
		this.isLeafMenu = isLeafMenu;
	}

	public String getMenuIdPathLeafNode() {
		return menuIdPathLeafNode;
	}

	public void setMenuIdPathLeafNode(String menuIdPathLeafNode) {
		this.menuIdPathLeafNode = menuIdPathLeafNode;
	}

	public String getMenuPathLeafNode() {
		return menuPathLeafNode;
	}

	public void setMenuPathLeafNode(String menuPathLeafNode) {
		this.menuPathLeafNode = menuPathLeafNode;
	}

	public String getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(String isLeaf) {
		this.isLeaf = isLeaf;
	}
	
}
