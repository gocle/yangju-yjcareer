package com.gocle.yangju.forest.adm.pay.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class PayVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = -8880471718879819L;

	/** 결제ID */
	private String payId;
	/** 예약ID */
	private String resvId;
	/** 결제상태 */
	private String payStatus;
	/** 결제방식 */
	private String payMethod;
	/** 결제방식 */
	private String payName;
	/** 결제금액 */
	private String amount;
	/** 비고 */
	private String note;
	/** 결제일 */
	private String payDt;
	
	/** 프로그램Id */
	private String pgId;
	/** 프로그램명 */
	private String pgName;
	/** 예약자명 */
	private String name;
	/** 단체여부 */
	private String groupYn;
	/** 단체인원수 */
	private String peopleCnt;
	/** 공예품Id */
	private String productId;
	/** 공예품명 */
	private String productName;
	/** 옵션명 */
	private String optionName;
	/** 가격 */
	private String price;
	/** 옵션가격 */
	private String optionPrice;
	
	/** 차시ID */
	private String 		slotId;
	/** 차시 */
	private String		slotNo;
	/** 시작시간 */
	private LocalTime	startTime;
	/** 종료시간 */
	private LocalTime	endTime;
	/** 체험일 */
	private LocalDate	slotDate;
	
	public String getPayId() {
		return payId;
	}
	public void setPayId(String payId) {
		this.payId = payId;
	}
	public String getResvId() {
		return resvId;
	}
	public void setResvId(String resvId) {
		this.resvId = resvId;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getPgId() {
		return pgId;
	}
	public void setPgId(String pgId) {
		this.pgId = pgId;
	}
	public String getPgName() {
		return pgName;
	}
	public void setPgName(String pgName) {
		this.pgName = pgName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGroupYn() {
		return groupYn;
	}
	public void setGroupYn(String groupYn) {
		this.groupYn = groupYn;
	}
	public String getPeopleCnt() {
		return peopleCnt;
	}
	public void setPeopleCnt(String peopleCnt) {
		this.peopleCnt = peopleCnt;
	}
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
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getOptionPrice() {
		return optionPrice;
	}
	public void setOptionPrice(String optionPrice) {
		this.optionPrice = optionPrice;
	}
	public String getSlotId() {
		return slotId;
	}
	public void setSlotId(String slotId) {
		this.slotId = slotId;
	}
	public String getSlotNo() {
		return slotNo;
	}
	public void setSlotNo(String slotNo) {
		this.slotNo = slotNo;
	}
	public LocalTime getStartTime() {
		return startTime;
	}
	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}
	public LocalTime getEndTime() {
		return endTime;
	}
	public void setEndTime(LocalTime endTime) {
		this.endTime = endTime;
	}
	public LocalDate getSlotDate() {
		return slotDate;
	}
	public void setSlotDate(LocalDate slotDate) {
		this.slotDate = slotDate;
	}
	public String getPayDt() {
		return payDt;
	}
	public void setPayDt(String payDt) {
		if (payDt == null || payDt.trim().isEmpty()) {
            this.payDt = null;
        } else {
            this.payDt = payDt;
        }
	}
	public String getPayName() {
		return payName;
	}
	public void setPayName(String payName) {
		this.payName = payName;
	}
	
}
