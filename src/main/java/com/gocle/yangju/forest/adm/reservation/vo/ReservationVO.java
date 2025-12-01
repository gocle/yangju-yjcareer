package com.gocle.yangju.forest.adm.reservation.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import com.gocle.yangju.forest.comm.util.AESUtil;
import com.gocle.yangju.forest.comm.vo.BaseVO;

public class ReservationVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = -7142431903953738321L;

	/** 예약ID */
	private String 		resvId;
	/** 프로그램ID */
	private String 		pgId;
	/** 프로그램유형 */
	private String 		pgType;
	/** DI키 */
	private String 		diKey;
	/** 이름 */
	private String 		name;
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
	/** 공예품ID */
	private String 		productId;
	/** 공예품명 */
	private String		productName;
	/** 옵션명 */
	private String		optionName;
	/** 예약상태 */
	private String 		status;
	/** 비고 */
	private String 		note;
	/** 참석여부 */
	private String		attendYn;
	/** 프로그램을 알게된 경로 */
	private String		recommend;
	
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
	
	/** 숲체험 프로그램 분류 */
	private String	pgCode;
	/** 숲체험 프로그램 장소 */
	private String	location;
	private String	locationNm;
	
	private String	capacity;
		
	private String	programDt;
	
	/** 남성수 */
	private String mCnt;
	/** 여성수 */
	private String fCnt;
	
	public String getResvId() {
		return resvId;
	}
	public void setResvId(String resvId) {
		this.resvId = resvId;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getAttendYn() {
		return attendYn;
	}
	public void setAttendYn(String attendYn) {
		this.attendYn = attendYn;
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
	public LocalDate getSlotDate() {
		return slotDate;
	}
	public void setSlotDate(LocalDate slotDate) {
		this.slotDate = slotDate;
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
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public String getPgCode() {
		return pgCode;
	}
	public void setPgCode(String pgCode) {
		this.pgCode = pgCode;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getLocationNm() {
		return locationNm;
	}
	public void setLocationNm(String locationNm) {
		this.locationNm = locationNm;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getProgramDt() {
		return programDt;
	}
	public void setProgramDt(String programDt) {
		this.programDt = programDt;
	}
	public String getmCnt() {
		return mCnt;
	}
	public void setmCnt(String mCnt) {
		if (mCnt == null || mCnt.trim().isEmpty()) {
	        this.mCnt = null;
	    } else {
	    	this.mCnt = mCnt;
	    }
	}
	public String getfCnt() {
		return fCnt;
	}
	public void setfCnt(String fCnt) {
		if (fCnt == null || fCnt.trim().isEmpty()) {
	        this.fCnt = null;
	    } else {
	    	this.fCnt = fCnt;
	    }
	}
}
