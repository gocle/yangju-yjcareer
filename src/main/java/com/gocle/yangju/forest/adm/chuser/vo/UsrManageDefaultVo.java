package com.gocle.yangju.forest.adm.chuser.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class UsrManageDefaultVo extends BaseVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String searchKeyword = "";

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
}
