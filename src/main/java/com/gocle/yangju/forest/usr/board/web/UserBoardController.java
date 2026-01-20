package com.gocle.yangju.forest.usr.board.web;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.board.service.AdminBoardService;
import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;
import com.gocle.yangju.forest.usr.code.vo.CodeVO;
import com.gocle.yangju.forest.usr.program.vo.UserProgramVO;
import com.gocle.yangju.forest.usr.reservation.service.UserReservationService;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;
import com.gocle.yangju.forest.usr.board.service.UserBoardService;
import com.gocle.yangju.forest.usr.board.vo.BoardArticleVO;
import com.gocle.yangju.forest.usr.board.vo.BoardConfigVO;
import com.gocle.yangju.forest.usr.board.vo.BoardReplyVO;
import com.gocle.yangju.forest.usr.code.service.UserCodeService;

import egovframework.com.cmm.service.Globals;

@Controller
@RequestMapping("/usr/bbs/")
public class UserBoardController {
	
	@Autowired
	UserBoardService boardService;
	
	@Autowired
	UserCodeService codeService;
	
	@Autowired
	private UserReservationService userReservationService;
	
	@Autowired
	private FileService fileService;
	
			@RequestMapping( value = {"{bcId}/list.do"})
			public String boardListGet(@PathVariable("bcId") String bcId,
					@ModelAttribute("form") BoardConfigVO boardConfigVO,
					BoardReplyVO boardReplyVO,
					BoardArticleVO boardArticleVO,
					RedirectAttributes redirectAttributes,
					HttpSession session,
					ModelMap model) throws Exception {
				
				String menuId = boardArticleVO.getMenuId();
				
				
				String retMsg = "";
				
							// 로그인 체크
				String returnPage = "";	
				
				boardConfigVO = boardService.getBoardConfig(boardConfigVO);
				
				//타입 default , gallary	
				String bcType = boardConfigVO.getBcType();
				
				String bcThumbnailWidth = "";
				
				String bcThumbnailHeight = "";
				
				//세션
				String memSeq = StringUtils.defaultString((String)session.getAttribute(Globals.MEM_SEQ),"");
				
				if(boardConfigVO.getBcSupportThumbnail() != null){
					//썸네일 동의시
					if(boardConfigVO.getBcSupportThumbnail().equals("1")){
						//입력받은 가로
						bcThumbnailWidth  = boardConfigVO.getBcThumbnailWidth();
						//입력받은 세로
						bcThumbnailHeight  = boardConfigVO.getBcThumbnailHeight();
					
					}else{ //미 동의시 WIDTH , HIGHTH  0 값 넣기
						boardConfigVO.setBcThumbnailWidth("0");
						boardConfigVO.setBcThumbnailHeight("0");
						
						bcThumbnailWidth  = boardConfigVO.getBcThumbnailWidth();
						//입력받은 세로
						bcThumbnailHeight  = boardConfigVO.getBcThumbnailHeight();
					}
				}
				
				// bcId 가 없으면 잘못 된 접근{
				if(boardConfigVO == null){
					retMsg = "잘못 된 접근입니다.!";
					
					redirectAttributes.addFlashAttribute("retMsg", retMsg);
					
					return "redirect:/";
				}
				
				
				///자료실 대분류가 있을때.
				if(boardConfigVO.getBcCategory1() != null){
					
					//자료실 소분류 검색
					CodeVO codeVO1 = new CodeVO();
					
					//BOARD_DATA 
					codeVO1.setCodeGroup(boardConfigVO.getBcCategory1());
					
					List<CodeVO> codeSubList = codeService.codeList(codeVO1);
					
					model.addAttribute("codeSubList", codeSubList);	// codeId == 
					
				}
			
				model.addAttribute("boardConfigVO",boardConfigVO);
				
				String id = boardConfigVO.getBcId();
			
				//bcid 먼저 넣어주고
				boardArticleVO.setBcId(bcId);
				
				/////////////////////상단공지 체크에 값이 널일때/////////////////
				if(boardArticleVO.getBaNotice() == null){
					
				    ///////////////0을 넣어서  상단 공지 미사용으로 만들고/////////////////
					boardArticleVO.setBaNotice("0");
					
				}
					
				if(bcId.equals("photo")){
					boardArticleVO.setPageSize(12);
				}
				
				
				//해당 타입 리스트
				List<BoardArticleVO> resultList = boardService.listBoardArticle(boardArticleVO);
			
				
				///////////////bcType == 기본일때  상단 공지사항을 불러오는 ///////////////////////////////
				if(boardConfigVO.getBcType().equals("default")){	
						
					//상단 공지 데이터 3개 최신순
					List<BoardArticleVO> topNoticeList =boardService.topNoticeList(boardArticleVO);
					
					
			        model.addAttribute("topNoticeList", topNoticeList);
			        
			        // 공지사항 구분 선택
					CodeVO codeVO = new CodeVO();
					codeVO.setCodeGroup("CN_NOTICE");
					List<CodeVO> codeSubList = codeService.codeList(codeVO);
					model.addAttribute("codeSubList", codeSubList);	
				}
				
				
				int totalCnt = 0;
		
				
				Integer pageSize = boardArticleVO.getPageSize();
				Integer pageIndex = boardArticleVO.getPageIndex();
				
				
				if( 0 < resultList.size() ){ 
					totalCnt =Integer.parseInt( resultList.get(0).getTotalCount() );
				}
				
				model.addAttribute("pageSize", pageSize);
				
			    model.addAttribute("totalCount", totalCnt);
			    
			    model.addAttribute("pageIndex", pageIndex);
			    
			    int totalPage = (int) Math.ceil((double) totalCnt / pageSize);
			    
			    model.addAttribute("totalPage", totalPage);
			    
			    PaginationInfo paginationInfo = new PaginationInfo();

		        paginationInfo.setCurrentPageNo(pageIndex);
		        paginationInfo.setRecordCountPerPage(pageSize);
		        paginationInfo.setPageSize(boardArticleVO.getPageUnit());
		        paginationInfo.setTotalRecordCount(totalCnt);
		        
		        
		        
		        //카테고리 active
		        model.addAttribute("getBaCategory1",  boardArticleVO.getBaCategory1());
		        
		        model.addAttribute("paginationInfo", paginationInfo);
		        
		        model.addAttribute("articleList", resultList);
		        
				model.addAttribute("boardArticleVO", boardArticleVO);
				
				model.addAttribute("bcThumbnailWidth",bcThumbnailWidth);
				
				model.addAttribute("bcThumbnailHeight",bcThumbnailWidth);
				
				model.addAttribute("menuId",menuId);
				
				model.addAttribute("bcType", bcType);
				
				model.addAttribute("bcId", bcId);
				
				model.addAttribute("bcName", boardConfigVO.getBcName());
				
				model.addAttribute("baCategory1", boardArticleVO.getBaCategory1());
				
				returnPage = "/usr/bbs/"+bcType+"/list";
				
				return returnPage;
				
			}
			
