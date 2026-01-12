package com.gocle.yangju.forest.adm.chsubjopen.vo;

public class SubjSeqManageVo extends SubjSeqManageDefaultVo {
	
	private static final long serialVersionUID = 1L;
	
	// 분류 코드
    private String sgrCd;
    private String sgrNm;
    // 분류 일련번호
    private String cateCd;
    private String cateNm;
    // 과정코드
    private String subjCd;
    // 운영과정코드
    private String seqCd;
    // 교육강좌명
    private String subjNm;
    // 기수명
    private String sessionNm;
    // 사용 여부
    private String useYn;
    // 전화번호
    private String tel;
    private String tel1;
    private String tel2;
    private String tel3;
    // 교육기관
    private String comId;
    private String comTitle;
    // 교육장소
    private String eduPlace;
    private String locId;
    // 교육대상
    private String eduTarget;
    // 모집방법
    private String enrollType;
    // 강의계획서
    private String subjPlan;
    // 유의사항
    private String subjDesc;
    // 모집인원
    private String capacity;
    // 대기인원
    private String waitEnrollCnt;
    // 중복신청 가능여부
    private String duplEnrollYn;
    // 수강신청 시작일시
    private String enrollStartDt;
    private String enrollStartDtStr;
    private String enrollStartHour;
    private String enrollStartMin;
    private String enrollStartTime;
    // 수강신청 종료일시
    private String enrollEndDt;
    private String enrollEndDtStr;
    private String enrollEndHour;
    private String enrollEndMin;
    private String enrollEndTime;
    // 교육 시작일시
    private String learnStartDt;
    private String learnStartDtStr;
    private String learnStartHour;
    private String learnStartMin;
    private String learnStartTime;
    // 교육 종료일시
    private String learnEndDt;
    private String learnEndDtStr;
    private String learnEndHour;
    private String learnEndMin;
    private String learnEndTime;
    
    // 기수 추가
    private String[] subjNms;
    private String[] sessionNms;
    private String[] enrollStartDts;
    private String[] enrollEndDts;
    private String[] capacitys;
    private String[] waitEnrollCnts;
    private String[] learnStartDts;
    private String[] learnEndDts;
    
    private int enrollCnt;
    private String location;
    private String status;
    
