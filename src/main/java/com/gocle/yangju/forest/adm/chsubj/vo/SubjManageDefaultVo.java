package com.gocle.yangju.forest.adm.chsubj.vo;

import java.io.Serializable;

import com.gocle.spring.vo.PaginationVO;
import com.gocle.yangju.forest.comm.vo.BaseVO;

public class SubjManageDefaultVo extends BaseVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	// 검색 대분류
	private String searchSgrCd = "";
	// 검색 소분류
	private String searchCateCd = "";
	// 검색어
    private String searchKeyword = "";
    // 메뉴ID
    private String menuId = "";
    
	public String getSearchSgrCd() {
		return searchSgrCd;
	}
	public void setSearchSgrCd(String searchSgrCd) {
		this.searchSgrCd = searchSgrCd;
	}
	public String getSearchCateCd() {
		return searchCateCd;
	}
	public void setSearchCateCd(String searchCateCd) {
		this.searchCateCd = searchCateCd;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	
}