			@RequestMapping( value = {"schedule/list.do"})
			public String scheduleList(HttpSession session, ModelMap model) throws Exception {
				return "/usr/bbs/schedule/list";
			}
			
			@RequestMapping("selectProgramList.do")
			@ResponseBody
			public List<Map<String, Object>> selectProgramList(@ModelAttribute("searchVo") EnrollManageVo searchVo) throws Exception {
				
				searchVo.setSearchSgrCd("B");
				searchVo.setSearchCateCd("BA");
				List<Map<String, Object>> resultList = userReservationService.selectProgramList(searchVo);

				return resultList;
			}
			
			
			// 상세 보기   // 댓글 리스트
			@RequestMapping( value = { "{bcId}/detail.do"})
			public String boardDetailGet(
					@PathVariable("bcId") String bcId,
					@RequestParam(value = "brIdresult",required = false) String brId,
					BoardConfigVO boardConfigVO,
					@ModelAttribute("form")BoardArticleVO boardArticleVO,
					@ModelAttribute("replyForm")BoardReplyVO boardReplyVO,
					@ModelAttribute("replyFileForm")FileVO fileVO1,
					HttpServletRequest request,HttpSession session,ModelMap model,
					RedirectAttributes redirectAttributes) throws Exception {
				
				
				String menuId = boardArticleVO.getMenuId();
				
				String retMsg = "";
				
				String returnPage = "";
				
				
				
				LoginInfo loginInfo = new LoginInfo(); // 세션
				loginInfo.putSessionToVo(boardArticleVO); // session의 정보를 VO에 추가.
				
				
				//QNA_TYPE_ARTICLE 공통코드 조회
				/*
				 * CodeVO codeVO = new CodeVO();
				 * 
				 * codeVO.setCodeGroup("QNA_TYPE_ARTICLE");
				 * 
				 * List<CodeVO> codeList = codeService.codeList(codeVO);
				 * 
				 * model.addAttribute("codeList", codeList); // codeId ==
				 */				
				
				
			 	//processStatusArticle 공통코드 조회
				CodeVO codeVO1 = new CodeVO();
				
				codeVO1.setCodeGroup("PROCESS_STATUS_ARTICLE");
				
				List<CodeVO> codeList1 = codeService.codeList(codeVO1);
				
				model.addAttribute("codeList1", codeList1);	// codeId == 

				//insert에 --
				String memSeq = StringUtils.defaultString((String)session.getAttribute(Globals.MEM_SEQ),"");
				
				
				boardConfigVO = boardService.getBoardConfig(boardConfigVO);
				
				////썸네일 크기
				String bcThumbnailWidth = "";
				
				String bcThumbnailHeight = "";
				
				
				if(boardConfigVO.getBcSupportThumbnail() != null){
					//썸네일 동의시
					if(boardConfigVO.getBcSupportThumbnail().equals("1")){
						//입력받은 가로
						bcThumbnailWidth  = boardConfigVO.getBcThumbnailWidth();
						//입력받은 세로
						bcThumbnailHeight  = boardConfigVO.getBcThumbnailHeight();
					
					}else{ //미 동의시 WIDTH , HIGHTH  0 값 넣기
						boardConfigVO.setBcThumbnailWidth("0");
						boardConfigVO.setBcThumbnailHeight("0");
						
						bcThumbnailWidth  = boardConfigVO.getBcThumbnailWidth();
						//입력받은 세로
						bcThumbnailHeight  = boardConfigVO.getBcThumbnailHeight();
					}
				}
				
				
				
				boardArticleVO.setBcId(bcId);
				
				// 히트 업데이트
				int hit = boardService.boardHit(boardArticleVO);
				
				BoardArticleVO result = boardService.getUserBoardResult(boardArticleVO);
				
				BoardArticleVO prevNext =boardService.prevNext(boardArticleVO);
				
				
				////////////////////////////////
				//댓글 리스트 = > 목록 ,  쓰기  , 수정 , 삭제//
				//1.목록  (아무 동작 하지 않았을때)//////////
				
				
				List<BoardReplyVO> boardReplyList = boardService.listBoardReply(boardReplyVO);		
				
						
				
					////////////////
					// 파일 리스트//
					////////////////
					FileVO fileVO = new FileVO();
					
					fileVO.setThumbnailCrop("N");
					fileVO.setBoardIdx(boardArticleVO.getBaId());
					
					List<FileVO> fileList = fileService.listFile(fileVO);
					
						////////////////
						//썸네일 리스트//
						////////////////
					FileVO fileVO11 = new FileVO();
					
					fileVO11.setThumbnailCrop("Y");
					
					List<FileVO> fileList1 = fileService.listFile(fileVO11);
				
				

				
				
				redirectAttributes.addFlashAttribute("retMsg", retMsg);
				
				
				
				returnPage = "/usr//bbs/"+boardConfigVO.getBcType()+"/view";
				
				
					if(bcId.equals("worklearning")){
						
						/*LOG.debug("==============bcId.equals(worklearning)============"+boardConfigVO.getBcType());*/
						
						returnPage = "/user/job/worklearning/view";
						
					}
				//썸네일 여부
				model.addAttribute("boardConfigVO", boardConfigVO);
				
				
				model.addAttribute("bcThumbnailWidth",bcThumbnailWidth);
				
				model.addAttribute("bcThumbnailHeight",bcThumbnailWidth);
				
				
				
				//session get 로그인
				model.addAttribute("memSeq", memSeq);
				
				//썸네일
				model.addAttribute("fileList", fileList);
				
				model.addAttribute("fileList1", fileList1);
				
				
				//내가 뽑아온 하나의 상세보기 데이터
				model.addAttribute("result",result);
				
				//이전글 다음글
				model.addAttribute("prevNext", prevNext);
				
				//해당  BA_ID 의 댓글 리스트
				model.addAttribute("boardReplyList",boardReplyList);
				
				model.addAttribute("menuId", menuId);
				
				model.addAttribute("bcId", bcId);
				
				model.addAttribute("bcName", boardConfigVO.getBcName());
				
				model.addAttribute("baCategory1", boardArticleVO.getBaCategory1());
				
				model.addAttribute("memSeq", loginInfo.getMemSeq());
				
				return returnPage;
			}
			