	public String getSgrCd() {
		return sgrCd;
	}
	public void setSgrCd(String sgrCd) {
		this.sgrCd = sgrCd;
	}
	public String getCateCd() {
		return cateCd;
	}
	public void setCateCd(String cateCd) {
		this.cateCd = cateCd;
	}
	public String getCateNm() {
		return cateNm;
	}
	public void setCateNm(String cateNm) {
		this.cateNm = cateNm;
	}
	public String getSubjCd() {
		return subjCd;
	}
	public void setSubjCd(String subjCd) {
		this.subjCd = subjCd;
	}
	public String getSeqCd() {
		return seqCd;
	}
	public void setSeqCd(String seqCd) {
		this.seqCd = seqCd;
	}
	public String getSubjNm() {
		return subjNm;
	}
	public void setSubjNm(String subjNm) {
		this.subjNm = subjNm;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public String getComTitle() {
		return comTitle;
	}
	public void setComTitle(String comTitle) {
		this.comTitle = comTitle;
	}
	public String getEduTarget() {
		return eduTarget;
	}
	public void setEduTarget(String eduTarget) {
		this.eduTarget = eduTarget;
	}
	public String getEnrollType() {
		return enrollType;
	}
	public void setEnrollType(String enrollType) {
		this.enrollType = enrollType;
	}
	public String getSubjPlan() {
		return subjPlan;
	}
	public void setSubjPlan(String subjPlan) {
		this.subjPlan = subjPlan;
	}
	public String getSubjDesc() {
		return subjDesc;
	}
	public void setSubjDesc(String subjDesc) {
		this.subjDesc = subjDesc;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getWaitEnrollCnt() {
		return waitEnrollCnt;
	}
	public void setWaitEnrollCnt(String waitEnrollCnt) {
		this.waitEnrollCnt = waitEnrollCnt;
	}
	public String getEnrollStartDt() {
		return enrollStartDt;
	}
	public void setEnrollStartDt(String enrollStartDt) {
		this.enrollStartDt = enrollStartDt;
	}
	public String getEnrollStartDtStr() {
		return enrollStartDtStr;
	}
	public void setEnrollStartDtStr(String enrollStartDtStr) {
		this.enrollStartDtStr = enrollStartDtStr;
	}
	public String getEnrollStartHour() {
		return enrollStartHour;
	}
	public void setEnrollStartHour(String enrollStartHour) {
		this.enrollStartHour = enrollStartHour;
	}
	public String getEnrollStartMin() {
		return enrollStartMin;
	}
	public void setEnrollStartMin(String enrollStartMin) {
		this.enrollStartMin = enrollStartMin;
	}
	public String getEnrollStartTime() {
		return enrollStartTime;
	}
	public void setEnrollStartTime(String enrollStartTime) {
		this.enrollStartTime = enrollStartTime;
	}
	public String getEnrollEndDt() {
		return enrollEndDt;
	}
	public void setEnrollEndDt(String enrollEndDt) {
		this.enrollEndDt = enrollEndDt;
	}
	public String getEnrollEndDtStr() {
		return enrollEndDtStr;
	}
	public void setEnrollEndDtStr(String enrollEndDtStr) {
		this.enrollEndDtStr = enrollEndDtStr;
	}
	public String getEnrollEndHour() {
		return enrollEndHour;
	}
	public void setEnrollEndHour(String enrollEndHour) {
		this.enrollEndHour = enrollEndHour;
	}
	public String getEnrollEndMin() {
		return enrollEndMin;
	}
	public void setEnrollEndMin(String enrollEndMin) {
		this.enrollEndMin = enrollEndMin;
	}
	public String getEnrollEndTime() {
		return enrollEndTime;
	}
	public void setEnrollEndTime(String enrollEndTime) {
		this.enrollEndTime = enrollEndTime;
	}
	public String[] getSubjNms() {
		return subjNms;
	}
	public void setSubjNms(String[] subjNms) {
		this.subjNms = subjNms;
	}
	public String[] getSessionNms() {
		return sessionNms;
	}
	public void setSessionNms(String[] sessionNms) {
		this.sessionNms = sessionNms;
	}
	public String[] getEnrollStartDts() {
		return enrollStartDts;
	}
	public void setEnrollStartDts(String[] enrollStartDts) {
		this.enrollStartDts = enrollStartDts;
	}
	public String[] getEnrollEndDts() {
		return enrollEndDts;
	}
	public void setEnrollEndDts(String[] enrollEndDts) {
		this.enrollEndDts = enrollEndDts;
	}
	public String[] getCapacitys() {
		return capacitys;
	}
	public void setCapacitys(String[] capacitys) {
		this.capacitys = capacitys;
	}
	public String[] getWaitEnrollCnts() {
		return waitEnrollCnts;
	}
	public void setWaitEnrollCnts(String[] waitEnrollCnts) {
		this.waitEnrollCnts = waitEnrollCnts;
	}
	public String getSessionNm() {
		return sessionNm;
	}
	public void setSessionNm(String sessionNm) {
		this.sessionNm = sessionNm;
	}
	public String getSgrNm() {
		return sgrNm;
	}
	public void setSgrNm(String sgrNm) {
		this.sgrNm = sgrNm;
	}
	public String getLearnStartDt() {
		return learnStartDt;
	}
	public void setLearnStartDt(String learnStartDt) {
		this.learnStartDt = learnStartDt;
	}
	public String getLearnStartDtStr() {
		return learnStartDtStr;
	}
	public void setLearnStartDtStr(String learnStartDtStr) {
		this.learnStartDtStr = learnStartDtStr;
	}
	public String getLearnStartHour() {
		return learnStartHour;
	}
	public void setLearnStartHour(String learnStartHour) {
		this.learnStartHour = learnStartHour;
	}
	public String getLearnStartMin() {
		return learnStartMin;
	}
	public void setLearnStartMin(String learnStartMin) {
		this.learnStartMin = learnStartMin;
	}
	public String getLearnStartTime() {
		return learnStartTime;
	}
	public void setLearnStartTime(String learnStartTime) {
		this.learnStartTime = learnStartTime;
	}
	public String getLearnEndDt() {
		return learnEndDt;
	}
	public void setLearnEndDt(String learnEndDt) {
		this.learnEndDt = learnEndDt;
	}
	public String getLearnEndDtStr() {
		return learnEndDtStr;
	}
	public void setLearnEndDtStr(String learnEndDtStr) {
		this.learnEndDtStr = learnEndDtStr;
	}
	public String getLearnEndHour() {
		return learnEndHour;
	}
	public void setLearnEndHour(String learnEndHour) {
		this.learnEndHour = learnEndHour;
	}
	public String getLearnEndMin() {
		return learnEndMin;
	}
	public void setLearnEndMin(String learnEndMin) {
		this.learnEndMin = learnEndMin;
	}
	public String getLearnEndTime() {
		return learnEndTime;
	}
	public void setLearnEndTime(String learnEndTime) {
		this.learnEndTime = learnEndTime;
	}
	public String[] getLearnStartDts() {
		return learnStartDts;
	}
	public void setLearnStartDts(String[] learnStartDts) {
		this.learnStartDts = learnStartDts;
	}
	public String[] getLearnEndDts() {
		return learnEndDts;
	}
	public void setLearnEndDts(String[] learnEndDts) {
		this.learnEndDts = learnEndDts;
	}
	public String getDuplEnrollYn() {
		return duplEnrollYn;
	}
	public void setDuplEnrollYn(String duplEnrollYn) {
		this.duplEnrollYn = duplEnrollYn;
	}
	public String getEduPlace() {
		return eduPlace;
	}
	public void setEduPlace(String eduPlace) {
		this.eduPlace = eduPlace;
	}
	public int getEnrollCnt() {
		return enrollCnt;
	}
	public void setEnrollCnt(int enrollCnt) {
		this.enrollCnt = enrollCnt;
	}
	public String getLocId() {
		return locId;
	}
	public void setLocId(String locId) {
		this.locId = locId;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}	
