package com.gocle.yangju.forest.usr.reservation.web;

import java.beans.PropertyEditorSupport;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.MapUtils;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageDefaultVo;
import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;
import com.gocle.yangju.forest.adm.chsubjopen.vo.SubjSeqManageVo;
import com.gocle.yangju.forest.adm.code.service.AdminCodeService;
import com.gocle.yangju.forest.adm.code.vo.CodeVO;
import com.gocle.yangju.forest.adm.login.vo.LoginVO;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;
import com.gocle.yangju.forest.usr.chinfo.service.SubjInfoService;
import com.gocle.yangju.forest.usr.chinfo.vo.SubjInfoVo;
import com.gocle.yangju.forest.usr.product.service.UserProductService;
import com.gocle.yangju.forest.usr.product.vo.UserProductVO;
import com.gocle.yangju.forest.usr.program.service.UserProgramService;
import com.gocle.yangju.forest.usr.program.vo.UserProgramVO;
import com.gocle.yangju.forest.usr.reservation.service.UserReservationService;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;
import com.gocle.yangju.forest.usr.time.service.UserProgramTimeService;
import com.gocle.yangju.forest.usr.time.vo.UserProgramTimeVO;

import egovframework.com.cmm.service.Globals;



@Controller
@RequestMapping("/usr/reservation/")
public class UserReservationController {
	
	@Autowired
	private UserReservationService userReservationService;
	
	@Autowired
	UserProgramService userProgramService;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	UserProductService userProductService;
	
	@Autowired
	UserProgramTimeService userProgramTimeService;
	
	@Autowired
	SubjInfoService subjInfoService;
	
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
	
	@RequestMapping("intro.do")
	public String intro(ModelMap model) throws Exception {
		
		return "/usr/reservation/intro";
	}
	
	@RequestMapping("list1.do")
	public String list1(ModelMap model) throws Exception {
		
		return "/usr/reservation/list1";
	}
	
	@RequestMapping("list2.do")
	public String list2(ModelMap model) throws Exception {
		
		return "/usr/reservation/list2";
	}
	
	@RequestMapping("list3.do")
	public String list3(ModelMap model) throws Exception {
		
		return "/usr/reservation/list3";
	}
	
	@RequestMapping("list4.do")
	public String list4(ModelMap model) throws Exception {
		
		return "/usr/reservation/list4";
	}
	
	@RequestMapping("privacyPolicy1.do")
	public String privacyPolicy(ModelMap model) throws Exception {
		
		return "/usr/reservation/privacyPolicy1";
	}
	
	@RequestMapping("form.do")
	public String form(ModelMap model) throws Exception {
		
		return "/usr/reservation/form";
	}
	
	@RequestMapping("view1.do")
	public String view(ModelMap model) throws Exception {
		
		return "/usr/reservation/view1";
	}
	
	@RequestMapping("complete1.do")
	public String complete1(ModelMap model) throws Exception {
		
		return "/usr/reservation/complete1";
	}
	
