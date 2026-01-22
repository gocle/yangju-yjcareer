package com.gocle.yangju.forest.comm.file.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;
import com.gocle.yangju.forest.comm.util.AtchFileUtil;
import com.gocle.yangju.forest.comm.vo.LoginInfo;

import egovframework.com.cmm.util.EgovBasicLogger;
import egovframework.com.cmm.util.EgovResourceCloseHelper;

@Controller
public class FileController {

	@Autowired
	FileService fileService;
	
	@Autowired
	AtchFileUtil atchFileUtil;
	
	/**
	 * 첨부파일 다운로드
	 * @param commandMap
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/board/FileDown.do")
	public void boardFileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String atchFileIdx = (String) commandMap.get("atchFileIdx");
		
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileIdx(atchFileIdx);
		fileVO = fileService.getFile(fileVO);
		
		File uFile = new File(fileVO.getFileSavePath(), fileVO.getSaveFileName());
		long fSize = uFile.length();
		
		if(fSize > 0) {
			String mimetype = "application/x-msdownload";
			response.setContentType(mimetype);
			atchFileUtil.setDisposition(fileVO.getOrgFileName(), request, response);
			
			BufferedInputStream in = null;
			BufferedOutputStream out = null;
			
			try {
				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(response.getOutputStream());
				FileCopyUtils.copy(in, out);
				out.flush();
			} catch (IOException ex) {
				EgovBasicLogger.ignore("IO Exception", ex);
			} finally {
				EgovResourceCloseHelper.close(in, out);
			}
		} else {
			response.setContentType("application/x-msdownload");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<script>");
			printwriter.println("alert('존재하지 않는 파일입니다: \\n" + fileVO.getOrgFileName() + "');");
			printwriter.println("window.open(\"about:blank\",\"_self\").close();");
			printwriter.println("</script>");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		}
	}
	
	/**
	 * 댓글 첨부파일 다운로드
	 * @param commandMap
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/board/replyFileDown.do")
	public void replyFileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String atchFileIdx = (String) commandMap.get("atchFileIdx");
		
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileIdx(atchFileIdx);
		fileVO = fileService.getFile(fileVO);
		
		File uFile = new File(fileVO.getFileSavePath(), fileVO.getSaveFileName());
		long fSize = uFile.length();
		
		if(fSize > 0) {
			String mimetype = "application/x-msdownload";
			response.setContentType(mimetype);
			atchFileUtil.setDisposition(fileVO.getOrgFileName(), request, response);
			
			BufferedInputStream in = null;
			BufferedOutputStream out = null;
			
			try {
				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(response.getOutputStream());
				FileCopyUtils.copy(in, out);
				out.flush();
			} catch (IOException ex) {
				EgovBasicLogger.ignore("IO Exception", ex);
			} finally {
				EgovResourceCloseHelper.close(in, out);
			}
		} else {
			response.setContentType("application/x-msdownload");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<script>");
			printwriter.println("alert('존재하지 않는 파일입니다: \\n" + fileVO.getOrgFileName() + "');");
			printwriter.println("window.open(\"about:blank\",\"_self\").close();");
			printwriter.println("</script>");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		}
	}
	
	/**
	 * 파일 삭제
	 * @param fileVO
	 * @param redirectAttributes
	 * @param returnUrl
	 * @param menuId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/board/deleteFile.do")
	public String deleteFile(@ModelAttribute("fileForm")FileVO fileVO, RedirectAttributes redirectAttributes, @RequestParam("returnUrl") String returnUrl,
			@RequestParam("menuId")String menuId) throws Exception {
		
		String retMsg = "";
		int result = fileService.deleteFile(fileVO);
		if(result > 0) {
			retMsg = "삭제되었습니다.";
		} else {
			retMsg = "삭제할 수 없습니다.";
		}
		
		redirectAttributes.addAttribute("retMsg", retMsg);
		if(returnUrl.contains("&amp;")){
    		return "redirect:"+returnUrl.replace("&amp;","&")+"&menuId="+menuId;
    	} else if(returnUrl.contains("usr/bbs/review/updateForm.do")){
    		return "redirect:"+returnUrl+"&menuId="+menuId;
    	}
		return "redirect:"+returnUrl+"&menuId="+menuId;
	}
	
    @RequestMapping(value={"/board/replyDeleteFile.do"}, method = RequestMethod.POST )
    public String replyDeleteFile(
    		@ModelAttribute("replyFileForm") FileVO fileVO,
    		RedirectAttributes redirectAttributes,
    		@RequestParam("returnUrl") String returnUrl,
    		@RequestParam("menuId") String menuId,
    		HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
    	
    	//일단 아티클 로그인 session 담고 리플 추가 후 처리
		LoginInfo loginInfo = new LoginInfo(); // 세션
		loginInfo.putSessionToVo(fileVO); // session의 정보를 VO에 추가.
		

    	
    	String retMsg = "";
    	
    	
    	int data = fileService.deleteFile(fileVO);
    	
    	if(data > 0 ){
    		retMsg = "댓글 첨부 삭제 되셨습니다.";
    	}else{
    		
    		retMsg = "댓글 첨부 삭제 되지 않았습니다.";
    	}
    	
    	redirectAttributes.addFlashAttribute("retMsg", retMsg);    	
    	
    	return "redirect:"+returnUrl+"&menuId="+menuId;
    }
	
	/**
	 * 파일 삭제여부 수정
	 */
	@RequestMapping("/board/updateAtchFileInfo.do")
	@ResponseBody
	public Map<String, Object> deleteFile(@ModelAttribute("fileForm") FileVO fileVO, 
            @RequestParam("returnUrl") String returnUrl,
            @RequestParam("menuId") String menuId) throws Exception {
		
		Map<String, Object> response = new HashMap<>();
	    int result = fileService.deleteFile(fileVO);
	    
	    if (result > 0) {
	        response.put("status", "success");
	    } else {
	        response.put("status", "error");
	    }
	    
	    return response;
	}
}
