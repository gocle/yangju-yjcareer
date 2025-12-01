package com.gocle.yangju.forest.adm.board.web;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.board.service.AdminBoardService;
import com.gocle.yangju.forest.adm.board.vo.BoardArticleVO;
import com.gocle.yangju.forest.adm.board.vo.BoardConfigVO;
import com.gocle.yangju.forest.adm.board.vo.BoardReplyVO;
import com.gocle.yangju.forest.adm.code.service.AdminCodeService;
import com.gocle.yangju.forest.adm.code.vo.CodeVO;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;

import egovframework.com.cmm.service.Globals;


@Controller
@RequestMapping("/staff/bbs/")
public class StaffBoardController {
	
	@Autowired
	AdminBoardService adminBoardService;
	
	@Autowired
	AdminCodeService adminCodeService;
	
	@Autowired
	FileService fileService;

	
	/**
	 * 담당자 > 게시판별 게시글목록
	 * @param bcId
	 * @param boardConfigVO
	 * @param boardArticleVO
	 * @param boardReplyVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{bcId}/list.do")
	public String boardList(@PathVariable("bcId") String bcId, @ModelAttribute("form") BoardConfigVO boardConfigVO, BoardArticleVO boardArticleVO
			, BoardReplyVO boardReplyVO, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		String menuId = boardConfigVO.getMenuId();
		String retMsg = "";
		
		//공통코드 확인필요
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGroup("PROCESS_STATUS_ARTICLE");
		List<CodeVO> codeList = adminCodeService.selectCodeList(codeVO);
		model.addAttribute("codeList", codeList);
		
		boardConfigVO = adminBoardService.selectBoardConfig(boardConfigVO);
		String bcType = boardConfigVO.getBcType();
		
		//대분류 존재시 소분류 검색
		if(StringUtils.isNotEmpty(boardConfigVO.getBcCategory1())) {
			CodeVO cvo = new CodeVO();
			cvo.setCodeGroup(boardConfigVO.getBcCategory1());
			List<CodeVO> codeSubList = adminCodeService.selectCodeList(codeVO);
			model.addAttribute("codeSubList", codeSubList);
		}
		
		String id = boardConfigVO.getBcId();
		boardArticleVO.setBcId(id);
		//상단공지 미사용시
		if(StringUtils.isEmpty(boardArticleVO.getBaNotice())) {
			boardArticleVO.setBaNotice("0");
		}
		//최신순 공지 3개
		if(boardConfigVO.getBcType().equals("default")) {
			List<BoardArticleVO> topNoticeList =adminBoardService.topNoticeList(boardArticleVO);
			model.addAttribute("topNoticeList", topNoticeList);
		}
		
		List<BoardArticleVO> resultList = adminBoardService.listBoardArticle(boardArticleVO);
		
		int totalCnt = 0;
		Integer pageSize = boardArticleVO.getPageSize();
		Integer pageIndex = boardArticleVO.getPageIndex();
		
		if(resultList.size() > 0) {
			totalCnt =Integer.parseInt(resultList.get(0).getTotalCount());
		}
		
	    PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(boardArticleVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
        model.addAttribute("paginationInfo", paginationInfo);
        
        model.addAttribute("articleList", resultList);
        model.addAttribute("boardConfigVO",boardConfigVO);
        model.addAttribute("boardArticleVO", boardArticleVO);
        model.addAttribute("menuId",menuId);
		model.addAttribute("bcType", bcType);
		
		return "/staff/bbs/" + bcType + "/list";
	}
	
	/**
	 * 담당자 > 게시글 입력폼
	 * @param bcId
	 * @param boardConfigVO
	 * @param boardArticleVO
	 * @param boardReplyVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{bcId}/form.do")
	public String boardInsertForm(@PathVariable("bcId") String bcId, @ModelAttribute("form") BoardConfigVO boardConfigVO, BoardArticleVO boardArticleVO
			, BoardReplyVO boardReplyVO, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		String menuId = boardConfigVO.getMenuId();
		
		//공통코드 확인필요
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGroup("PROCESS_STATUS_ARTICLE");
		List<CodeVO> codeList = adminCodeService.selectCodeList(codeVO);
		model.addAttribute("codeList", codeList);
		
		boardConfigVO = adminBoardService.selectBoardConfig(boardConfigVO);
		String bcType = boardConfigVO.getBcType();
		
		//대분류 존재시 소분류 검색
		if(StringUtils.isNotEmpty(boardConfigVO.getBcCategory1())) {
			CodeVO cvo = new CodeVO();
			cvo.setCodeGroup(boardConfigVO.getBcCategory1());
			List<CodeVO> codeSubList = adminCodeService.selectCodeList(cvo);
			model.addAttribute("codeSubList", codeSubList);
		}
		
		model.addAttribute("menuId", menuId);
		model.addAttribute("boardConfigVO",boardConfigVO);
		
		return "/staff/bbs/" + bcType + "/form";
	}
	
	/**
	 * 담당자 > 게시글 등록
	 * @param bcId
	 * @param boardConfigVO
	 * @param boardArticleVO
	 * @param session
	 * @param multiRequest
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{bcId}/insert.do")
	public String boardInsert(@PathVariable("bcId") String bcId, @ModelAttribute("form") BoardConfigVO boardConfigVO, BoardArticleVO boardArticleVO
			, HttpSession session, final MultipartHttpServletRequest multiRequest, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(boardArticleVO);
		
		String menuId = boardConfigVO.getMenuId();
		String retMsg = "";
		
		boardConfigVO = adminBoardService.selectBoardConfig(boardConfigVO);
		String bcType = boardConfigVO.getBcType();
		
		if("1".equals(boardConfigVO.getBcSupportThumbnail())) {
			List<MultipartFile> objFile = multiRequest.getFiles("file_thumbFileId");
			String fileName = objFile.get(0).getOriginalFilename();
			String ext = fileName.substring(fileName.lastIndexOf('.')).toLowerCase(Locale.ROOT);
			if(!Arrays.asList("jpg", "jpeg", "png").contains(ext)) {
				retMsg = "허용되지 않는 파일형식입니다.";
				redirectAttributes.addFlashAttribute("retMsg", retMsg);
				return "redirect:/staff/bbs/" + bcId + "/form.do?menuId="+menuId;
			}
		}
		
		boardArticleVO.setBcId(bcId);
		int result = 0;
		if (!bcType.equals("default")) {
		    //기본 게시판이 아닐 시 공지사항 사용X
		    boardArticleVO.setBaNotice("0");
		}
		
		result = adminBoardService.insertBoardArticle(boardArticleVO, multiRequest);
		if (result > 0) {
		    retMsg = "저장되었습니다.";
		} else {
		    retMsg = "저장할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		model.addAttribute("menuId", menuId);
		
		return "redirect:/staff/bbs/" + bcId + "/list.do?menuId="+menuId;
	}
	
	/**
	 * 담당자 > 게시판 게시글 상세보기
	 * @param bcId
	 * @param brId
	 * @param boardConfigVO
	 * @param boardArticleVO
	 * @param boardReplyVO
	 * @param fileVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{bcId}/detail.do")
	public String boardDetail(@PathVariable("bcId")String bcId, @RequestParam(value="brIdResult", required=false)String brId, BoardConfigVO boardConfigVO, @ModelAttribute("form")BoardArticleVO boardArticleVO,
			@ModelAttribute("replyForm")BoardReplyVO boardReplyVO, @ModelAttribute("replyFileForm")FileVO fileVO, ModelMap model) throws Exception {
		
		String menuId = boardArticleVO.getMenuId();
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(boardArticleVO);
		
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeGroup("PROCESS_STATUS_ARTICLE");
		List<CodeVO> codeList = adminCodeService.selectCodeList(codeVO);
		model.addAttribute("codeList", codeList);
		
		boardConfigVO = adminBoardService.selectBoardConfig(boardConfigVO);
		
		boardArticleVO.setBcId(bcId);
		BoardArticleVO result = adminBoardService.selectBoardArticle(boardArticleVO);
		
		boardReplyVO.setBaId(result.getBaId());
		List<BoardReplyVO> boardReplyList = adminBoardService.listBoardReply(boardReplyVO);
		
		FileVO fvo = new FileVO();
		fvo.setBoardIdx(result.getBaId());
		fvo.setThumbnailCrop("N");
		List<FileVO> fileList = fileService.listBoardFile(fvo);
		
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listBoardFile(fvo);
		
		model.addAttribute("boardConfigVO", boardConfigVO);
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileList1", tFileList);
		model.addAttribute("result",result);
		model.addAttribute("boardReplyList",boardReplyList);
		model.addAttribute("menuId", menuId);
		
		return "/staff/bbs/" + boardConfigVO.getBcType() + "/view";
	}
	
	/**
	 * 담당자 > 게시판 게시글 수정폼
	 * @param bcId
	 * @param baId
	 * @param boardConfigVO
	 * @param boardArticleVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{bcId}/updateForm.do")
	public String updateArticleForm(@PathVariable("bcId")String bcId, @RequestParam("baId")String baId, BoardConfigVO boardConfigVO, 
			@ModelAttribute("form")BoardArticleVO boardArticleVO, ModelMap model) throws Exception {
		
		String menuId = boardArticleVO.getMenuId();
		
		boardConfigVO = adminBoardService.selectBoardConfig(boardConfigVO);
		String bcType = boardConfigVO.getBcType();
		boardArticleVO.setBcId(boardConfigVO.getBcId());
		
		//대분류 존재시 소분류 검색
		if(StringUtils.isNotEmpty(boardConfigVO.getBcCategory1())) {
			CodeVO cvo = new CodeVO();
			cvo.setCodeGroup(boardConfigVO.getBcCategory1());
			List<CodeVO> codeSubList = adminCodeService.selectCodeList(cvo);
			model.addAttribute("codeSubList", codeSubList);
		}
		
		boardArticleVO = adminBoardService.selectBoardArticle(boardArticleVO);
		
		FileVO fvo = new FileVO();
		fvo.setBoardIdx(boardArticleVO.getBaId());
		fvo.setThumbnailCrop("N");
		List<FileVO> fileList = fileService.listBoardFile(fvo);
		
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listBoardFile(fvo);
		
		model.addAttribute("boardConfigVO", boardConfigVO);
		model.addAttribute("boardArticleVO", boardArticleVO);
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileList1", tFileList);
		model.addAttribute("menuId",menuId);
		
		return "/staff/bbs/" + bcType + "/form";
	}
	
	/**
	 * 담당자 > 게시글 수정
	 * @param bcId
	 * @param boardConfigVO
	 * @param boardArticleVO
	 * @param multiRequest
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{bcId}/update.do")
	public String updateArticle(@PathVariable("bcId") String bcId, BoardConfigVO boardConfigVO, @ModelAttribute("form")BoardArticleVO boardArticleVO,
			final MultipartHttpServletRequest multiRequest, RedirectAttributes redirectAttributes ) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(boardArticleVO);
		
		String menuId = boardArticleVO.getMenuId();
		String retMsg = "";
		
		boardConfigVO = adminBoardService.selectBoardConfig(boardConfigVO);
		String bcType = boardConfigVO.getBcType();
		int result = 0;
		
		switch (bcType) {
	    case "default":
	    	result = adminBoardService.updateArticleBoard(boardArticleVO, multiRequest);
	        break;

	    case "gallary":
	        boardArticleVO.setBaNotice("0");
	        result = adminBoardService.updateArticleBoard(boardArticleVO, multiRequest);
	        break;

	    default:
	        boardArticleVO.setBaNotice("0");
	        result = adminBoardService.updateBoardArticleQna(boardArticleVO);
	        break;
		}
		
		if(result > 0) {
			retMsg = "수정되었습니다.";
		} else {
			retMsg = "수정할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/staff/bbs/" + bcId + "/list.do?menuId=" + menuId; 
	}
	
	/**
	 * 담당자 > 게시글 삭제
	 * @param bcId
	 * @param baId
	 * @param boardConfigVO
	 * @param boardArticleVO
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{bcId}/delete.do")
	public String deleteArticle(@PathVariable("bcId")String bcId, @RequestParam("baId")String baId, BoardConfigVO boardConfigVO, 
			@ModelAttribute("form")BoardArticleVO boardArticleVO, RedirectAttributes redirectAttributes) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(boardArticleVO);
		
		String menuId = boardConfigVO.getMenuId();
		String retMsg = "";
		
		int result = adminBoardService.deleteBoardArticle(boardArticleVO);
		if(result > 0) {
			retMsg = "삭제되었습니다.";
		} else {
			retMsg = "삭제할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/staff/bbs/" + bcId + "/list.do?menuId=" + menuId;
	}
	
	
	////////////////
	//댓글 등록 action//
	////////////////
	@RequestMapping( value = { "{bcId}/replyInsert.do"} , method = RequestMethod.POST)
	public String boardReplyInsertPost(
		@PathVariable("bcId") String bcId,
		BoardConfigVO boardConfigVO,
		@ModelAttribute("form")BoardArticleVO boardArticleVO,
		@ModelAttribute("replyForm")BoardReplyVO boardReplyVO,
		HttpServletRequest request,HttpSession session,ModelMap model,
		RedirectAttributes redirectAttributes,
		final MultipartHttpServletRequest multiRequest
		) throws Exception {
	
	//일단 아티클 로그인 session 담고 리플 추가 후 처리
	LoginInfo loginInfo = new LoginInfo(); // 세션
	loginInfo.putSessionToVo(boardReplyVO); // session의 정보를 VO에 추가.
	
	
	/*		
	MultipartFile file = multiRequest.getFile("file_atchFileId");
	
	
	System.out.println("multirequest" +file.getOriginalFilename());
		*/
		String menuId = boardConfigVO.getMenuId();
		