	/**
	 * 사용자 프로그램 목록
	 * @param pgType
	 * @param reservationVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/list.do")
	public String programList(@PathVariable("pgType") String pgType, @ModelAttribute("searchVo") EnrollManageVo searchVo, ModelMap model) throws Exception {
		
		int totalCount = 0;
		List<EnrollManageVo> resultList = new ArrayList<>();
		// 행사 및 강좌
		searchVo.setSearchSgrCd("C");
		totalCount = userReservationService.selectTotalCount(searchVo);
		if(totalCount > 0) {
			resultList = userReservationService.selectList(searchVo);
		}
		
		int totalCnt = 0;
		Integer pageSize = searchVo.getPageSize();
		Integer pageIndex =	searchVo.getPageIndex();
		
		if(0 < resultList.size() ){
			totalCnt = Integer.parseInt( resultList.get(0).getTotalCount() );
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(searchVo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("pageIndex", pageIndex);
	    model.addAttribute("paginationInfo", paginationInfo);
	    model.addAttribute("searchVo", searchVo);
        model.addAttribute("totalCount", totalCount);
		model.addAttribute("resultList", resultList);
		
		model.addAttribute("pgType", pgType);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("EDU_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		model.addAttribute("codeList", codeList);
		
		return "/usr/reservation/" + pgType + "/list";
	}
	
	/**
	 * 사용자 프로그램 신청
	 * @param pgType
	 * @param userProgramVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/detail.do")
	public String programDetail(@PathVariable("pgType") String pgType, @ModelAttribute("form")UserProgramVO userProgramVO, ModelMap model,
			HttpSession session, RedirectAttributes redirectAttributes, @RequestParam Map<String,Object> params) throws Exception {
		
		String diKey = (String) session.getAttribute(Globals.DI_KEY);
		String retMsg = "";
		if(diKey == null) {
			retMsg = "로그인이 필요한 서비스입니다.";
			redirectAttributes.addFlashAttribute("retMsg", retMsg);
			return "redirect:/usr/main.do";
		}
		
		String menuId = userProgramVO.getMenuId();
		userProgramVO = userProgramService.selectProgram(userProgramVO);
		
		FileVO fvo = new FileVO();
		fvo.setpId(userProgramVO.getPgId());
		fvo.setThumbnailCrop("N");
		List<FileVO> fileList = fileService.listProductFile(fvo);
		
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listProductFile(fvo);
		
		UserProductVO upvo = new UserProductVO();
		List<UserProductVO> productList = userProductService.selectProductList(upvo);
		
		List<UserProgramTimeVO> timeSlots = userProgramTimeService.selectTimeList(userProgramVO);
		model.addAttribute("timeSlots", timeSlots);
	    
		model.addAttribute("userProgramVO", userProgramVO);
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileList1", tFileList);
		model.addAttribute("productList", productList);
		model.addAttribute("pgType", pgType);
		
		String page = "/usr/reservation/" + pgType + "/detail";
		
		if(pgType.equals("forest")) {
			if(userProgramVO.getPgCode().equals("FOREST_INT")) {
				
				// 예약된 장소 갯수 확인
				UserReservationVO reservationVO = new UserReservationVO();
				reservationVO.setPgId(userProgramVO.getPgId());
				int regPlaceCnt = userReservationService.regPlaceCnt(reservationVO);
				
				if(regPlaceCnt == 2) {
					List<UserReservationVO> regPlaceList = userReservationService.regPlace(reservationVO);
					model.addAttribute("regPlaceList", regPlaceList);
				}
				
				page = "/usr/reservation/" + pgType + "/forestDetail";
			}else if(userProgramVO.getPgCode().equals("CHILD_REG")) {
				page = "/usr/reservation/" + pgType + "/childDetail";
			}
		}
		
		model.addAttribute("retMsg", params.get("retMsg"));
		model.addAttribute("pgCode", userProgramVO.getPgCode());
		
		return page;
	}
	
	@RequestMapping("schedule.do")
	public String schedule(@ModelAttribute("form") UserReservationVO reservationVO, ModelMap model) throws Exception {
		
	    return "/usr/reservation/schedule";
	}

	@RequestMapping(value = "/scheduleEvents.do", method = RequestMethod.GET,produces = "application/json; charset=UTF-8")
	@ResponseBody
    public List<UserProgramVO> scheduleEvents(@RequestParam(value = "types", required = false) String[] types) throws Exception {

        List<String> typeList = (types == null || types.length == 0)
                ? null
                : Arrays.asList(types);

        return userReservationService.selectScheduleList(typeList);
    }
	
	/**
	 * 날짜별 예약현황 조회
	 * @param pgType
	 * @param userProgramTimeVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/getTimeByDate.do")
	@ResponseBody
	public HashMap<String, Object> getTimeByDate(@PathVariable("pgType") String pgType, @ModelAttribute("form") UserProgramTimeVO userProgramTimeVO) throws Exception {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		List<UserProgramTimeVO> time = userProgramTimeService.selectTimeByDate(userProgramTimeVO);
		result.put("time", time);
		
		return result;
	}
	
	/**
	 * 상폼 목록 조회 팝업
	 * @param pgType
	 * @param userProductVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/productPopup.do")
	public String getProductList(@PathVariable("pgType") String pgType,
	                             @ModelAttribute("form") UserProductVO userProductVO,
	                             Model model) throws Exception {
		String productId = userReservationService.selectResvCheck(userProductVO);
		if(productId != null) {
			userProductVO.setProductId(productId);
		}
	    List<UserProductVO> productList = userProductService.selectProductList(userProductVO);
	    model.addAttribute("productList", productList);

	    return "usr/reservation/"+ pgType +"/productPopup"; 
	}
	
	/**
	 * 프로그램 예약 신청
	 * @param pgType
	 * @param reservationVO
	 * @param model
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/reserve.do")
	public String reserve(@PathVariable("pgType") String pgType, @ModelAttribute("form") UserReservationVO reservationVO, ModelMap model, RedirectAttributes redirectAttributes, HttpSession session ) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(reservationVO);
		String retMsg;
		int result = 0;
		String returnPage;
		
		String diKey = (String) session.getAttribute(Globals.DI_KEY);
		if(diKey == null) {
			retMsg = "로그인이 필요한 서비스입니다.";
			redirectAttributes.addFlashAttribute("retMsg", retMsg);
			return "redirect:/usr/main.do";
		}
		reservationVO.setDiKey(diKey);
		
		if(pgType.equals("wood")) {
			UserProgramTimeVO uptVO = userProgramTimeService.selectTimeSlotBySlotId(reservationVO);
			int resvCnt = Integer.parseInt(uptVO.getCapacity()) -  Integer.parseInt(uptVO.getResvCnt());
			if(Integer.parseInt(reservationVO.getPeopleCnt()) > resvCnt) {
				retMsg = "예약 가능인원을 초과하였습니다.";
				redirectAttributes.addFlashAttribute("retMsg", retMsg);
				return "redirect:/usr/reservation/" + pgType + "/detail.do?pgId=" + reservationVO.getPgId() + "&pgType=" + pgType ;
			}
		}
		
		if(pgType.equals("forest") && reservationVO.getPgCode().equals("FOREST_INT")) {
			
			int base = (int) Double.parseDouble(reservationVO.getCapacity()) / 2;         // 프로그램 기본 정원 (예: 20)
			String pgId = reservationVO.getPgId();
			String newLocation = reservationVO.getLocation();
			int newHeads = "Y".equals(reservationVO.getGroupYn())
			                   ? Integer.parseInt(reservationVO.getPeopleCnt())
			                   : 1;

			String err  = validateInstructorRule(pgId, newLocation, newHeads, base);
			if (err  != null) {
				retMsg = err;
				returnPage =  "redirect:/usr/reservation/" + pgType + "/detail.do?pgId=" + pgId + "&pgType=" + pgType + "&pgCode=" + reservationVO.getPgCode() ;
			}else {
			
			
			// 등록한 회원 30일 동안 등록 못하게 제한
			int regChk = userReservationService.regChk(reservationVO);
			
			if(regChk > 0) {
				retMsg = "신청완료 기준 한달 후 재신청 가능합니다.";
				returnPage = "redirect:/usr/reservation/" + pgType + "/detail.do?pgId=" + reservationVO.getPgId() + "&pgType=" + pgType + "&pgCode=" + reservationVO.getPgCode() ;
			}else {
			
				int dupChk = userReservationService.getResvDupChk(reservationVO);
				if(dupChk > 0) {
					retMsg = "이미 신청한 회차입니다.";
					returnPage = "redirect:/usr/reservation/" + pgType + "/detail.do?pgId=" + reservationVO.getPgId() + "&pgType=" + pgType + "&pgCode=" + reservationVO.getPgCode() ;
				} else {
					result = userReservationService.insertReservation(reservationVO);
					if(result > 0) {
						retMsg = "신청완료되었습니다.";
						redirectAttributes.addFlashAttribute("retMsg", retMsg);
						returnPage = "redirect:/usr/mypage/myReservation.do";
					} else {
						retMsg = "신청할 수 없습니다.";
						returnPage = "redirect:/usr/reservation/" + pgType + "/detail.do?pgId=" + reservationVO.getPgId() + "&pgType=" + pgType + "&pgCode=" + reservationVO.getPgCode() ;
					}
				}
			}
			
			}
		}else if ("forest".equals(pgType) && "CHILD_REG".equals(reservationVO.getPgCode())) {
	        // === CHILD_REG: 장소별 2명 담당자 → 장소 독립 정원(capacity * 2) ===
	        String pgId = reservationVO.getPgId();
	        String newLocation = reservationVO.getLocation();
	        String pgCode = reservationVO.getPgCode();

	        int perInstructor = (int) Double.parseDouble(reservationVO.getCapacity()); // capacity = 담당자 1명 정원
	        int perLocationMax = perInstructor * 2; // 장소별 담당자 2명 → 장소 정원

	        int newHeads = "Y".equals(reservationVO.getGroupYn())
	                ? Integer.parseInt(reservationVO.getPeopleCnt())
	                : 1;

	        String err = validateChildRegRule(pgId, newLocation, newHeads, perLocationMax);
	        if (err != null) {
	            retMsg = err;
	            returnPage = "redirect:/usr/reservation/" + pgType + "/detail.do?pgId=" + pgId + "&pgType=" + pgType + "&pgCode=" + pgCode;
	        } else {
	            
	        	// 등록한 회원 30일 동안 등록 못하게 제한
				int regChk = userReservationService.regChk(reservationVO);
				
				if(regChk > 0) {
					retMsg = "신청완료 기준 한달 후 재신청 가능합니다.";
					returnPage = "redirect:/usr/reservation/" + pgType + "/detail.do?pgId=" + reservationVO.getPgId() + "&pgType=" + pgType + "&pgCode=" + reservationVO.getPgCode() ;
				}else {
	        	
		            int dupChk = userReservationService.getResvDupChk(reservationVO);
		            if (dupChk > 0) {
		                retMsg = "이미 신청한 회차입니다.";
		                returnPage = "redirect:/usr/reservation/" + pgType + "/detail.do?pgId=" + reservationVO.getPgId() + "&pgType=" + pgType + "&pgCode=" + pgCode;
		            } else {
		                result = userReservationService.insertReservation(reservationVO);
		                if (result > 0) {
		                    retMsg = "신청완료되었습니다.";
		                    redirectAttributes.addFlashAttribute("retMsg", retMsg);
		                    returnPage = "redirect:/usr/mypage/myReservation.do";
		                } else {
		                    retMsg = "신청할 수 없습니다.";
		                    returnPage = "redirect:/usr/reservation/" + pgType + "/detail.do?pgId=" + reservationVO.getPgId() + "&pgType=" + pgType + "&pgCode=" + pgCode;
		                }
		            }
	            
				}
	        }

	    }else {
		
		int dupChk = userReservationService.getResvDupChk(reservationVO);
		if(dupChk > 0) {
			retMsg = "이미 신청한 회차입니다.";
			returnPage = "redirect:/usr/reservation/" + pgType + "/detail.do?pgId=" + reservationVO.getPgId() + "&pgType=" + pgType + "&pgCode=" + reservationVO.getPgCode() ;
		} else {
			result = userReservationService.insertReservation(reservationVO);
			if(result > 0) {
				retMsg = "신청완료되었습니다.";
				redirectAttributes.addFlashAttribute("retMsg", retMsg);
				returnPage = "redirect:/usr/mypage/myReservation.do";
			} else {
				retMsg = "신청할 수 없습니다.";
				returnPage = "redirect:/usr/reservation/" + pgType + "/detail.do?pgId=" + reservationVO.getPgId() + "&pgType=" + pgType + "&pgCode=" + reservationVO.getPgCode() ;
			}
		}
		
		}
		
		redirectAttributes.addAttribute("retMsg", retMsg);
		
		return returnPage;
	}
	
	
	private String validateInstructorRule(String pgId, String newLocation, int newHeads, int base) throws Exception {
	    List<UserReservationVO> rows = userReservationService.selectHeadsByLocation(pgId);

	    Map<String, Integer> cur = new HashMap<>();
	    for (UserReservationVO r : rows) {
	        cur.put(r.getLocation(), r.getLocationCnt()); // int라 null 아님
	    }

	    int distinct  = cur.size();
	    int singleMax = base * 2; // 한 장소만이면 2배

	    if (distinct == 0) {
	        return (newHeads > singleMax)
	                ? "첫 장소는 최대 " + singleMax + "명까지 가능합니다."
	                : null;
	    }

	    if (distinct == 1) {
	        String only = cur.keySet().iterator().next();
	        int h = cur.getOrDefault(only, 0);

	        if (newLocation.equals(only)) {
	            return (h + newHeads > singleMax)
	                    ? "해당 장소의 허용 인원(" + singleMax + "명) 초과입니다."
	                    : null;
	        } else {
	            if (h > base) {
	                return "기존 장소가 이미 " + h + "명이라 두 번째 장소를 열 수 없습니다.(각 " + base + "명)";
	            }
	            return (newHeads > base)
	                    ? "두 번째 장소는 최대 " + base + "명까지 가능합니다."
	                    : null;
	        }
	    }

	    // distinct >= 2
	    Integer curH = cur.get(newLocation);
	    if (curH == null) {
	        return "이미 2개 장소가 운영 중이라 새로운 장소는 신청할 수 없습니다.";
	    }
	    return (curH + newHeads > base)
	            ? "장소 [" + newLocation + "]는 최대 " + base + "명까지 가능합니다. (현재 " + curH + "명)"
	            : null;
	}
	
	private String validateChildRegRule(String pgId, String location, int newHeads, int perLocationMax) throws Exception {
	    // 현재 장소 누적 인원 조회
	    // selectHeadsByLocation(pgId) 결과를 재활용하거나, location 조건으로 직접 조회하는 메서드가 있으면 그걸 쓰세요.
	    List<UserReservationVO> rows = userReservationService.selectHeadsByLocation(pgId);

	    int curHeadsAtLoc = 0;
	    for (UserReservationVO r : rows) {
	        if (location != null && location.equals(r.getLocation())) {
	            curHeadsAtLoc = r.getLocationCnt(); // int
	            break;
	        }
	    }

	    if (curHeadsAtLoc + newHeads > perLocationMax) {
	        return "장소 [" + location + "]의 허용 인원(" + perLocationMax + "명)을 초과했습니다. (현재 " + curHeadsAtLoc + "명)";
	    }
	    return null;
	}
	
	 @RequestMapping(value = "/{pgType}/remainByDate.do",method = RequestMethod.GET,produces = "application/json; charset=UTF-8")
	    @ResponseBody
	    public Map<String, Object> remainByDate(
	            @PathVariable("pgType") String pgType,
	            @RequestParam("pgId") String pgId,
	            @RequestParam("pgCode") String pgCode) throws Exception {

	        // 1) 프로그램 기본 정보 조회 (capacity, location 코드/명)
	        UserProgramVO p = new UserProgramVO();
	        p.setPgId(pgId);
	        p.setPgType(pgType);
	        p = userProgramService.selectProgram(p); // 이미 사용 중인 메서드 재활용

	        // 2) CHILD_REG 규칙: 장소별 최대 수용 = capacity × 2
	        //    (capacity는 '담당자 1인 정원'으로 가정)
	        int capacity = 0;
	        try {
	            capacity = (int) Math.floor(Double.parseDouble(p.getCapacity()));
	        } catch (Exception ignore) { /* 0 유지 */ }

	        int perLocationMax = capacity;
	        if ("CHILD_REG".equals(pgCode)) {
	            perLocationMax = capacity * 2;
	        }

	        // 3) 일자별/장소별 누적 신청 인원 집계
	        //    결과: List<UserReservationVO> (location, locationCnt)
	        List<UserReservationVO> rows = userReservationService.sumHeadsByDate(pgId);

	        // 4) 맵으로 변환 (예: {"A": 10, "B": 22})
	        Map<String, Integer> reserved = new LinkedHashMap<>();
	        if (rows != null) {
	            for (UserReservationVO r : rows) {
	                String loc = r.getLocation();
	                int heads = r.getLocationCnt(); // mapper에서 sum(...)
	                reserved.put(loc, heads);
	            }
	        }

	        // 5) locations 배열(선택): 프론트에서 테이블 렌더시 순서 보장을 위해 내려줌
	        List<String> locations = new ArrayList<>();
	        if (p.getLocation() != null) {
	            for (String code : p.getLocation().split(",")) {
	                if (code != null && !code.trim().isEmpty()) {
	                    locations.add(code.trim());
	                }
	            }
	        }

	        Map<String, Object> resp = new LinkedHashMap<>();
	        resp.put("perLocationMax", perLocationMax);
	        resp.put("reserved", reserved); // code -> heads
	        resp.put("locations", locations); // ["A","B","C"] (옵션)

	        return resp;
	    
	}
	 
	@RequestMapping("/consulting/addCalendarView.do")
	public String consuliting(@ModelAttribute("searchVo") EnrollManageVo searchVo, ModelMap model) throws Exception {
		model.addAttribute("menuId", searchVo.getMenuId());
		return "/usr/reservation/consulting/addCalendarView";
	}
	
	@RequestMapping("selectConsultingList.do")
	@ResponseBody
	public List<Map<String, Object>> getConsultingList(@ModelAttribute("searchVo") EnrollManageVo searchVo
			, @RequestParam int year, @RequestParam int month) throws Exception {
		// 1:1 상담
		searchVo.setSearchSgrCd("A");
		String ym = year + "-" + String.format("%02d", month); // 2025-12
		searchVo.setSearchLearnDt(ym);
		
		List<Map<String, Object>> resultList = userReservationService.selectConsultingList(searchVo);

		return resultList;
	}
	
	@RequestMapping("/program/eduLctreNewList.do")
	public String program(@ModelAttribute("searchVo") EnrollManageVo searchVo, ModelMap model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(true);
		String diKey = (String) session.getAttribute(Globals.DI_KEY);
		searchVo.setDiKey(diKey);
		
		int totalCount = 0;
		List<EnrollManageVo> resultList = new ArrayList<>();
		// 꿈자람센터 프로그램
		searchVo.setSearchSgrCd("B");
		totalCount = userReservationService.selectTotalCount(searchVo);
		if(totalCount > 0) {
			resultList = userReservationService.selectList(searchVo);
		}
			
		Integer pageSize = searchVo.getPageSize();
		Integer pageIndex =	searchVo.getPageIndex();
		
		PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(searchVo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCount);
        
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("pageIndex", pageIndex);
	    model.addAttribute("paginationInfo", paginationInfo);
	    model.addAttribute("searchVo", searchVo);
	    model.addAttribute("totalCount", totalCount);
		model.addAttribute("resultList", resultList);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("EDU_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		model.addAttribute("codeList", codeList);
		
		return "/usr/reservation/program/eduLctreNewList";
	}
	
	@RequestMapping("eduLctreWebView.do")
	public String eduLctreWebView(@ModelAttribute("searchVo") SubjSeqManageVo searchVo, ModelMap model) throws Exception {
		
		SubjSeqManageVo resultMap = userReservationService.selectSubjSeqEduInfo(searchVo);
		model.addAttribute("resultMap", resultMap);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("EDU_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		model.addAttribute("codeList", codeList);
		
		return "/usr/reservation/eduLctreWebView";
	}
	
	@RequestMapping("selectEduApplcntAgreView.do")
	public String selectEduApplcntAgreView(@ModelAttribute("searchVo") SubjSeqManageVo searchVo
			,@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo, ModelMap model, HttpServletRequest request) throws Exception {
		model.addAttribute("searchVo", searchVo);
		
		boolean enrollIns = false;
		String errCd = "";
		
		HttpSession session = request.getSession(true);
		String diKey = (String) session.getAttribute(Globals.DI_KEY);
		enrollManageVo.setDiKey(diKey);
		
		Map<String, Object> valid = userReservationService.selectEnrollValidInfo(enrollManageVo);
		
		if(valid != null) {
			// 수강신청 이력이 없는 경우
			if("X".equals(valid.get("enrollStatusCd"))) {
				// 중복 신청 가능한 경우
				if(!("N".equals(valid.get("duplEnrollYn")) && MapUtils.getIntValue(valid, "subjEnrollCnt") > 0)) {
					// 수강신청 기간인 경우
					if("I".equals(valid.get("enrollDtStsCd"))) {
						// 정원 check
						if(MapUtils.getIntValue(valid, "capacity") > MapUtils.getIntValue(valid, "enrollCnt")) {
						 	// 로그인 필요 
							if(!StringUtils.hasText(enrollManageVo.getDiKey())) {
								errCd = "91";
							} else {
								enrollIns = true;
							}
						} 
						// 정원 초과
						else {
							// 대기자 초과
							if(MapUtils.getIntValue(valid, "waitCnt") >= MapUtils.getIntValue(valid, "waitEnrollCnt")) {
								errCd = "31";
							} else {
								enrollIns = true;
							}
						}
					}
					// 수강신청 기간 외
					else {
						if ("R".equals(valid.get("enrollDtStsCd"))) {
	                        errCd = "11"; // 수강신청 예정
	                    }
	                    else {
	                        errCd = "12"; // 수강신청 종료
	                    }
					}
				}
				// 중복 신청이 불가능한 경우
				else {
					errCd = "22";
				}
			} 
			// 수강신청 이력 존재
			else {
				errCd = (String) valid.get("enrollStatusCd");
			}	
		}
		// 과정 미존재(사용여부 N)
		else {
			errCd = "99";
		}
		model.addAttribute("errCd", errCd);
		model.addAttribute("enrollIns", enrollIns);
		
		SubjSeqManageVo resultMap = userReservationService.selectSubjSeqEduInfo(searchVo);
		model.addAttribute("resultMap", resultMap);
		
		return "/usr/reservation/selectEduApplcntAgreView";
	}
	
	@RequestMapping("addEduApplcntWebView.do")
	public String addEduApplcntWebView(@ModelAttribute("searchVo") SubjSeqManageVo searchVo, ModelMap model) throws Exception {
		
		SubjSeqManageVo resultMap = userReservationService.selectSubjSeqEduInfo(searchVo);
		model.addAttribute("resultMap", resultMap);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("RESDNC_DETAIL");
		model.addAttribute("resdncList", adminCodeService.selectCodeList(cvo));
		cvo.setCodeGroup("AGE_GROUP");
		model.addAttribute("ageList", adminCodeService.selectCodeList(cvo));
		cvo.setCodeGroup("GRADE");
		model.addAttribute("gradeList", adminCodeService.selectCodeList(cvo));
		cvo.setCodeGroup("EDU_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		model.addAttribute("codeList", codeList);
		
		return "/usr/reservation/addEduApplcntWebView";
	}
	
	@ResponseBody
	@RequestMapping("addWebEduApplcnt.do")
	public String addWebEduApplcnt(@ModelAttribute("searchVo") SubjSeqManageVo searchVo
			,@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo, ModelMap model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(true);
		String diKey = (String) session.getAttribute(Globals.DI_KEY);
		enrollManageVo.setDiKey(diKey);
	
		userReservationService.insertEnroll(enrollManageVo);
		
		SubjSeqManageVo resultMap = userReservationService.selectSubjSeqEduInfo(searchVo);
		model.addAttribute("resultMap", resultMap);
		
		return enrollManageVo.getErrCd();
	}
	
	@RequestMapping("comptEduApplcntWebView.do")
	public String comptEduApplcntWebView(@ModelAttribute("searchVo") SubjSeqManageVo searchVo
			,@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo, ModelMap model) throws Exception {
		
		SubjSeqManageVo resultMap = userReservationService.selectSubjSeqEduInfo(searchVo);
		model.addAttribute("resultMap", resultMap);
		
		return "/usr/reservation/comptEduApplcntWebView";
	}
}
