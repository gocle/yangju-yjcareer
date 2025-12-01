package com.gocle.yangju.forest.adm.reservation.web;

import java.beans.PropertyEditorSupport;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.code.service.AdminCodeService;
import com.gocle.yangju.forest.adm.code.vo.CodeVO;
import com.gocle.yangju.forest.adm.product.service.AdminProductService;
import com.gocle.yangju.forest.adm.product.vo.ProductVO;
import com.gocle.yangju.forest.adm.program.service.AdminProgramService;
import com.gocle.yangju.forest.adm.program.vo.ProgramVO;
import com.gocle.yangju.forest.adm.reservation.service.AdminReservationService;
import com.gocle.yangju.forest.adm.reservation.vo.ReservationVO;
import com.gocle.yangju.forest.adm.reservation.vo.ResvListForm;
import com.gocle.yangju.forest.adm.time.service.AdminProgramTimeService;
import com.gocle.yangju.forest.adm.time.vo.ProgramTimeVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;


@Controller
@RequestMapping("/adm/reservation/")
public class AdminReservationController {

	@Autowired
	AdminReservationService adminReservationService;
	
	@Autowired
	AdminProgramService adminProgramService;
	
	@Autowired
	AdminProductService adminProductService;
	
	@Autowired
	AdminProgramTimeService adminProgramTimeService;
	
