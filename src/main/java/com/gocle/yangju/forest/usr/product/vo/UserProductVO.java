package com.gocle.yangju.forest.usr.product.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class UserProductVO extends BaseVO implements Serializable{
	private static final long serialVersionUID = 1912620863861004133L;
	
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
	/** 신제품여부 */
	private String newYn;
	/** 품절여부 */
	private String soldYn;
	private String targetCode;
	
	private String pgId;
	private String slotId;
	
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
		this.optionPrice = optionPrice;
	}
	public String getThumbpath() {
		return thumbpath;
	}
	public void setThumbpath(String thumbpath) {
		this.thumbpath = thumbpath;
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
	public String getTargetCode() {
		return targetCode;
	}
	public void setTargetCode(String targetCode) {
		this.targetCode = targetCode;
	}
	public String getPgId() {
		return pgId;
	}
	public void setPgId(String pgId) {
		this.pgId = pgId;
	}
	public String getSlotId() {
		return slotId;
	}
	public void setSlotId(String slotId) {
		this.slotId = slotId;
	}
	
}
