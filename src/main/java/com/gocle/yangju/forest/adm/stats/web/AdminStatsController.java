package com.gocle.yangju.forest.adm.stats.web;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gocle.yangju.forest.adm.stats.service.AdminStatsService;
import com.gocle.yangju.forest.adm.stats.vo.StatsVO;


@Controller
@RequestMapping("/adm/stats/")
public class AdminStatsController {

	
	@Autowired
	AdminStatsService adminStatsService;
	
	/**
	 * 프로그램 운영 통계
	 * @param statsVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/programStats.do")
	public String programStats(@PathVariable("pgType") String pgType, @ModelAttribute("form") StatsVO statsVO, Model model) throws Exception {
		
		String menuId = statsVO.getMenuId();
		int totalCnt = 0;
		Integer pageSize = statsVO.getPageSize();
		Integer pageIndex = statsVO.getPageIndex();
		
		List<String> classTypeList = Arrays.asList("ONEDAY", "DIY", "CHILD");
	    model.addAttribute("classTypeList", classTypeList);
		
	    List<String> yearList = adminStatsService.selectYearsByClassType(statsVO);
	    List<String> monthList = new ArrayList<>();
	    if (statsVO.getYear() != null && !statsVO.getYear().isEmpty()) {
	        monthList = adminStatsService.selectMonthByYear(statsVO);
	    }

	    model.addAttribute("yearList", yearList);
	    model.addAttribute("monthList", monthList);
	    
	    String classType = statsVO.getClassType();
	    String year = statsVO.getYear();
	    String month = statsVO.getMonth();
	    
	    List<StatsVO> statsList = new ArrayList<>();
	    StatsVO totalStats = new StatsVO();
	    if (StringUtils.isNoneEmpty(classType, year, month)) {
	        statsList = adminStatsService.selectMonthStats(statsVO);
	        if(0 < statsList.size()) {
				totalCnt = Integer.parseInt( statsList.get(0).getTotalCount() );
			}
	    }
	    for (StatsVO s : statsList) {
	    	totalStats.setPeopleCnt(String.valueOf(parseSafe(totalStats.getPeopleCnt()) + parseSafe(s.getPeopleCnt())));

	    	int participantCount = parseSafe(s.getPeopleCnt());
	    	int priceSum = parseSafe(s.getPrice()) + parseSafe(s.getOptionPrice());
	    	totalStats.setPrice(String.valueOf(parseSafe(totalStats.getPrice()) + priceSum * participantCount));

	    	totalStats.setTotalAmt(String.valueOf(parseSafe(totalStats.getTotalAmt()) + parseSafe(s.getAmount())));
	    	totalStats.setTotalMCnt(String.valueOf(parseSafe(totalStats.getTotalMCnt()) + parseSafe(s.getmCnt())));
	    	totalStats.setTotalFCnt(String.valueOf(parseSafe(totalStats.getTotalFCnt()) + parseSafe(s.getfCnt())));
	    }
	    
	    PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(statsVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
	    model.addAttribute("paginationInfo", paginationInfo);
	    model.addAttribute("statsList", statsList);
	    model.addAttribute("totalStats", totalStats);
	    model.addAttribute("statsVO", statsVO);
	    model.addAttribute("menuId", menuId);

	    return "/adm/stats/" + pgType + "/programStats";
	}
	
	/**
	 * 연월 조회
	 * @param pgType
	 * @param statsVO
	 * @param yearYn
	 * @param monthYn
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/dateList.do")
	@ResponseBody
	public Map<String, Object> getDateList(@PathVariable("pgType") String pgType, @ModelAttribute("form") StatsVO statsVO,
	                                       @RequestParam(required = false) Boolean yearYn, @RequestParam(required = false) Boolean monthYn) throws Exception {
	    Map<String, Object> map = new HashMap<>();
	    if (yearYn != null && yearYn) {
	        map.put("yearList", adminStatsService.selectYearsByClassType(statsVO));
	    }

	    if (monthYn != null && monthYn && statsVO.getYear() != null && !statsVO.getYear().isEmpty()) {
	        map.put("monthList", adminStatsService.selectMonthByYear(statsVO));
	    }

	    return map;
	}
	
	private int parseSafe(String value) {
	    return (value == null || value.isEmpty()) ? 0 : Integer.parseInt(value);
	}
	
	/**
	 * 프로그램 통계 엑셀다운로드
	 * @param pgType
	 * @param statsVO
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/programStatsExcel.do")
	public void programStatsExcel(@PathVariable("pgType") String pgType,
	                              @ModelAttribute("form") StatsVO statsVO,
	                              HttpServletResponse response) throws Exception {

	    List<StatsVO> statsList = adminStatsService.selectMonthStats(statsVO);

	    StatsVO totalStats = new StatsVO();
	    for (StatsVO s : statsList) {
	        totalStats.setPeopleCnt(String.valueOf(parseSafe(totalStats.getPeopleCnt()) + parseSafe(s.getPeopleCnt())));
	        int participantCount = parseSafe(s.getPeopleCnt());
	        int priceSum = parseSafe(s.getPrice()) + parseSafe(s.getOptionPrice());
	        totalStats.setPrice(String.valueOf(parseSafe(totalStats.getPrice()) + priceSum * participantCount));
	        totalStats.setTotalAmt(String.valueOf(parseSafe(totalStats.getTotalAmt()) + parseSafe(s.getAmount())));
	        totalStats.setTotalMCnt(String.valueOf(parseSafe(totalStats.getTotalMCnt()) + parseSafe(s.getmCnt())));
	        totalStats.setTotalFCnt(String.valueOf(parseSafe(totalStats.getTotalFCnt()) + parseSafe(s.getfCnt())));
	    }

	    String fileName = URLEncoder.encode("프로그램통계_" + statsVO.getYear() + "_" + statsVO.getMonth() + ".xls", "UTF-8");
	    response.setContentType("application/vnd.ms-excel");
	    response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

	    HSSFWorkbook workbook = new HSSFWorkbook();
	    HSSFSheet sheet = workbook.createSheet("월별통계");

	    String title = statsVO.getYear() + "년 목재문화체험장 체험수입내역 (" + statsVO.getMonth() + "월)";
	    HSSFRow titleRow = sheet.createRow(0);
	    HSSFCell titleCell = titleRow.createCell(0);
	    titleCell.setCellValue(title);

	    sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 11));

	    HSSFCellStyle titleStyle = workbook.createCellStyle();
	    HSSFFont titleFont = workbook.createFont();
	    titleFont.setBold(true);
	    titleFont.setFontHeightInPoints((short)14);
	    titleStyle.setFont(titleFont);
	    titleStyle.setAlignment(HorizontalAlignment.CENTER);
	    titleCell.setCellStyle(titleStyle);
	    
	    HSSFCellStyle headerStyle = workbook.createCellStyle();
	    headerStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.LIGHT_YELLOW.getIndex());
	    headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    headerStyle.setAlignment(HorizontalAlignment.CENTER);
	    headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	    HSSFFont headerFont = workbook.createFont();
	    headerFont.setBold(true);
	    headerStyle.setFont(headerFont);

	    HSSFRow headerRow = sheet.createRow(2);
	    String[] totalColumns = {"총계","총 인원","총 체험금액","총 결제금액","총 남","총 여"};
	    for (int i = 0; i < totalColumns.length; i++) {
	        HSSFCell cell = headerRow.createCell(i);
	        cell.setCellValue(totalColumns[i]);
	        cell.setCellStyle(headerStyle);
	    }


	    HSSFRow totalRow = sheet.createRow(3);
	    totalRow.createCell(0).setCellValue("-");
	    totalRow.createCell(1).setCellValue(parseSafe(totalStats.getPeopleCnt()));
	    totalRow.createCell(2).setCellValue(parseSafe(totalStats.getPrice()));
	    totalRow.createCell(3).setCellValue(parseSafe(totalStats.getTotalAmt()));
	    totalRow.createCell(4).setCellValue(parseSafe(totalStats.getTotalMCnt()));
	    totalRow.createCell(5).setCellValue(parseSafe(totalStats.getTotalFCnt()));

	    HSSFRow detailHeader = sheet.createRow(5);
	    String[] columns = {"프로그램명","체험일","체험품목","인원","체험금액","총금액",
	                        "통장내역날짜","통장내역금액","통장내역이름","남","여","비고"};
	    for (int i=0; i<columns.length; i++) {
	    	HSSFCell cell = detailHeader.createCell(i);
	        cell.setCellValue(columns[i]);
	        cell.setCellStyle(headerStyle);
	    }

	    int rowIdx = 6;
	    for (StatsVO row : statsList) {
	        HSSFRow r = sheet.createRow(rowIdx++);
	        r.createCell(0).setCellValue(row.getPgName());
	        r.createCell(1).setCellValue(row.getSlotDate() + " " + row.getSlotNo() + "부");
	        r.createCell(2).setCellValue(row.getProductName());
	        r.createCell(3).setCellValue(parseSafe(row.getPeopleCnt()));
	        r.createCell(4).setCellValue(parseSafe(row.getPrice()) + parseSafe(row.getOptionPrice()));
	        r.createCell(5).setCellValue((parseSafe(row.getPrice()) + parseSafe(row.getOptionPrice())) * parseSafe(row.getPeopleCnt()));
	        r.createCell(6).setCellValue(row.getPayDt());
	        r.createCell(7).setCellValue(parseSafe(row.getAmount()));
	        r.createCell(8).setCellValue(row.getPayName());
	        r.createCell(9).setCellValue(parseSafe(row.getmCnt()));
	        r.createCell(10).setCellValue(parseSafe(row.getfCnt()));
	        r.createCell(11).setCellValue(row.getNote());
	    }

	    workbook.write(response.getOutputStream());
	    workbook.close();
	}
}
