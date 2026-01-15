package com.gocle.yangju.forest.adm.chsubjopen.web;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.gocle.yangju.forest.adm.chsearch.service.SearchManageService;
import com.gocle.yangju.forest.adm.chsubj.service.SubjManageService;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjManageVo;
import com.gocle.yangju.forest.adm.chsubjopen.service.EnrollManageService;
import com.gocle.yangju.forest.adm.chsubjopen.service.SubjSeqManageService;
import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;
import com.gocle.yangju.forest.adm.chsubjopen.vo.SubjSeqManageVo;
import com.gocle.yangju.forest.adm.code.service.AdminCodeService;
import com.gocle.yangju.forest.adm.code.vo.CodeVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;
import com.gocle.yangju.yjcareer.sms.vo.SmsVO;

@RequestMapping(value = "/adm/chsubjopen")
@Controller(value = "enrollManageController")
public class EnrollManageController {
	
	@Autowired
    SearchManageService searchManageService;
	
	@Autowired
	SubjManageService subjManageService;
	
	@Autowired
	SubjSeqManageService subjSeqManageService;
	
	@Autowired
	EnrollManageService enrollManageService;
	
	@Autowired
	AdminCodeService adminCodeService;
	
	/**
	 * 1:1 상담 수강신청관리
	 */
	@RequestMapping(value = "EnrollManageListA.do")
	public String EnrollManageListA(@ModelAttribute("searchVo") EnrollManageVo searchVo, ModelMap model) throws Exception {
		
		searchVo.setSearchSgrCd("A");
		
		int totalCount = this.enrollManageService.selectTotalCountA(searchVo);
		List<EnrollManageVo> resultList = enrollManageService.selectListA(searchVo);
		
		Integer pageSize = searchVo.getPageSize();
		Integer pageIndex = searchVo.getPageIndex();

		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(searchVo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCount);
        
        model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("resultList", resultList);
		
		model.addAttribute("menuId", searchVo.getMenuId());
		model.addAttribute("searchVo", searchVo);
		
		return "/adm/chsubjopen/EnrollManageListA";
	}
	
	/**
	 * 꿈자람센터 수강신청관리
	 */
	@RequestMapping(value = "EnrollManageList.do")
	public String EnrollManageListB(@ModelAttribute("searchVo") EnrollManageVo searchVo, ModelMap model) throws Exception {
		
		searchVo.setSearchSgrCd("B");
		
		int totalCount = this.enrollManageService.selectTotalCount(searchVo);
		List<EnrollManageVo> resultList = enrollManageService.selectList(searchVo);
		
		Integer pageSize = searchVo.getPageSize();
		Integer pageIndex = searchVo.getPageIndex();

		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(searchVo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCount);
        
        model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("resultList", resultList);
		
		model.addAttribute("menuId", searchVo.getMenuId());
		model.addAttribute("searchVo", searchVo);
		
		return "/adm/chsubjopen/EnrollManageList";
	}
	
	/**
	 * 1:1 상담 수강신청관리 상세
	 */
	@RequestMapping(value = "EnrollDetailManageListA.do")
	public String EnrollDetailManageListA(@ModelAttribute("enrollManageVo") EnrollManageVo searchVo
			, @ModelAttribute("subjSeqManageVo") SubjSeqManageVo subjSeqManageVo
			, @ModelAttribute("subjManageVo") SubjManageVo subjManageVo
			, ModelMap model) throws Exception {
		
		model.addAttribute("menuId", searchVo.getMenuId());
		model.addAttribute("resultMap", subjManageService.select(subjManageVo));
		
		int totalCount = this.enrollManageService.selectEnrollDetailTotalCountA(searchVo);
		List<EnrollManageVo> resultList = this.enrollManageService.selectEnrollDetailListA(searchVo);
		
		Integer pageSize = searchVo.getPageSize();
		Integer pageIndex = searchVo.getPageIndex();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(searchVo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCount);
		
        model.addAttribute("searchVo", searchVo);
        model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("resultList", resultList);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("ENROLL_STATUS_CD");
		model.addAttribute("enrollStatusList", adminCodeService.selectCodeList(cvo));
		
		return "/adm/chsubjopen/EnrollDetailManageListA";
	}
	
