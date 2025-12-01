package com.gocle.yangju.forest.usr.menu.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class MenuVO extends BaseVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2607689507046972554L;
	
	private String menuId; /* 메뉴ID */
	private String menuType; /* 메뉴분류 */
	private String menuViewTypeCode; /* 메뉴노출타입 */	
	private String upMenuId; /* 상위메뉴ID */
	private String menuDepth;/* 메뉴깊이 */
	private String menuOrder;/* 메뉴순서 */
	private String menuStatus;/* 메뉴상태 */
	private String menuUrl; /* 메뉴URL */	
	private String menuTitle;/* 메뉴타이틀 */	
	private String showYn;/* 활성여부 */
	
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
	 
	private String isLeaf;
	private String expanded;
	private String loaded;
	private String upMenuTitle;
	private String searchMenuType;
	public String getIsLeaf() {
		return isLeaf;
	}
	public void setIsLeaf(String isLeaf) {
		this.isLeaf = isLeaf;
	}
	public String getExpanded() {
		return expanded;
	}
	public void setExpanded(String expanded) {
		this.expanded = expanded;
	}
	public String getLoaded() {
		return loaded;
	}
	public void setLoaded(String loaded) {
		this.loaded = loaded;
	}
	public String getUpMenuTitle() {
		return upMenuTitle;
	}
	public void setUpMenuTitle(String upMenuTitle) {
		this.upMenuTitle = upMenuTitle;
	}
	public String getSearchMenuType() {
		return searchMenuType;
	}
	public void setSearchMenuType(String searchMenuType) {
		this.searchMenuType = searchMenuType;
	}
	private String isLeafMenu;
	private String menuArea;
	private String rootMenuId;
	private String menuLevel;
	public String getIsLeafMenu() {
		return isLeafMenu;
	}
	public void setIsLeafMenu(String isLeafMenu) {
		this.isLeafMenu = isLeafMenu;
	}
	public String getMenuArea() {
		return menuArea;
	}
	public void setMenuArea(String menuArea) {
		this.menuArea = menuArea;
	}
	public String getRootMenuId() {
		return rootMenuId;
	}
	public void setRootMenuId(String rootMenuId) {
		this.rootMenuId = rootMenuId;
	}
	public String getMenuLevel() {
		return menuLevel;
	}
	public void setMenuLevel(String menuLevel) {
		this.menuLevel = menuLevel;
	}
	private String menuIdPathLeafNode;

	public String getMenuIdPathLeafNode() {
		return menuIdPathLeafNode;
	}
	public void setMenuIdPathLeafNode(String menuIdPathLeafNode) {
		this.menuIdPathLeafNode = menuIdPathLeafNode;
	}
	private String menuPathLeafNode;

	public String getMenuPathLeafNode() {
		return menuPathLeafNode;
	}
	public void setMenuPathLeafNode(String menuPathLeafNode) {
		this.menuPathLeafNode = menuPathLeafNode;
	}
	
}