		String returnPage = "";
	
		String retMsg = "";
		
		
		//이부분 약간 위험
		boardConfigVO = adminBoardService.getBoardConfig(boardConfigVO);
		
	
		String bcType = boardConfigVO.getBcType();
		
		
	
		boardArticleVO.setBcId(bcId);
		
		BoardArticleVO result = adminBoardService.getBoardArticle(boardArticleVO);
		
		
		int rs = 0;
		
		// 상태값 업데이트를 해줌.
		if(bcType.equals("qna")){
			
			//공지사항이 아니니깐 0을넣어주고
			boardArticleVO.setBaNotice("0");
			
			rs = adminBoardService.updateBoardArticleQna(boardArticleVO);
			
		}
		
		
		boardReplyVO.setBaId(result.getBaId());
	
	
		if( boardReplyVO == null ){
		
			retMsg = "잘못 된 접근경로입니다.";
			
			redirectAttributes.addFlashAttribute("retMsg", retMsg);
			
			return "redirect:/staff/bbs/"+boardConfigVO.getBcId()+"/detail.do";
		
		}
		
		
		//댓글  , Q&A 답변글
		rs = adminBoardService.insertBoardReply(boardReplyVO, multiRequest);
		
		 	
		
		if(rs > 0){
			retMsg = "댓글이 정상 입력됐습니다.";
		}
		else{
			retMsg = "입력 되지 않습니다.";
		}
		
	
	redirectAttributes.addFlashAttribute("retMsg", retMsg);
	
