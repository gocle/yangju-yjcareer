package com.gocle.yangju.forest.adm.pay.vo;

import java.util.List;

public class PayForm {

	private List<PayVO> payList;
	
    private String pgType;
    
    private String pgId;
    
    private String menuId;

	public List<PayVO> getPayList() {
		return payList;
	}

	public void setPayList(List<PayVO> payList) {
		this.payList = payList;
	}

	public String getPgType() {
		return pgType;
	}

	public void setPgType(String pgType) {
		this.pgType = pgType;
	}

	public String getPgId() {
		return pgId;
	}

	public void setPgId(String pgId) {
		this.pgId = pgId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
}
