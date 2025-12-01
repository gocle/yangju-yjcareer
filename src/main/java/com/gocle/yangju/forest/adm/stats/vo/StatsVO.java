package com.gocle.yangju.forest.adm.stats.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class StatsVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = -1105317864388380671L;
	
	/** 연도 */
	private String year;
	/** 월 */
	private String month;
	/** 일 */
	private String date;
	/** 프로그램ID */
	private String pgId;
	/** 프로그램 유형 */
	private String pgType;
	/** 유형 */
	private String classType;
	/** 프로그램명 */
	private String pgName;
	/** 예약수 */
	private String resvCnt;
	/** 참석자수 */
	private String attendCnt;
	/** 취소자수 */
	private String cancelCnt;
	/** 체험가격 */
	private String price;
	/** 옵션가격 */
	private String optionPrice;
	/** 결제일 */
	private String payDt;
	/** 실결제자명 */
	private String payName;
	/** 인원수 */
	private String peopleCnt;
	/** 금액 */
	private String amount;
	/** 총금액 */
	private String totalAmt;
	/** 성별 */
	private String gender;
	/** 남성수 */
	private String mCnt;
	/** 여성수 */
	private String fCnt;
	/** 남성수 합계 */
	private String totalMCnt;
	/** 여성수 합계 */
	private String totalFCnt;
	/** 비고 */
	private String note;
	/** 공예품명 */
	private String productName;
	/** 체험일 */
	private String slotDate;
	/** 체험차시 */
	private String slotNo;
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPgId() {
		return pgId;
	}
	public void setPgId(String pgId) {
		this.pgId = pgId;
	}
	public String getPgType() {
		return pgType;
	}
	public void setPgType(String pgType) {
		this.pgType = pgType;
	}
	public String getClassType() {
		return classType;
	}
	public void setClassType(String classType) {
		this.classType = classType;
	}
	public String getPgName() {
		return pgName;
	}
	public void setPgName(String pgName) {
		this.pgName = pgName;
	}
	public String getResvCnt() {
		return resvCnt;
	}
	public void setResvCnt(String resvCnt) {
		this.resvCnt = resvCnt;
	}
	public String getAttendCnt() {
		return attendCnt;
	}
	public void setAttendCnt(String attendCnt) {
		this.attendCnt = attendCnt;
	}
	public String getCancelCnt() {
		return cancelCnt;
	}
	public void setCancelCnt(String cancelCnt) {
		this.cancelCnt = cancelCnt;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getTotalAmt() {
		return totalAmt;
	}
	public void setTotalAmt(String totalAmt) {
		this.totalAmt = totalAmt;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public String getPeopleCnt() {
		return peopleCnt;
	}
	public void setPeopleCnt(String peopleCnt) {
		this.peopleCnt = peopleCnt;
	}
	public String getPayDt() {
		return payDt;
	}
	public void setPayDt(String payDt) {
		this.payDt = payDt;
	}
	public String getPayName() {
		return payName;
	}
	public void setPayName(String payName) {
		this.payName = payName;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getSlotNo() {
		return slotNo;
	}
	public void setSlotNo(String slotNo) {
		this.slotNo = slotNo;
	}
	public String getSlotDate() {
		return slotDate;
	}
	public void setSlotDate(String slotDate) {
		this.slotDate = slotDate;
	}
	public String getmCnt() {
		return mCnt;
	}
	public void setmCnt(String mCnt) {
		this.mCnt = mCnt;
	}
	public String getfCnt() {
		return fCnt;
	}
	public void setfCnt(String fCnt) {
		this.fCnt = fCnt;
	}
	public String getTotalMCnt() {
		return totalMCnt;
	}
	public void setTotalMCnt(String totalMCnt) {
		this.totalMCnt = totalMCnt;
	}
	public String getTotalFCnt() {
		return totalFCnt;
	}
	public void setTotalFCnt(String totalFCnt) {
		this.totalFCnt = totalFCnt;
	}
	
}
