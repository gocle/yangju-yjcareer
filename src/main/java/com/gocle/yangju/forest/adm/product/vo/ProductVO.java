package com.gocle.yangju.forest.adm.product.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class ProductVO extends BaseVO implements Serializable{

	private static final long serialVersionUID = -3630663030366503578L;

	
	/** 상품ID */
	private String productId;
	/** 상품명 */
	private String productName;
	/** 상품설명 */
	private String productDesc;
	/** 가격 */
	private String price;
	/** 소요시간 */
	private String duration;
	/** 대상 */
	private String target;
	/** 옵션명 */
	private String optionName;
	/** 옵션추가가격 */
	private String optionPrice;
	/** 썸네일 */
	private String thumbpath;
	/** 사용연도 */
	private String useYear;
	/** 신제품여부 */
	private String newYn;
	/** 품절여부 */
	private String soldYn;
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public String getOptionPrice() {
		return optionPrice;
	}
	public void setOptionPrice(String optionPrice) {
		if (optionPrice == null || optionPrice.trim().isEmpty()) {
	        this.optionPrice = null;
	    } else {
	        this.optionPrice = optionPrice;
	    }
	}
	public String getThumbpath() {
		return thumbpath;
	}
	public void setThumbpath(String thumbpath) {
		this.thumbpath = thumbpath;
	}
	public String getUseYear() {
		return useYear;
	}
	public void setUseYear(String useYear) {
		this.useYear = useYear;
	}
	public String getNewYn() {
		return newYn;
	}
	public void setNewYn(String newYn) {
		this.newYn = newYn;
	}
	public String getSoldYn() {
		return soldYn;
	}
	public void setSoldYn(String soldYn) {
		this.soldYn = soldYn;
	}
}
