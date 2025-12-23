package com.gocle.yangju.forest.usr.chinfo.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class SubjInfoDefaultVo extends BaseVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String searchSgrCd = "";
	
	private String searchCateCd = "";

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
	
	
}