			///QNA 폼
			//@Interceptor(value = {"loginBinding"})
			@RequestMapping( value = { "{bcId}/form.do" } , method = RequestMethod.GET)
			public String qnaForm(
					@PathVariable("bcId") String bcId,
					@RequestParam(value = "brIdresult",required = false) String brId,
					BoardConfigVO boardConfigVO,
					@ModelAttribute("form")BoardArticleVO boardArticleVO,
					@ModelAttribute("replyForm")BoardReplyVO boardReplyVO,
					@ModelAttribute("replyFileForm")FileVO fileVO1,
					HttpServletRequest request,HttpSession session,ModelMap model,
					RedirectAttributes redirectAttributes) throws Exception {
				
				String diKey = (String) session.getAttribute(Globals.DI_KEY);
				String retMsg = "";
				if(diKey == null) {
					retMsg = "로그인이 필요한 서비스입니다.";
					redirectAttributes.addFlashAttribute("retMsg", retMsg);
					return "redirect:/usr/main.do";
				}
				
				LoginInfo loginInfo = new LoginInfo(); // 세션
				loginInfo.putSessionToVo(boardArticleVO); // session의 정보를 VO에 추가.
				
				String menuId = boardArticleVO.getMenuId();
				
				String returnPage = "";
				
				boardConfigVO = boardService.getBoardConfig(boardConfigVO);
						
				//bcid 해당
				model.addAttribute("boardConfigVO",boardConfigVO);
				
				model.addAttribute("menuId", menuId);
				
				model.addAttribute("bcId", bcId);
				
				model.addAttribute("bcName", boardConfigVO.getBcName());
				
				String bcType = boardConfigVO.getBcType();

				returnPage = "/usr/bbs/"+bcType+"/form";
				
				return returnPage;
			}
			
