package com.gocle.spring.vo;

public class OrderVo extends OrderDefaultVo {

    private static final long serialVersionUID = 1L;

    private String orderNo;
    private String sortNo;
    private String orderUpperNo;
    private String[] order;
    private String[] sortKey;
    private String[] orderUpperCd;
    private String tbnm;
    private String tableNm;
    private String columnNm;
    private String keyNm;
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getSortNo() {
		return sortNo;
	}
	public void setSortNo(String sortNo) {
		this.sortNo = sortNo;
	}
	public String getOrderUpperNo() {
		return orderUpperNo;
	}
	public void setOrderUpperNo(String orderUpperNo) {
		this.orderUpperNo = orderUpperNo;
	}
	public String[] getOrder() {
		return order;
	}
	public void setOrder(String[] order) {
		this.order = order;
	}
	public String[] getSortKey() {
		return sortKey;
	}
	public void setSortKey(String[] sortKey) {
		this.sortKey = sortKey;
	}
	public String[] getOrderUpperCd() {
		return orderUpperCd;
	}
	public void setOrderUpperCd(String[] orderUpperCd) {
		this.orderUpperCd = orderUpperCd;
	}
	public String getTbnm() {
		return tbnm;
	}
	public void setTbnm(String tbnm) {
		this.tbnm = tbnm;
	}
	public String getTableNm() {
		return tableNm;
	}
	public void setTableNm(String tableNm) {
		this.tableNm = tableNm;
	}
	public String getColumnNm() {
		return columnNm;
	}
	public void setColumnNm(String columnNm) {
		this.columnNm = columnNm;
	}
	public String getKeyNm() {
		return keyNm;
	}
	public void setKeyNm(String keyNm) {
		this.keyNm = keyNm;
	}
    
    
}