	/**
	 * 꿈자람센터 프로그램 수강신청관리 상세
	 */
	@RequestMapping(value = "EnrollDetailManageList.do")
	public String EnrollDetailManageList(@ModelAttribute("enrollManageVo") EnrollManageVo searchVo
			, @ModelAttribute("subjSeqManageVo") SubjSeqManageVo subjSeqManageVo, ModelMap model) throws Exception {
		
		model.addAttribute("menuId", searchVo.getMenuId());
		model.addAttribute("resultMap", subjSeqManageService.select(subjSeqManageVo));
		
		int totalCount = this.enrollManageService.selectEnrollDetailTotalCount(searchVo);
		List<EnrollManageVo> resultList = this.enrollManageService.selectEnrollDetailList(searchVo);
		
		Integer pageSize = searchVo.getPageSize();
		Integer pageIndex = searchVo.getPageIndex();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(searchVo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCount);
		
        model.addAttribute("searchVo", searchVo);
        model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("resultList", resultList);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("ENROLL_STATUS_CD");
		model.addAttribute("enrollStatusList", adminCodeService.selectCodeList(cvo));
		
		return "/adm/chsubjopen/EnrollDetailManageList";
	}
	
	@RequestMapping("/popup/EnrollDetailManageUpdateForm.do")
	public String EnrollManageUpdateForm(@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo
			,@ModelAttribute("subjSeqManageVo") SubjSeqManageVo subjSeqManageVo, ModelMap model) throws Exception {
		model.addAttribute("cmd", "Update");
		model.addAttribute("resultMap", subjSeqManageService.select(subjSeqManageVo));
		model.addAttribute("userInfo", enrollManageService.selectEnrollUserInfo(enrollManageVo));
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("RESDNC_DETAIL");
		model.addAttribute("resdncList", adminCodeService.selectCodeList(cvo));
		cvo.setCodeGroup("AGE_GROUP");
		model.addAttribute("ageList", adminCodeService.selectCodeList(cvo));
		cvo.setCodeGroup("GRADE");
		model.addAttribute("gradeList", adminCodeService.selectCodeList(cvo));
		
		return "/adm/chsubjopen/popup/EnrollDetailManageForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "EnrollDetailManageInsert.do")
	public String EnrollDetailManageInsert(@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo, SessionStatus status) throws Exception {
		
		String retMsg;
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(enrollManageVo);
		
		/*int result = enrollManageService.insert(enrollManageVo);
		
		if (result > 0) {
            retMsg = "등록되었습니다.";
            status.setComplete();
        } else {
            retMsg = "등록에 실패했습니다.";
        }*/
		enrollManageService.insert(enrollManageVo);
		
		// 등록처리된 수강생이 1명 이상인 경우
		if(enrollManageVo.getUserCnt() > 0) {
			if (enrollManageVo.getEduErrCnt() > 0 || enrollManageVo.getDupErrCnt() > 0) {
				status.setComplete();
				retMsg = enrollManageVo.getUserCnt() + "명 등록되었습니다.\n"
						+ enrollManageVo.getDupErrCnt() + "명은 이미 등록상태입니다.";
			} else {
				status.setComplete();
				retMsg = enrollManageVo.getUserCnt() + "명 등록되었습니다.";
			}
		} else {
			if (enrollManageVo.getEduErrCnt() > 0 || enrollManageVo.getDupErrCnt() > 0) {
				retMsg = enrollManageVo.getDupErrCnt() + "명은 이미 등록상태입니다.";
			} else {
				retMsg = "등록에 실패 하였습니다.";
			}
		}
			
		return retMsg;
	}
	
	@ResponseBody
	@RequestMapping(value = "EnrollDetailManageUpdate.do")
	public String EnrollDetailManageUpdate(@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo, SessionStatus status) throws Exception {
		
		String retMsg;
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(enrollManageVo);
		
		int result = enrollManageService.update(enrollManageVo);
		
		if (result > 0) {
            retMsg = "수정되었습니다.";
            status.setComplete();
        } else {
            retMsg = "수정에 실패했습니다.";
        }
		
		return retMsg;
	}
	
	@ResponseBody
	@RequestMapping(value = "EnrollDetailManageDelete.do")
	public String EnrollDetailManageDelete(@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo, SessionStatus status) throws Exception {
		
		String retMsg = "";
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(enrollManageVo);
		
		int result = enrollManageService.delete(enrollManageVo);
		
		if (result > 0) {
            retMsg = "삭제되었습니다.";
            status.setComplete();
        } else {
            retMsg = "삭제에 실패했습니다.";
        }
		
		return retMsg;
	}
	
	@ResponseBody
	@RequestMapping(value = "EnrollDetailManageApply.do")
	public String EnrollDetailManageApply(@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo, SessionStatus status) throws Exception {
		String retMsg = "";
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(enrollManageVo);
		
		enrollManageService.updateEnrollApply(enrollManageVo);
		
		// 수강승인처리된 수강생이 1명 이상인 경우
		if(enrollManageVo.getUserCnt() > 0) {
			if (enrollManageVo.getEduErrCnt() > 0 || enrollManageVo.getDupErrCnt() > 0) {
				status.setComplete();
				retMsg = enrollManageVo.getUserCnt() + "명 수강승인 되었습니다.\n"
						+ enrollManageVo.getDupErrCnt() + "명은 이미 수강승인 상태입니다.\n"+ enrollManageVo.getEduErrCnt()
						+ "명은 수강승인 실패하였습니다.\n(수강신청이 되어 있지 않거나 삭제된 수강생인지 확인하세요.)";
			} else {
				status.setComplete();
				retMsg = enrollManageVo.getUserCnt() + "명 수강 승인이 완료 되었습니다.";
			}
		} else {
			if (enrollManageVo.getEduErrCnt() > 0 || enrollManageVo.getDupErrCnt() > 0) {
				retMsg = enrollManageVo.getDupErrCnt() + "명은 이미 수강승인 상태입니다.\n"
						+ enrollManageVo.getEduErrCnt() + "명 수강승인 실패하였습니다.\n(수강신청 정보가 없거나 삭제된 수강생인지 확인하세요.)";
			} else {
				retMsg = "수강 승인에 실패 하였습니다.";
			}
		}
		
		return retMsg;
	}
	
	@ResponseBody
	@RequestMapping(value = "EnrollDetailManageApplyCancel.do")
	public String EnrollDetailManageApplyCancel(@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo, SessionStatus status) throws Exception {
		String retMsg = "";
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(enrollManageVo);
		
		enrollManageService.updateEnrollApplyCancel(enrollManageVo);
		
		// 승인취소처리된 수강생이 1명 이상인 경우
		if(enrollManageVo.getUserCnt() > 0) {
			if (enrollManageVo.getEduErrCnt() > 0 || enrollManageVo.getDupErrCnt() > 0) {
				status.setComplete();
				retMsg = enrollManageVo.getUserCnt() + "명 승인취소 되었습니다.\n"
						+ enrollManageVo.getDupErrCnt() + "명은 이미 승인취소 상태입니다.\n"+ enrollManageVo.getEduErrCnt()
						+ "명은 승인취소 실패하였습니다.\n(수강신청이 되어 있지 않거나 삭제된 수강생인지 확인하세요.)";
			} else {
				status.setComplete();
				retMsg = enrollManageVo.getUserCnt() + "명 승인취소가 완료 되었습니다.";
			}
		} else {
			if (enrollManageVo.getEduErrCnt() > 0 || enrollManageVo.getDupErrCnt() > 0) {
				retMsg = enrollManageVo.getDupErrCnt() + "명은 이미 승인취소 상태입니다.\n"
						+ enrollManageVo.getEduErrCnt() + "명 승인취소 실패하였습니다.\n(수강신청 정보가 없거나 삭제된 수강생인지 확인하세요.)";
			} else {
				retMsg = "승인취소에 실패 하였습니다.";
			}
		}
		
		return retMsg;
	}
	
	/**
	 * 행사 및 강좌 수강신청관리
	 */
	@RequestMapping(value = "EnrollManageListC.do")
	public String EnrollManageListC(@ModelAttribute("searchVo") EnrollManageVo searchVo, ModelMap model) throws Exception {
		
		searchVo.setSearchSgrCd("C");
		
		int totalCount = this.enrollManageService.selectTotalCount(searchVo);
		List<EnrollManageVo> resultList = enrollManageService.selectList(searchVo);
		
		Integer pageSize = searchVo.getPageSize();
		Integer pageIndex = searchVo.getPageIndex();

		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(searchVo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCount);
        
        model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("resultList", resultList);
		
		model.addAttribute("menuId", searchVo.getMenuId());
		model.addAttribute("searchVo", searchVo);
		
		return "/adm/chsubjopen/EnrollManageList";
	}
	
    
    @RequestMapping("/popup/SmsSendForm.do")
    public String smsSendForm(@ModelAttribute("smsVo") SmsVO smsVo, @ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo,  ModelMap model) throws Exception {
    	
    	List<EnrollManageVo> resultList = new ArrayList<>();;
    	
    	for(String diKey : enrollManageVo.getDiKeys()) {
    		String[] parts = diKey.split("_");
		    
			enrollManageVo.setSeqCd(parts[0]);
			enrollManageVo.setDiKey(parts[1]);
			
			EnrollManageVo enroll = enrollManageService.selectEnrollUserInfo(enrollManageVo);
			
			if(enroll != null) {
				resultList.add(enroll);
			}
    	}
    	
    	model.addAttribute("enrollManageVo", enrollManageVo);
    	model.addAttribute("resultList", resultList);
    	
    	return "/adm/chsubjopen/popup/SmsSendForm";
    }
    
    @RequestMapping("EnrollResultExcelDownload.do")
    public void EnrollResultExcelDownload(@ModelAttribute("enrollManageVo") EnrollManageVo searchVo
			, @ModelAttribute("subjSeqManageVo") SubjSeqManageVo subjSeqManageVo
			, @ModelAttribute("subjManageVo") SubjManageVo subjManageVo
			, ModelMap model
			, HttpServletResponse response) throws Exception {
    	
    	String subjNm = "";
    	List<EnrollManageVo> resultList = new ArrayList<>();
    	
		if ("A".equals(searchVo.getSgrCd())) {
			subjNm = subjManageService.select(subjManageVo).getSubjNm();
			resultList = this.enrollManageService.selectEnrollDetailListA(searchVo);
		} else {
			subjNm = subjSeqManageService.select(subjSeqManageVo).getSubjNm();
			resultList = this.enrollManageService.selectEnrollDetailList(searchVo);
		}
		 
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("수강신청관리");
		CellStyle headerStyle = workbook.createCellStyle();
		
		headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
	    headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    headerStyle.setBorderBottom(BorderStyle.THIN);
	    headerStyle.setBorderTop(BorderStyle.THIN);
	    headerStyle.setBorderLeft(BorderStyle.THIN);
	    headerStyle.setBorderRight(BorderStyle.THIN);
	    headerStyle.setAlignment(HorizontalAlignment.CENTER);
	    headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	    
	    Font headerFont = workbook.createFont();
	    headerFont.setBold(true);
	    headerStyle.setFont(headerFont);
	    
	    CellStyle titleStyle = workbook.createCellStyle();
        Font titleFont = workbook.createFont();
        titleFont.setBold(true);
        titleFont.setFontHeightInPoints((short)20);
        titleStyle.setFont(titleFont);
        titleStyle.setAlignment(HorizontalAlignment.CENTER); 
        titleStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        
        CellStyle bodyStyle = workbook.createCellStyle();
        bodyStyle.setAlignment(HorizontalAlignment.CENTER);
        bodyStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);
     
        int rowNum = 0;
        Row titleRow = sheet.createRow(rowNum++);
        Cell titleCell = titleRow.createCell(0);
        titleCell.setCellValue(subjNm);
        titleCell.setCellStyle(titleStyle);
        if ("A".equals(searchVo.getSgrCd())) {
        	sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 19));
        } else {
        	sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 16));
        }
        
        Row header = sheet.createRow(rowNum++);
	    String[] columns;
	    
	    if ("A".equals(searchVo.getSgrCd())) {
	    	columns = new String[]{"번호","과정운영코드","교육강좌명","기수","이름","성별","연령대","학교명","학년","휴대전화","예약상황 문자 수신 여부","우편번호","주소","거주지","메모","신청일자","신청상태","승인일자","관리자 등록여부", "수료여부"};
		} else {
			columns = new String[]{"번호","이름","성별","연령대","학교명","학년","휴대전화","예약상황 문자 수신 여부","우편번호","주소","거주지","메모","신청일자","신청상태","승인일자","관리자 등록여부", "수료여부"};
		}
	    
	    for(int i=0; i<columns.length; i++) {
	        Cell cell = header.createCell(i);
	        cell.setCellValue(columns[i]);
	        cell.setCellStyle(headerStyle);
	    }
	    
	    for(EnrollManageVo e : resultList) {
	    	Row row = sheet.createRow(rowNum++);
	    	row.createCell(0).setCellValue(rowNum-2);
	    	
	    	if ("A".equals(searchVo.getSgrCd())) {
	    		row.createCell(1).setCellValue(e.getSeqCd());
	    		row.createCell(2).setCellValue(e.getSubjNm());
	    		row.createCell(3).setCellValue(e.getSessionNm());
	    		row.createCell(4).setCellValue(e.getMemName());
		        row.createCell(5).setCellValue(e.getSexdstn());
		        row.createCell(6).setCellValue(e.getAgeGroup());
		        row.createCell(7).setCellValue(e.getSchoolNm());
		        row.createCell(8).setCellValue(e.getGrade());
		        row.createCell(9).setCellValue(e.getHpTel1());
		        row.createCell(10).setCellValue(e.getSmsYn());
		        row.createCell(11).setCellValue(e.getZipcode());
		        row.createCell(12).setCellValue(e.getAddress());
		        row.createCell(13).setCellValue(e.getResdncDetail());
		        row.createCell(14).setCellValue(e.getMemo());
		        row.createCell(15).setCellValue(e.getRegDt());
		        row.createCell(16).setCellValue(e.getEnrollStatusNm());
		        row.createCell(17).setCellValue("B".equals(e.getEnrollStatusCd()) ? e.getEnrollAppDt() : "");
		        row.createCell(18).setCellValue(e.getForceYn());
		        row.createCell(19).setCellValue(e.getCompleteYn());
		        
		        for (int i = 0; i <= 19; i++) {
		        	Cell cell = row.getCell(i);
		            cell.setCellStyle(bodyStyle);
		        }
	    	} else {
	    		row.createCell(1).setCellValue(e.getMemName());
		        row.createCell(2).setCellValue(e.getSexdstn());
		        row.createCell(3).setCellValue(e.getAgeGroup());
		        row.createCell(4).setCellValue(e.getSchoolNm());
		        row.createCell(5).setCellValue(e.getGrade());
		        row.createCell(6).setCellValue(e.getHpTel1());
		        row.createCell(7).setCellValue(e.getSmsYn());
		        row.createCell(8).setCellValue(e.getZipcode());
		        row.createCell(9).setCellValue(e.getAddress());
		        row.createCell(10).setCellValue(e.getResdncDetail());
		        row.createCell(11).setCellValue(e.getMemo());
		        row.createCell(12).setCellValue(e.getRegDt());
		        row.createCell(13).setCellValue(e.getEnrollStatusNm());
		        row.createCell(14).setCellValue("B".equals(e.getEnrollStatusCd()) ? e.getEnrollAppDt() : "");
		        row.createCell(15).setCellValue(e.getForceYn());
		        row.createCell(16).setCellValue(e.getCompleteYn());
		        
		        for (int i = 0; i <= 16; i++) {
		        	Cell cell = row.getCell(i);
		            cell.setCellStyle(bodyStyle);
		        }
	    	}
	    }
	    
	    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	    String fileName = subjNm + " 수강신청관리.xlsx";
	    fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
	    response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + fileName);
	    OutputStream out = response.getOutputStream();
	    workbook.write(out);
	    workbook.close();
	    out.flush();
	    out.close();
    }
}