			//QNA 등록
			//@Interceptor(value = {"loginBinding"})
			@RequestMapping( value = { "{bcId}/form.do" } , method = RequestMethod.POST)
			public String qnaFormPost(
					@PathVariable("bcId") String bcId,
					@RequestParam(value = "brIdresult",required = false) String brId,
					BoardConfigVO boardConfigVO,
					@ModelAttribute("form")BoardArticleVO boardArticleVO,
					@ModelAttribute("replyForm")BoardReplyVO boardReplyVO,
					@ModelAttribute("replyFileForm")FileVO fileVO1,
					HttpServletRequest request,HttpSession session,ModelMap model,
					RedirectAttributes redirectAttributes, final MultipartHttpServletRequest multiRequest) throws Exception {
				
				String diKey = (String) session.getAttribute(Globals.DI_KEY);
				String retMsg = "";
				if(diKey == null) {
					retMsg = "로그인이 필요한 서비스입니다.";
					redirectAttributes.addFlashAttribute("retMsg", retMsg);
					return "redirect:/usr/main.do";
				}
				
				LoginInfo loginInfo = new LoginInfo(); // 세션
				loginInfo.putSessionToVo(boardArticleVO); // session의 정보를 VO에 추가.
				
				
				
				String menuId = boardArticleVO.getMenuId();
			
				String returnPage = "";
				
				if(boardArticleVO.getBaNotice() == null){
					
				    ///////////////0을 넣어서  상단 공지 미사용으로 만들고/////////////////
					boardArticleVO.setBaNotice("0");
					
				}
				
				int rs = boardService.insertUserBoardArticle(boardArticleVO, multiRequest);
				
				returnPage = "/usr/bbs/"+bcId+"/list.do?menuId="+menuId;
				
				return "redirect:"+ returnPage;
			}
			
			
			//QNA 수정 폼
			//@Interceptor(value = {"loginBinding"})
			@RequestMapping( value = { "{bcId}/updateForm.do" } , method = RequestMethod.GET)
			public String updateFormGet(
					@PathVariable("bcId") String bcId,
					BoardConfigVO boardConfigVO,
					@ModelAttribute("form")BoardArticleVO boardArticleVO,
					HttpServletRequest request,HttpSession session,
					ModelMap model,
					RedirectAttributes redirectAttributes) throws Exception {
				
				
				String diKey = (String) session.getAttribute(Globals.DI_KEY);
				String retMsg = "";
				if(diKey == null) {
					retMsg = "로그인이 필요한 서비스입니다.";
					redirectAttributes.addFlashAttribute("retMsg", retMsg);
					return "redirect:/usr/main.do";
				}
				
				LoginInfo loginInfo = new LoginInfo(); // 세션
				loginInfo.putSessionToVo(boardArticleVO); // session의 정보를 VO에 추가.
				
			
				String returnPage = "";
				
				String menuId = boardArticleVO.getMenuId();
				
				boardConfigVO = boardService.getBoardConfig(boardConfigVO);
				
				
				BoardArticleVO qnaUpdateResult = boardService.getBoardArticle(boardArticleVO);
				
				////////////////
				// 파일 리스트//
				////////////////
				FileVO fileVO = new FileVO();
						
				fileVO.setThumbnailCrop("N");
				fileVO.setBoardIdx(boardArticleVO.getBaId());
						
				List<FileVO> fileList = fileService.listFile(fileVO);		
				
				model.addAttribute("fileList", fileList);
				
				model.addAttribute("qnaUpdateResult",qnaUpdateResult);
				
				//bcid 해당
				model.addAttribute("boardConfigVO",boardConfigVO);
				
				model.addAttribute("menuId", menuId);
				
				model.addAttribute("bcId", bcId);
				
				String bcType = boardConfigVO.getBcType();
				
				returnPage = "/usr/bbs/"+bcType+"/updateForm";
				
				return returnPage;
			}
			