	returnPage = "/staff/bbs/"+boardArticleVO.getBcId()+"/detail.do?menuId="+menuId+"&baId="+boardReplyVO.getBaId();
			
	return "redirect:"+returnPage;
			
	}

	//////////
	//댓글 삭제//
	//////////
	@RequestMapping(value = { "{bcId}/replyDelete.do "} , method = RequestMethod.POST)
	public String replyDeleteGet(
		@PathVariable("bcId") String bcId,
		@ModelAttribute("form")BoardArticleVO boardArticleVO,
		BoardConfigVO boardConfigVO,
		@ModelAttribute("replyForm") BoardReplyVO boardReplyVO,
		HttpSession session,
		RedirectAttributes redirectAttributes ,
		HttpServletRequest request,
		ModelMap model) throws Exception {
	
	//일단 아티클 로그인 session 담고 리플 추가 후 처리
	LoginInfo loginInfo = new LoginInfo(); // 세션
	loginInfo.putSessionToVo(boardReplyVO); // session의 정보를 VO에 추가.
	
	
	// View호출
	
	String returnPage = "";
	
	String retMsg = "";
	
	String menuId = boardConfigVO.getMenuId();
	
	String brId = boardReplyVO.getBrId();
	
	
	boardReplyVO.setBaId(boardArticleVO.getBaId());
	
	boardReplyVO.setBrId(brId);
	
	
	int rs = adminBoardService.deleteBoardReply(boardReplyVO);
	
	if(rs > 0){
		retMsg = "댓글 삭제 완료되었습니다.";
		
	}else{
		retMsg = "댓글 삭제 안되었습니다.";
	}
	
	redirectAttributes.addFlashAttribute("retMsg", retMsg);
	
	
	returnPage = "/staff/bbs/"+boardArticleVO.getBcId()+"/detail.do?baId="+boardArticleVO.getBaId()+"&menuId="+menuId;
	
	
	return "redirect:"+returnPage;
	}
	
	
	/////////////
	//댓글 수정 처리//
	/////////////
	@RequestMapping( value = { "{bcId}/replyUpdate.do "} , method = RequestMethod.POST)
	public String updateReplyPost(
		@PathVariable("bcId") String bcId,
		BoardConfigVO boardConfigVO,
		@ModelAttribute("form")BoardArticleVO boardArticleVO,
		HttpServletRequest request,HttpSession session,
		final MultipartHttpServletRequest multiRequest,
		@ModelAttribute("replyFunc") BoardReplyVO boardReplyVO,
		RedirectAttributes redirectAttributes) throws Exception {
	
	
	
	//일단 아티클 로그인 session 담고 리플 추가 후 처리
	LoginInfo loginInfo = new LoginInfo(); // 세션
	loginInfo.putSessionToVo(boardReplyVO); // session의 정보를 VO에 추가.
	
	
	String returnPage = "";
	
	String retMsg = "";	
	
	
	String menuId = boardReplyVO.getMenuId();
	
	
	
	
	//////해당 detail baId reply_Func 로 넘겨주기
	boardArticleVO.setBcId(bcId);
	
	BoardArticleVO result = adminBoardService.getBoardArticle(boardArticleVO);
	
	
	int rs = adminBoardService.updateBoardReply(boardReplyVO, multiRequest);
	
	
	if(rs > 0){
		retMsg = "댓글 수정 완료되었습니다.";
			
	}else{
		retMsg = "댓글 수정 취소되었습니다.";					
	}
	
	redirectAttributes.addFlashAttribute("retMsg", retMsg);
	
	
	returnPage = "/staff/bbs/"+bcId+"/detail.do?baId="+result.getBaId()+"&menuId="+menuId;
	
	
	return "redirect:"+returnPage;
	
	}
}
