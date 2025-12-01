package com.gocle.yangju.forest.adm.program.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class ProgramVO extends BaseVO implements Serializable{

	private static final long serialVersionUID = -4950896280776393933L;
	
	/** 프로그램ID */
	private String pgId;
	/** 프로그램타입 */
	private String pgType;
	/** 프로그램명 */
	private String pgName;
	/** 프로그램내용 */
	private String pgDesc;
	/** 프로그램대상 */
	private String pgTarget;
	/** 공예품 */
	private String pgItem;
	/** 공예품 이름 */
	private String pgItemName;
	/** 소요시간 */
	private String duration;
	/** 최대참가인원 */
	private String capacity;
	/** 장소 */
	private String location;
	/** 강사명 */
	private String instructorName;
	/** 문의 */
	private String contact;
	/** 프로그램시작일 */
	private String startDate;
	/** 프로그램종료일 */
	private String endDate;
	/** 예약신청 시작일 */
	private String regOpenDate;
	/** 예약신청 종료일 */
	private String regCloseDate;
	/** 상태 */
	private String status;
	/** 썸네일 경로 */
	private String pgThumbpath;
	/** 신청자 수 */
	private String applyCnt;
	/** 참석자 수 */
	private String attendCnt;
	/** 총 금액 */
	private String totalAmount;
	/** 수업유형 */
	private String classType;
	
	private String pgCode;
	
	private String pgCodeNm;
	
	private String pgTargetNm;
	
	private String locationNm;
	
	private String locationCnt;
	
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
	public String getPgName() {
		return pgName;
	}
	public void setPgName(String pgName) {
		this.pgName = pgName;
	}
	public String getPgDesc() {
		return pgDesc;
	}
	public void setPgDesc(String pgDesc) {
		this.pgDesc = pgDesc;
	}
	public String getPgTarget() {
		return pgTarget;
	}
	public void setPgTarget(String pgTarget) {
		this.pgTarget = pgTarget;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getInstructorName() {
		return instructorName;
	}
	public void setInstructorName(String instructorName) {
		this.instructorName = instructorName;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getRegOpenDate() {
		return regOpenDate;
	}
	public void setRegOpenDate(String regOpenDate) {
		this.regOpenDate = regOpenDate;
	}
	public String getRegCloseDate() {
		return regCloseDate;
	}
	public void setRegCloseDate(String regCloseDate) {
		this.regCloseDate = regCloseDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPgItem() {
		return pgItem;
	}
	public void setPgItem(String pgItem) {
		this.pgItem = pgItem;
	}
	public String getPgItemName() {
		return pgItemName;
	}
	public void setPgItemName(String pgItemName) {
		this.pgItemName = pgItemName;
	}
	public String getPgThumbpath() {
		return pgThumbpath;
	}
	public void setPgThumbpath(String pgThumbpath) {
		this.pgThumbpath = pgThumbpath;
	}
	public String getApplyCnt() {
		return applyCnt;
	}
	public void setApplyCnt(String applyCnt) {
		this.applyCnt = applyCnt;
	}
	public String getAttendCnt() {
		return attendCnt;
	}
	public void setAttendCnt(String attendCnt) {
		this.attendCnt = attendCnt;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getClassType() {
		return classType;
	}
	public void setClassType(String classType) {
		this.classType = classType;
	}
	public String getPgCode() {
		return pgCode;
	}
	public void setPgCode(String pgCode) {
		this.pgCode = pgCode;
	}
	public String getPgCodeNm() {
		return pgCodeNm;
	}
	public void setPgCodeNm(String pgCodeNm) {
		this.pgCodeNm = pgCodeNm;
	}
	public String getPgTargetNm() {
		return pgTargetNm;
	}
	public void setPgTargetNm(String pgTargetNm) {
		this.pgTargetNm = pgTargetNm;
	}
	public String getLocationNm() {
		return locationNm;
	}
	public void setLocationNm(String locationNm) {
		this.locationNm = locationNm;
	}
	public String getLocationCnt() {
		return locationCnt;
	}
	public void setLocationCnt(String locationCnt) {
		this.locationCnt = locationCnt;
	}
}
