package com.gocle.yangju.forest.usr.reservation.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class UserReservationVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = -573368458605795364L;

	/** 예약ID */
	private String resvId;
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
	
	private String pgCode;
	
	private String pgTargetNm;
	
	private String locationNm;
	
	private String pgCodeNm;
	
	/** 공예품ID */
	private String 		productId;
	/** 공예품명 */
	private String		productName;
	/** 옵션명 */
	private String		optionName;
	/** 수업유형 */
	private String 		classType;
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
	
	/** DI키 */
	private String 		diKey;
	/** 이름 */
	private String 		name;
	/** 프로그램을 알게된 경로 */
	private String		recommend;
	/** 연락처 */
	private String 		phone;
	/** 이메일 */
	private String 		email;
	/** 나이 */
	private String 		age;
	/** 성별 */
	private String 		gender;
	/** 보호자 이름 */
	private String 		parentName;
	/** 보호자 연락처 */
	private String 		parentPhone;
	/** 단체여부 */
	private String 		groupYn;
	/** 단체명 */
	private String 		groupName;
	/** 단체유형 */
	private String 		groupType;
	/** 단체인원 수 */
	private String 		peopleCnt;
	/** 신청일 */
	private String 		applyDate;
	/** 차량번호 */
	private String 		carNum;
	private String		note;
	
	/** 장소별 인원수 */
	private int locationCnt;
	
	/** 산림교육 장소,시간 */
	private String programDt;
	
	/** 검색 여부 */
	private String searchYn;
	
	/** 검색 조건 시간 */
	private String searchDt;
	
	/** 가격 */
	private String 		price;
	/** 옵션가격 */
	private String 		optionPrice;
	
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
	public String getPgCode() {
		return pgCode;
	}
	public void setPgCode(String pgCode) {
		this.pgCode = pgCode;
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
	public String getPgCodeNm() {
		return pgCodeNm;
	}
	public void setPgCodeNm(String pgCodeNm) {
		this.pgCodeNm = pgCodeNm;
	}
	public String getClassType() {
		return classType;
	}
	public void setClassType(String classType) {
		this.classType = classType;
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
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public String getResvId() {
		return resvId;
	}
	public void setResvId(String resvId) {
		this.resvId = resvId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		if (age == null || age.trim().isEmpty()) {
	        this.age = null;
	    } else {
            this.age = age;
	    }
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getParentPhone() {
		return parentPhone;
	}
	public void setParentPhone(String parentPhone) {
		this.parentPhone = parentPhone;
	}
	public String getGroupYn() {
		return groupYn;
	}
	public void setGroupYn(String groupYn) {
		this.groupYn = groupYn;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupType() {
		return groupType;
	}
	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}
	public String getPeopleCnt() {
		return peopleCnt;
	}
	public void setPeopleCnt(String peopleCnt) {
		if (peopleCnt == null || peopleCnt.trim().isEmpty()) {
	        this.peopleCnt = null;
	    } else {
            this.peopleCnt = peopleCnt;
	    }
	}
	public String getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}
	public String getCarNum() {
		return carNum;
	}
	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}
	public String getDiKey() {
		return diKey;
	}
	public void setDiKey(String diKey) {
		this.diKey = diKey;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getLocationCnt() {
		return locationCnt;
	}
	public void setLocationCnt(int locationCnt) {
		this.locationCnt = locationCnt;
	}
	public String getProgramDt() {
		return programDt;
	}
	public void setProgramDt(String programDt) {
		this.programDt = programDt;
	}
	public String getSearchDt() {
		return searchDt;
	}
	public void setSearchDt(String searchDt) {
		this.searchDt = searchDt;
	}
	public String getSearchYn() {
		return searchYn;
	}
	public void setSearchYn(String searchYn) {
		this.searchYn = searchYn;
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
	
}