			//QNA 수정 앣션
			//@Interceptor(value = {"loginBinding"})
			@RequestMapping( value = { "{bcId}/updateForm.do" } , method = RequestMethod.POST)
			public String updateFormPost(
					BoardConfigVO boardConfigVO,
					@ModelAttribute("form")BoardArticleVO boardArticleVO,
					HttpServletRequest request,HttpSession session,
					ModelMap model,
					RedirectAttributes redirectAttributes, final MultipartHttpServletRequest multiRequest) throws Exception {
				
				String diKey = (String) session.getAttribute(Globals.DI_KEY);
				String retMsg = "";
				if(diKey == null) {
					retMsg = "로그인이 필요한 서비스입니다.";
					redirectAttributes.addFlashAttribute("retMsg", retMsg);
					return "redirect:/usr/main.do";
				}
				
				LoginInfo loginInfo = new LoginInfo(); // 세션
				loginInfo.putSessionToVo(boardArticleVO); // session의 정보를 VO에 추가.
				
				
				String menuId = boardArticleVO.getMenuId();
				
				String returnPage = "";
				
				
				int rs =  boardService.userUpdateQna(boardArticleVO, multiRequest);
				
				
				
				return "redirect:" +"/usr/bbs/"+boardArticleVO.getBcId()+"/list.do?menuId="+menuId;
			}
			
			
			@RequestMapping(value = "/{bcId}/listAjax.do", method = RequestMethod.GET)
			@ResponseBody
			public List<BoardArticleVO> boardListAjax(
			        @PathVariable("bcId") String bcId,
			        BoardArticleVO boardArticleVO) throws Exception {

			    // 필수값 세팅
			    boardArticleVO.setBcId(bcId);

			    // 상단 공지 제외(일반 리스트만)
			    if (boardArticleVO.getBaNotice() == null) {
			        boardArticleVO.setBaNotice("0");
			    }

			    // 기본 페이징(원하시는 기본값으로)
			    if (boardArticleVO.getPageIndex() < 1) {
			        boardArticleVO.setPageIndex(1);
			    }
			    if (boardArticleVO.getPageSize() < 1) {
			        boardArticleVO.setPageSize(5);
			    }

			    // 카테고리(baCategory1), 키워드 등은 파라미터 그대로 사용
			    return boardService.listBoardArticle(boardArticleVO);
			}
			
			//QNA, 체험후기 삭제 앣션
			//@Interceptor(value = {"loginBinding"})
			@RequestMapping( value = { "{bcId}/delete.do" } , method = RequestMethod.POST)
			public String deletePost(
					BoardConfigVO boardConfigVO,
					@ModelAttribute("form")BoardArticleVO boardArticleVO,
					HttpServletRequest request,HttpSession session,
					ModelMap model,
					RedirectAttributes redirectAttributes) throws Exception {
				
				String diKey = (String) session.getAttribute(Globals.DI_KEY);
				String retMsg = "";
				if(diKey == null) {
					retMsg = "로그인이 필요한 서비스입니다.";
					redirectAttributes.addFlashAttribute("retMsg", retMsg);
					return "redirect:/usr/main.do";
				}
				
				LoginInfo loginInfo = new LoginInfo(); // 세션
				loginInfo.putSessionToVo(boardArticleVO); // session의 정보를 VO에 추가.
				
				
				String menuId = boardArticleVO.getMenuId();
				
				String returnPage = "";
				
				
				int rs =  boardService.userDeleteQna(boardArticleVO);
				
				
				
				return "redirect:" +"/usr/bbs/"+boardArticleVO.getBcId()+"/list.do?menuId="+menuId;
			}

}
