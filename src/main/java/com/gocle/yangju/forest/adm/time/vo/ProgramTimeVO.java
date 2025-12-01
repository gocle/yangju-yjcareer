package com.gocle.yangju.forest.adm.time.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class ProgramTimeVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = -3939751410221790945L;
	
	/** 슬롯ID */
	private String slotId;
	/** 프로그램ID */
	private String pgId;
	/** 회차 */
	private int slotNo;
	/** 체험일 */
	private String slotDate;
	/** 시작시간 */
	private LocalTime startTime;
	/** 종료시간 */
	private LocalTime endTime;
	/** 모집정원 */
	private String capacity;
	/** 예약인원 */
	private String resvCnt;
	/** 프로그램명 */
	private String pgName;
	
	public String getSlotId() {
		return slotId;
	}
	public void setSlotId(String slotId) {
		this.slotId = slotId;
	}
	public String getPgId() {
		return pgId;
	}
	public void setPgId(String pgId) {
		this.pgId = pgId;
	}
	public int getSlotNo() {
		return slotNo;
	}
	public void setSlotNo(int slotNo) {
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
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
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
	public String getSlotDate() {
		return slotDate;
	}
	public void setSlotDate(String slotDate) {
		this.slotDate = slotDate;
	}
	
}