	@Autowired
	AdminCodeService adminCodeService;
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(LocalDate.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) throws IllegalArgumentException {
                if(text == null || text.isEmpty()) {
                    setValue(null);
                } else {
                    setValue(LocalDate.parse(text));
                }
            }
        });
    }
	
	/**
	 * 프로그램 목록
	 * @param pgType
	 * @param reservationVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/list.do")
	public String programList(@PathVariable("pgType") String pgType, @ModelAttribute("form")ReservationVO reservationVO, ModelMap model) throws Exception {
		
		String menuId = reservationVO.getMenuId();
		ProgramVO pvo = new ProgramVO();
		pvo.setPgType(pgType);
		pvo.setSearchCondition(reservationVO.getSearchCondition());
		pvo.setSearchKeyword(reservationVO.getSearchKeyword());
		pvo.setPageSize(reservationVO.getPageSize());
		pvo.setPageIndex(reservationVO.getPageIndex());
		List<ProgramVO> resultList = adminProgramService.selectProgramList(pvo);
		
		int totalCnt = 0;
		Integer pageSize = reservationVO.getPageSize();
		Integer pageIndex = reservationVO.getPageIndex();
		
		if(resultList.size() > 0) {
			totalCnt =Integer.parseInt(resultList.get(0).getTotalCount());
		}
		
	    PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(pvo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
        model.addAttribute("paginationInfo", paginationInfo);
        
        model.addAttribute("resultList", resultList);
        model.addAttribute("reservationVO", reservationVO);
        model.addAttribute("programVO", pvo);
        model.addAttribute("menuId",menuId);
		model.addAttribute("pgType", pgType);
		
		return "/adm/reservation/" + pgType + "/list";
	}
	
	/**
	 * 신청자 목록
	 * @param pgType
	 * @param reservationVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/applyList.do")
	public String applyList(@PathVariable("pgType") String pgType, @ModelAttribute("form")ReservationVO reservationVO,  ModelMap model) throws Exception {
		
		String menuId = reservationVO.getMenuId();
		ProgramVO pvo = new ProgramVO();
        pvo.setPgType(pgType);
        pvo.setPgId(reservationVO.getPgId());
        pvo = adminProgramService.selectProgram(pvo);
		
		List<ReservationVO> resultList = adminReservationService.selectApplyList(reservationVO);
		
		int totalCnt = 0;
		Integer pageSize = reservationVO.getPageSize();
		Integer pageIndex = reservationVO.getPageIndex();
		
		if(resultList.size() > 0) {
			totalCnt =Integer.parseInt(resultList.get(0).getTotalCount());
		}
		
	    PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(reservationVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
        model.addAttribute("paginationInfo", paginationInfo);
        
        model.addAttribute("resultList", resultList);
        model.addAttribute("reservationVO", reservationVO);
        model.addAttribute("programVO", pvo);
        model.addAttribute("menuId",menuId);
		model.addAttribute("pgType", pgType);
		model.addAttribute("pgCode", reservationVO.getPgCode());
		
		return "/adm/reservation/" + pgType + "/applyList";
	}
	
	/**
	 * 신청자 등록 폼
	 * @param pgType
	 * @param reservationVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/applyForm.do")
	public String applyForm(@PathVariable("pgType") String pgType, @ModelAttribute("form")ReservationVO reservationVO, ModelMap model) throws Exception {
		
		String menuId = reservationVO.getMenuId();
		ProgramVO pvo = new ProgramVO();
        pvo.setPgType(pgType);
        pvo.setPgId(reservationVO.getPgId());
        pvo = adminProgramService.selectProgram(pvo);
        
        List<ProgramTimeVO> timeList = adminProgramTimeService.selectProgramTimeList(reservationVO);
        
        if(pgType.equals("wood")) {
        	ProductVO productVO = new ProductVO();
        	List<ProductVO> productList = adminProductService.selectProductList(productVO);
        	model.addAttribute("productList", productList);
        }
        
        model.addAttribute("timeList", timeList);
        model.addAttribute("reservationVO", reservationVO);
        model.addAttribute("programVO", pvo);
        model.addAttribute("menuId",menuId);
		model.addAttribute("pgType", pgType);
		model.addAttribute("pgCode", reservationVO.getPgCode());
		
		// 장소
		if(pgType.equals("forest")) {
			
			ProgramVO programVO = new ProgramVO();
			programVO.setPgId(reservationVO.getPgId());
			
			// 프로그램 분류별 장소
			CodeVO cvo = new CodeVO(); if(reservationVO.getPgCode().equals("FOREST_INT")){ 
				cvo.setCodeGroup("GEN_PLACE"); 
			}else if(reservationVO.getPgCode().equals("CHILD_REG")) {
			  cvo.setCodeGroup("KIND_PLACE"); 
			}
			  
			List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
			model.addAttribute("codeList", codeList);
			
			
			
			// 프로그램 예약된 장소가 2개일때 예약된 장소
			int regPlaceCnt = adminReservationService.regPlaceCnt(reservationVO);
			
			if(regPlaceCnt == 2 && "FOREST_INT".equals(reservationVO.getPgCode())) {
				List<UserReservationVO> regPlaceList = adminReservationService.regPlace(reservationVO);
				model.addAttribute("locationList", regPlaceList);
			}else {
				// 프로그램 등록된 장소
				List<ProgramVO> locationList = adminProgramService.locationList(programVO);
				model.addAttribute("locationList", locationList);
			}
			
			if ("CHILD_REG".equals(reservationVO.getPgCode())) {
		        // 담당자 1인 정원
		        int perInstructorCap = parseCapacityAsInt(pvo.getCapacity());

		        // 기본: 장소당 2인(담당자 2명)
		        int defaultPerLocationMax = perInstructorCap * 2;

		        // ✨ 회암사지(TEMPLE)만 담당자 1명
		        Map<String,Integer> capByLoc = new HashMap<>();
		        capByLoc.put("TEMPLE", perInstructorCap); // 회암사지=1명 한도

		        // 장소별 사용 인원 집계 (이미 만든 쿼리/서비스 재사용)
		        List<Map<String,Object>> rows = adminReservationService.selectUsedByLocation(pvo.getPgId());
		        Map<String,Integer> usedByLoc = new LinkedHashMap<>();
		        if (rows != null) {
		            for (Map<String,Object> m : rows) {
		                String loc = String.valueOf(m.get("location")).trim();
		                int used   = (m.get("used") == null) ? 0 : Integer.parseInt(String.valueOf(m.get("used")));
		                usedByLoc.put(loc, used);
		            }
		        }

		        // locationList 기준으로 잔여 계산
		        Map<String,Integer> remainByLoc = new LinkedHashMap<>();
		        @SuppressWarnings("unchecked")
		        List<Object> locList = (List<Object>) model.get("locationList");
		        if (locList != null) {
		            for (Object o : locList) {
		                String loc = (o instanceof UserReservationVO) ? ((UserReservationVO)o).getLocation()
		                           : (o instanceof ProgramVO)       ? ((ProgramVO)o).getLocation()
		                           : null;
		                if (loc == null) continue;
		                loc = loc.trim();

		                int cap  = capByLoc.getOrDefault(loc, defaultPerLocationMax);
		                int used = usedByLoc.getOrDefault(loc, 0);
		                int rem  = Math.max(0, cap - used);

		                remainByLoc.put(loc, rem);
		            }
		        } else {
		            // locationList가 없을 때도 최소한 used 기준으로 내려줌
		            for (Map.Entry<String,Integer> e : usedByLoc.entrySet()) {
		                String loc = e.getKey();
		                int cap  = capByLoc.getOrDefault(loc, defaultPerLocationMax);
		                int used = e.getValue();
		                remainByLoc.put(loc, Math.max(0, cap - used));
		            }
		        }

		        model.addAttribute("perLocationMax", defaultPerLocationMax); // JS fallback용
		        model.addAttribute("remainByLoc",   remainByLoc);
		        // (선택) JSP에서 “담당자 1명” 라벨을 붙이고 싶으면 capByLoc도 내려줄 수 있음
		        model.addAttribute("capByLoc", capByLoc);
		    } else {
		        // FOREST_INT 등은 기존 로직 유지(peopleCnt 등)
		        int peopleCnt = adminProgramService.peopleCnt(new ProgramVO(){{
		            setPgId(reservationVO.getPgId());
		        }});
		        model.addAttribute("peopleCnt", peopleCnt);
		    }
		}
		
		return "/adm/reservation/" + pgType + "/applyForm";
	}
	
	private int parseCapacityAsInt(String cap) {
	    if (cap == null) return 0;
	    String s = cap.replaceAll("[^0-9.,]", "").replace(",", "");
	    if (s.isEmpty()) return 0;
	    try { return (int)Math.round(Double.parseDouble(s)); }
	    catch (Exception e) { return 0; }
	}
	
	/**
	 * 신청자 등록
	 * @param pgType
	 * @param resvListForm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/applyInsert.do")
	@ResponseBody
	public Map<String, Object> applyInsert(
	        @PathVariable("pgType") String pgType,
	        @ModelAttribute("applyForm") ResvListForm form) {

	    Map<String, Object> result = new HashMap<>();
	    try {
	        List<ReservationVO> list = form.getReservationList();
	        if (list == null || list.isEmpty()) {
	            result.put("success", false);
	            result.put("message", "신청 항목이 없습니다.");
	            return result;
	        }
	        
	        String pgId = list.get(0).getPgId();
	        String pgCode = list.get(0).getPgCode();
	        
	        int perInstructorCap = 0;
	        try {
	            perInstructorCap = (int)Math.round(Double.parseDouble(list.get(0).getCapacity()));
	        } catch (Exception ignore) {}
	        if (perInstructorCap < 0) perInstructorCap = 0;

	        if ("forest".equals(pgType) && "FOREST_INT".equals(pgCode)) {
	            // pgId
	            
	            if (pgId == null || pgId.isEmpty()) {
	                result.put("success", false);
	                result.put("message", "프로그램 정보가 없습니다.");
	                return result;
	            }

	            // 담당자 1명 정원(정수), 총정원 = perInstructorCap * 2
	            {
	                String capStr = list.get(0).getCapacity(); // "20" 또는 "20.0"
	                double capD = 0;
	                try { capD = Double.parseDouble(capStr); } catch (Exception ignore) {}
	                perInstructorCap = (int)Math.round(capD);
	                if (perInstructorCap < 0) perInstructorCap = 0;
	            }
	            int totalCap = perInstructorCap * 2;

	            // 현재 DB 상태: 장소별 기 등록 인원
	            List<UserReservationVO> rows = adminReservationService.selectHeadsByLocation(pgId);
	            Map<String, Integer> cur = new LinkedHashMap<>();
	            for (UserReservationVO r : rows) {
	                String loc = safe(r.getLocation());
	                if (!loc.isEmpty()) cur.put(loc, Math.max(0, r.getLocationCnt()));
	            }

	            // 이번 요청: 장소별 추가 인원 합산
	            Map<String, Integer> reqByLocation = new LinkedHashMap<>();
	            for (ReservationVO vo : list) {
	                String loc = normalizeLocation(vo.getLocation());
	                if (loc == null) {
	                    result.put("success", false);
	                    result.put("message", "장소를 선택해 주세요.");
	                    return result;
	                }
	                int add = calcHeads(vo.getGroupYn(), vo.getPeopleCnt()); // 단체=peopleCnt, 개인=1
	                if (add <= 0) {
	                    result.put("success", false);
	                    result.put("message", "인원수는 1명 이상이어야 합니다.");
	                    return result;
	                }
	                reqByLocation.merge(loc, add, Integer::sum);
	            }

	            // 장소 종류 상한(2곳) 선검증
	            Set<String> union = new LinkedHashSet<>(cur.keySet());
	            union.addAll(reqByLocation.keySet());
	            if (union.size() > 2) {
	                result.put("success", false);
	                result.put("message", cur.isEmpty()
	                        ? "최대 2개 장소까지만 신청 가능합니다. (현재 " + reqByLocation.size() + "개 선택됨)"
	                        : "기존 장소를 포함하여 최대 2개까지만 신청 가능합니다.");
	                return result;
	            }

	            // ▶ 순차 시뮬레이션 검증
	            for (Map.Entry<String, Integer> e : reqByLocation.entrySet()) {
	                String loc = e.getKey();
	                int add = e.getValue();

	                int distinctBefore = cur.size();
	                boolean exists = cur.containsKey(loc);
	                int distinctAfter = exists ? distinctBefore : distinctBefore + 1;

	                // 세 번째 장소는 금지
	                if (distinctAfter > 2) {
	                    result.put("success", false);
	                    result.put("message", "이미 2개 장소가 운영 중이라 새로운 장소는 신청할 수 없습니다.");
	                    return result;
	                }

	                // 현재 해당 장소의 누적 인원
	                int curH = cur.getOrDefault(loc, 0);

	                if (distinctAfter == 1) {
	                    // 한 장소만 운영 → 그 한 곳은 총정원까지 가능
	                    if (curH + add > totalCap) {
	                        result.put("success", false);
	                        result.put("message", "해당 장소의 허용 인원(" + totalCap + "명) 초과입니다.");
	                        return result;
	                    }
	                } else { // distinctAfter == 2
	                    // 두 장소 운영 → 각 장소는 perInstructorCap 까지
	                    // (두 번째 장소를 새로 여는 경우: 기존 장소가 벌써 상한 초과라면 불가)
	                    if (!exists) {
	                        // 새 장소를 추가하는 케이스 → 기존 1개 장소의 현재 인원 확인
	                        String only = cur.keySet().iterator().next();
	                        int h = cur.getOrDefault(only, 0);
	                        if (h > perInstructorCap) {
	                            result.put("success", false);
	                            result.put("message", "기존 장소가 이미 " + h + "명이라 두 번째 장소를 열 수 없습니다.(각 " + perInstructorCap + "명)");
	                            return result;
	                        }
	                    }
	                    if (curH + add > perInstructorCap) {
	                        result.put("success", false);
	                        result.put("message", "장소 [" + loc + "]는 최대 " + perInstructorCap + "명까지 가능합니다. (현재 " + curH + "명)");
	                        return result;
	                    }
	                }

	                // 통과했으면 cur에 누적 반영 (시뮬레이션 진행)
	                cur.put(loc, curH + add);
	            }
	        } else if ("forest".equals(pgType) && "CHILD_REG".equals(pgCode)) {
	        	// 담당자 1인 정원
	            try { perInstructorCap = (int)Math.round(Double.parseDouble(list.get(0).getCapacity())); }
	            catch (Exception e) { perInstructorCap = 0; }

	            // 기본: 장소당 2명(담당자 2명)
	            int defaultPerLocationMax = perInstructorCap * 2;

	            // ✨ 회암사지(TEMPLE)만 1명
	            Map<String,Integer> capByLoc = new HashMap<>();
	            capByLoc.put("TEMPLE", perInstructorCap);

	            // 현재 DB 사용 인원 (장소별)
	            List<Map<String,Object>> rows = adminReservationService.selectUsedByLocation(pgId);
	            Map<String,Integer> cur = new LinkedHashMap<>();
	            if (rows != null) {
	                for (Map<String,Object> m : rows) {
	                    cur.put(String.valueOf(m.get("location")).trim(),
	                            (m.get("used") == null) ? 0 : Integer.parseInt(String.valueOf(m.get("used"))));
	                }
	            }

	            // 요청 합산 (장소별)
	            Map<String,Integer> req = new LinkedHashMap<>();
	            for (ReservationVO vo : list) {
	                String loc = normalizeLocation(vo.getLocation());
	                if (loc == null) {
	                    result.put("success", false);
	                    result.put("message", "장소를 선택해 주세요.");
	                    return result;
	                }
	                int add = calcHeads(vo.getGroupYn(), vo.getPeopleCnt());
	                if (add <= 0) {
	                    result.put("success", false);
	                    result.put("message", "인원수는 1명 이상이어야 합니다.");
	                    return result;
	                }
	                req.merge(loc, add, Integer::sum);
	            }

	            // 검증: (현재 + 추가) <= cap(loc)
	            for (Map.Entry<String,Integer> e : req.entrySet()) {
	                String loc = e.getKey();
	                int add    = e.getValue();
	                int cap    = capByLoc.getOrDefault(loc, defaultPerLocationMax);
	                int used   = cur.getOrDefault(loc, 0);

	                if (used + add > cap) {
	                    result.put("success", false);
	                    String locMsg = "TEMPLE".equals(loc) ? "회암사지(담당자 1명)" : ("장소 [" + loc + "]");
	                    result.put("message", locMsg + "는 최대 " + cap + "명까지 가능합니다. (현재 " + used + "명)");
	                    return result;
	                }
	            }

	            // 저장(개인은 peopleCnt=1 보정)
	            for (ReservationVO vo : list) {
	                vo.setLocation(normalizeLocation(vo.getLocation()));
	                if ("N".equalsIgnoreCase(safe(vo.getGroupYn()))) {
	                    vo.setPeopleCnt("1");
	                }
	                vo.setPgType(pgType);
	                vo.setPgId(pgId);
	                adminReservationService.insertApply(vo);
	            }

	            result.put("success", true);
	            result.put("message", "등록이 완료되었습니다.");
	            return result;
	        }

	        // 저장 (개인은 peopleCnt=1 보정, location 1개로 정규화)
	        for (ReservationVO vo : form.getReservationList()) {
	            vo.setLocation(normalizeLocation(vo.getLocation()));
	            if ("forest".equals(pgType) && "N".equals(safe(vo.getGroupYn()))) {
	                vo.setPeopleCnt("1");
	            }
                vo.setPgType(pgType);
                vo.setPgId(pgId);
	            adminReservationService.insertApply(vo);
	        }

	        result.put("success", true);
	        result.put("message", "등록이 완료되었습니다.");
	    } catch (Exception e) {
	        result.put("success", false);
	        result.put("message", "등록 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return result;
	}

	/** "A,B" → "A" 로 정규화, trim, 비어있으면 null */
	private String normalizeLocation(String loc) {
	    if (loc == null) return null;
	    String first = Arrays.stream(loc.split(","))
	            .map(String::trim)
	            .filter(s -> !s.isEmpty())
	            .findFirst().orElse(null);
	    return (first == null || first.isEmpty()) ? null : first;
	}

	/** 단체/개인 인원 계산: 단체(Y)면 peopleCnt 파싱, 아니면 1 */
	private int calcHeads(String groupYn, String peopleCnt) {
	    if ("Y".equalsIgnoreCase(safe(groupYn))) {
	        try {
	            int n = Integer.parseInt(safe(peopleCnt));
	            return Math.max(n, 0);
	        } catch (Exception ignore) {
	            return 0;
	        }
	    }
	    return 1;
	}

	private String safe(String s) { return s == null ? "" : s.trim(); }
	
	/**
	 * 신청자 상세 조회
	 * @param pgType
	 * @param reservationVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/detail.do")
	public String detailApplicant(@PathVariable("pgType")String pgType, @ModelAttribute("form")ReservationVO reservationVO, ModelMap model) throws Exception {
		
		String menuId = reservationVO.getMenuId();
		reservationVO = adminReservationService.selectReservation(reservationVO);
		
		model.addAttribute("menuId",menuId);
		model.addAttribute("reservationVO", reservationVO);
		
		return "/adm/reservation/" + pgType + "/view";
	}
	
	/**
	 * 신청자 정보 수정 폼
	 * @param pgType
	 * @param reservationVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/updateForm.do")
	public String appicantUpdateForm(@PathVariable("pgType")String pgType, @ModelAttribute("form")ReservationVO reservationVO, ModelMap model) throws Exception {
		
		String menuId = reservationVO.getMenuId();
		reservationVO = adminReservationService.selectReservation(reservationVO);
		
		if(pgType.equals("wood")) {
        	ProductVO productVO = new ProductVO();
        	List<ProductVO> productList = adminProductService.selectProductList(productVO);
        	model.addAttribute("productList", productList);
        	
        	List<ProgramTimeVO> timeList = adminProgramTimeService.selectProgramTimeList(reservationVO);
        	model.addAttribute("timeList", timeList);
		}else if(pgType.equals("forest")) {
			List<UserReservationVO> rows = adminReservationService.selectHeadsByLocation(reservationVO.getPgId());
			System.out.println(rows);
			model.addAttribute("locationInfo", rows);
			
			ProgramVO pvo = new ProgramVO();
	        pvo.setPgType(pgType);
	        pvo.setPgId(reservationVO.getPgId());
	        pvo = adminProgramService.selectProgram(pvo);
	        model.addAttribute("pvo", pvo);
		}
		
		model.addAttribute("menuId",menuId);
		model.addAttribute("reservationVO", reservationVO);
		
		return "/adm/reservation/" + pgType + "/updateForm";
	}
	
	/**
	 * 신청자 정보 수정
	 * @param pgType
	 * @param reservationVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/update.do")
	public String applicantUpdate(@PathVariable("pgType") String pgType, @ModelAttribute("form")ReservationVO reservationVO, ModelMap model, RedirectAttributes redirectAttributes) throws Exception {
		
		String menuId = reservationVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(reservationVO);
		String retMsg = "";
		
		if(pgType.equals("forest") && reservationVO.getGroupYn().equals("N")) {
			reservationVO.setPeopleCnt("1");
		}
		
		int result = 0;
		result = adminReservationService.updateApplicant(reservationVO);
		if(result > 0) {
			retMsg="수정되었습니다.";
		} else { 
			retMsg="수정할 수 없습니다.";
		}
		redirectAttributes.addAttribute("retMsg", retMsg);
		redirectAttributes.addAttribute("menuId", menuId);
		redirectAttributes.addAttribute("resvId", reservationVO.getResvId());
		
		return "redirect:/adm/reservation/" + pgType + "/detail.do";
	}
	
	/**
	 * 신청자 삭제
	 * @param pgType
	 * @param reservationVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/delete.do")
	public String applicantDelete(@PathVariable("pgType") String pgType,@ModelAttribute("form") ReservationVO reservationVO,
	        ModelMap model, RedirectAttributes redirectAttributes) throws Exception {

	    String menuId = reservationVO.getMenuId();
	    String pgId = reservationVO.getPgId();
	    LoginInfo loginInfo = new LoginInfo();
	    loginInfo.putSessionToVo(reservationVO);

	    String retMsg;
	    int result = adminReservationService.deleteApplicant(reservationVO);
	    if (result > 0) {
	        retMsg = "삭제되었습니다.";
	    } else {
	        retMsg = "삭제할 수 없습니다.";
	    }

	    redirectAttributes.addAttribute("menuId", menuId);
	    redirectAttributes.addAttribute("pgId", pgId);
	    
	    if(pgType.equals("wood")) {
	    	redirectAttributes.addAttribute("slotDate", reservationVO.getSlotDate().toString());
		    redirectAttributes.addAttribute("slotId", reservationVO.getSlotId());
	    }
	    
	    if(pgType.equals("forest")) {
	    	String pgCode = reservationVO.getPgCode();
		    redirectAttributes.addAttribute("pgCode", pgCode);
	    }
	    
	    redirectAttributes.addAttribute("retMsg", retMsg);

	    return "redirect:/adm/reservation/" + pgType + "/applyList.do";
	}
	
	
	/**
	 * 체험일 목록
	 * @param pgType
	 * @param reservationVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/dayList.do")
	public String dayList(@PathVariable("pgType") String pgType, @ModelAttribute("form")ReservationVO reservationVO, ModelMap model) throws Exception {
		
		String menuId = reservationVO.getMenuId();
		ProgramVO pvo = new ProgramVO();
        pvo.setPgType(pgType);
        pvo.setPgId(reservationVO.getPgId());
        pvo = adminProgramService.selectProgram(pvo);
        
        int totalCnt = 0;
        int pageIndex = reservationVO.getPageIndex();
        int pageSize = reservationVO.getPageSize();
        
        List<ProgramTimeVO> dateList = adminProgramTimeService.selectSlotDateList(reservationVO);
        List<String> slotDates = new ArrayList<>();
        if(dateList.size() > 0) {
			totalCnt =Integer.parseInt(dateList.get(0).getTotalCount());
	        for (ProgramTimeVO vo : dateList) {
	            slotDates.add(vo.getSlotDate());
	        }
		}
        
        Map<String, Object> param = new HashMap<>();
        param.put("pgId", reservationVO.getPgId());
        param.put("slotDates", slotDates);

        List<ProgramTimeVO> timeSlots = adminProgramTimeService.selectDayList(param);
		Map<String, Map<Integer, ProgramTimeVO>> timeTable = new LinkedHashMap<>();
		
		for (ProgramTimeVO slot : timeSlots) {
		    String dateKey = slot.getSlotDate().toString();

		    Map<Integer, ProgramTimeVO> innerMap = timeTable.get(dateKey);
		    if (innerMap == null) {
		        innerMap = new HashMap<>();
		        timeTable.put(dateKey, innerMap);
		    }
		    innerMap.put(slot.getSlotNo(), slot);
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(pageIndex);
	    paginationInfo.setRecordCountPerPage(pageSize);
	    paginationInfo.setPageSize(reservationVO.getPageUnit());
	    paginationInfo.setTotalRecordCount(totalCnt);
		
		model.addAttribute("timeTable", timeTable);
		model.addAttribute("programVO", pvo);
		model.addAttribute("menuId", menuId);
		model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
        model.addAttribute("paginationInfo", paginationInfo);
		
		return "/adm/reservation/" + pgType + "/dayList";
	}
	
	/**
	 * 목재 신청자 엑셀 다운로드
	 * @param reservationVO
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/wood/downloadExcel.do")
	public void downloadExcel(@ModelAttribute("form")ReservationVO reservationVO, HttpServletResponse response) throws Exception {
	    List<ReservationVO> list = adminReservationService.selectApplyListAll(reservationVO);

	    Workbook workbook = new XSSFWorkbook();
	    Sheet sheet = workbook.createSheet("예약목록");
	    CellStyle headerStyle = workbook.createCellStyle();
	    
	    headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
	    headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    headerStyle.setBorderBottom(BorderStyle.THIN);
	    headerStyle.setBorderTop(BorderStyle.THIN);
	    headerStyle.setBorderLeft(BorderStyle.THIN);
	    headerStyle.setBorderRight(BorderStyle.THIN);
	    headerStyle.setAlignment(HorizontalAlignment.CENTER);
	    headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);

	    
	    ProgramVO pvo = new ProgramVO();
        pvo.setPgType(reservationVO.getPgType());
        pvo.setPgId(reservationVO.getPgId());
        pvo = adminProgramService.selectProgram(pvo);
        
        CellStyle titleStyle = workbook.createCellStyle();
        Font titleFont = workbook.createFont();
        titleFont.setBold(true);
        titleFont.setFontHeightInPoints((short)20);
        titleStyle.setFont(titleFont);
        titleStyle.setAlignment(HorizontalAlignment.CENTER); 
        titleStyle.setVerticalAlignment(VerticalAlignment.CENTER);

        int rowNum = 0;
        Row titleRow = sheet.createRow(rowNum++);
        Cell titleCell = titleRow.createCell(0);
        titleCell.setCellValue(pvo.getPgName() + " - " + reservationVO.getSlotDate());
        titleCell.setCellStyle(titleStyle);
	    sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 12));
	    
	    Row header = sheet.createRow(rowNum++);
	    String[] columns = {"예약자명","나이","성별","연락처","선택차시","공예품명","예약상태","예약일시","단체여부","단체명","단체인원","참석여부","비고"};
	    for(int i=0; i<columns.length; i++) {
	        Cell cell = header.createCell(i);
	        cell.setCellValue(columns[i]);
	        cell.setCellStyle(headerStyle);
	    }

	    for(ReservationVO r : list) {
	        Row row = sheet.createRow(rowNum++);
	        row.createCell(0).setCellValue(r.getName());
	        row.createCell(1).setCellValue(r.getAge());
	        row.createCell(2).setCellValue(r.getGender().equals("M") ? "남성" : r.getGender().equals("F") ? "여성" : "알수없음");
	        row.createCell(3).setCellValue(r.getPhone() != null ? r.getPhone() : "-");
	        row.createCell(4).setCellValue(r.getSlotNo() + "부");
	        row.createCell(5).setCellValue(r.getProductName() + (r.getOptionName() != null ? " ("+r.getOptionName()+")" : ""));
	        row.createCell(6).setCellValue(r.getStatus().equals("WAIT") ? "대기" :
	        							   r.getStatus().equals("CONFIRM") ? "확정" :
	        							   r.getStatus().equals("CANCEL") ? "취소" : "알수없음");
	        row.createCell(7).setCellValue(r.getApplyDate().toString());
	        String groupYn = Optional.ofNullable(r.getGroupYn()).orElse("N");
	        row.createCell(8).setCellValue("Y".equals(groupYn) ? "단체" : "개인");
	        row.createCell(9).setCellValue(r.getGroupName() != null ? r.getGroupName() : "-");
	        row.createCell(10).setCellValue(r.getPeopleCnt() != null ? r.getPeopleCnt()+" 명" : "-");
	        row.createCell(11).setCellValue(r.getAttendYn().equals("Y") ? "참석" : "미참석");
	        row.createCell(12).setCellValue(r.getNote() != null ? r.getNote() : "");
	    }

	    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	    String fileName = pvo.getPgName() + "-" + reservationVO.getSlotDate() + ".xlsx";
	    fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
	    response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + fileName);
	    OutputStream out = response.getOutputStream();
	    workbook.write(out);
	    workbook.close();
	    out.flush();
	    out.close();
	}
}
