package com.gocle.yangju.forest.usr.program.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.gocle.yangju.forest.comm.vo.BaseVO;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class UserProgramVO extends BaseVO implements Serializable {
    private static final long serialVersionUID = -573368458605795364L;

    // FullCalendar에 내려줄 때 사용할 ISO 포맷 (초까지, 소수점 제외)
    private static final DateTimeFormatter ISO = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");

    // ===== DB 매핑용 필드 =====
    private String pgId;                 // PG_ID
    private String pgType;               // PG_TYPE: wood | forest ...
    private String pgName;               // PG_NAME
    private String pgDesc;
    private String pgTarget;
    private String duration;
    private String location;
    private String instructorName;
    private String contact;
    private String pgThumbpath;
    private LocalDateTime startDate;     // START_DATE
    private LocalDateTime endDate;       // END_DATE
    private String status;               // STATUS
    private LocalDateTime regOpenDate;   // REG_OPEN_DATE
    private LocalDateTime regCloseDate;  // REG_CLOSE_DATE
    private String classType;
    private String statusEnd;

    // (필요시 사용) 요청 파라미터 바인딩용
    private String types;
    
    private String capacity;
    
    private String pgCode;
    private String pgCodeNm;
    
	private String pgTargetNm;
	
	private String locationNm;
	
	//숲체험 신청 인수
	private int regCnt;

    // ===== FullCalendar용 계산 게터 =====
    /** groupId = PG_TYPE */
    @JsonProperty("groupId")
    public String getGroupId() {
        return pgType;
    }

    /** title = PG_NAME */
    @JsonProperty("title")
    public String getTitle() {
        return pgName;
    }

    /** start = START_DATE (날짜만) */
    @JsonProperty("start")
    public String getStart() {
        return startDate == null ? null : startDate.toLocalDate().toString();
    }

    /** end = END_DATE + 1일 (날짜만, exclusive 규칙) */
    @JsonProperty("end")
    public String getEnd() {
        if (endDate == null) return null;
        return endDate.toLocalDate().plusDays(1).toString();
    }

    /** allDay 이벤트임을 명시 */
    @JsonProperty("allDay")
    public boolean isAllDay() {
        return true;
    }

    /** 타입별 색상 */
    @JsonProperty("backgroundColor")
    public String getBackgroundColor() {
        if ("forest".equalsIgnoreCase(pgType)) return "#56ab2d";
        if ("wood".equalsIgnoreCase(pgType))   return "#f7b146";
        return "#999999";
    }



    // ===== DB 필드용 Getter/Setter =====
    public String getPgId() { return pgId; }
    public void setPgId(String pgId) { this.pgId = pgId; }

    public String getPgType() { return pgType; }
    public void setPgType(String pgType) { this.pgType = pgType; }

    public String getPgName() { return pgName; }
    public void setPgName(String pgName) { this.pgName = pgName; }

    // DB 원본 날짜는 응답 JSON에서 숨기고 싶다면 @JsonIgnore
    @JsonIgnore
    public LocalDateTime getStartDate() { return startDate; }
    public void setStartDate(LocalDateTime startDate) { this.startDate = startDate; }

    @JsonIgnore
    public LocalDateTime getEndDate() { return endDate; }
    public void setEndDate(LocalDateTime endDate) { this.endDate = endDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    @JsonIgnore
    public LocalDateTime getRegOpenDate() { return regOpenDate; }
    public void setRegOpenDate(LocalDateTime regOpenDate) { this.regOpenDate = regOpenDate; }

    @JsonIgnore
    public LocalDateTime getRegCloseDate() { return regCloseDate; }
    public void setRegCloseDate(LocalDateTime regCloseDate) { this.regCloseDate = regCloseDate; }

    public String getTypes() { return types; }
    public void setTypes(String types) { this.types = types; }

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

	public String getPgThumbpath() {
		return pgThumbpath;
	}

	public void setPgThumbpath(String pgThumbpath) {
		this.pgThumbpath = pgThumbpath;
	}

	public String getClassType() {
		return classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

	public String getPgDesc() {
		return pgDesc;
	}

	public void setPgDesc(String pgDesc) {
		this.pgDesc = pgDesc;
	}
	
	@JsonIgnore
	public String getRegOpenDateYmd() {
	    return regOpenDate == null ? "" : regOpenDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}

	@JsonIgnore
	public String getRegCloseDateYmd() {
	    return regCloseDate == null ? "" : regCloseDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}
	
	@JsonIgnore
	public String getStartDateYmd() {
	    return startDate == null ? "" : startDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}

	@JsonIgnore
	public String getEndDateYmd() {
	    return endDate == null ? "" : endDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
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

	public int getRegCnt() {
		return regCnt;
	}

	public void setRegCnt(int regCnt) {
		this.regCnt = regCnt;
	}

	public String getStatusEnd() {
		return statusEnd;
	}

	public void setStatusEnd(String statusEnd) {
		this.statusEnd = statusEnd;
	}
	
	
}

