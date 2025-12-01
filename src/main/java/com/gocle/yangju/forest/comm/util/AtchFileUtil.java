package com.gocle.yangju.forest.comm.util;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;

import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;

@Component("atchFileUtil")
public class AtchFileUtil {

	
	@Autowired
	FileService fileSerivce;
	
	private static final Logger LOG = Logger.getLogger(AtchFileUtil.class.getName());
	
	public static boolean checkIsFileName(String fileName) throws Exception {

	    Set<String> allowedExt = new HashSet<>(Arrays.asList(
	        ".doc", ".docx", ".gif", ".hwp", ".jpeg", ".jpg", ".png", ".pdf",
	        ".ppt", ".pptx", ".txt", ".xls", ".xlsx", ".zip",
	        ".mp3", ".mp4", ".m4a", ".wav", ".wma", ".flac", ".ogg", ".aac"
	    ));

	    if (fileName != null && !fileName.trim().isEmpty()) {
	        String ext = fileName.substring(fileName.lastIndexOf('.')).toLowerCase(Locale.ROOT);
	        return allowedExt.contains(ext);
	    }

	    return false;
	}
	
	/**
	 * 응용어플리케이션에서 고유값을 사용하기 위해 시스템에서 17자리의 TIMESTAMP값을 구하는 기능
	 *
	 * @param
	 * @return Timestamp 값
	 * @exception MyException
	 * @see
	 */
	public static String getTimeStamp() {

		String rtnStr = null;

		// 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
		String pattern = "yyyyMMddhhmmssSSS";

		try {
			SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
			Timestamp ts = new Timestamp(System.currentTimeMillis());

			rtnStr = sdfCurrent.format(ts.getTime());
		} catch (Exception e) {
			// e.printStackTrace();

			// throw new RuntimeException(e); // 보안점검 후속조치
			LOG.debug("IGNORED: " + e.getMessage());
		}

		return rtnStr;
	}
	
	
	/**
	 * 서버의 특정 위치에 파일을 저장하는 역활을 하는 공통 함수</br>
	 * 서버에 저장될 파일명의 명명 규칙 : newName = keyStr + atchFileUtil.getTimeStamp() + fileKey;
	 * @param file : MultipartFile
	 * @param fileKey : 서버에 저장될 파일명 맨뒤에 붙을 순번 값
	 * @param keyStr : 서버에 저장될 파일명 앞에 붙을 prefix 값
	 * @param storePathString : 저장될 서버에서의 경로.
	 * @param atchFileIdString : DB 에서 식별할수있는 PK 값
	 * @return 저장에 사용된 AtchFileVO 객체.
	 * @throws IllegalStateException
	 * @throws IOException
	 * @throws Exception
	 */
	private FileVO getUploadFileInfo (MultipartFile file, int fileKey, String baId, 
			String storePathString, String regSeq, String thumbnailCrop) throws IllegalStateException, IOException, Exception {
		
		if (file == null || file.isEmpty()) {
	        return null;
	    }

	    String originFileName = file.getOriginalFilename();
	    if (StringUtils.isEmpty(originFileName)) {
	        return null;
	    }

	    if (!this.checkIsFileName(originFileName)) {
	        return null;
	    }
		
		FileVO fvo = new FileVO();
		String filePath = "";
		
		if(StringUtils.isEmpty(originFileName)) {
			return fvo;
		}
		
		if(this.checkIsFileName(originFileName)) {
			int index = originFileName.lastIndexOf(".");
			String fileExt = originFileName.substring(index+1);
			long fileSize = file.getSize();
			String newName = "";
			
			if(thumbnailCrop.equals("N")) {
				newName = this.getTimeStamp() + fileKey;
			} else if(thumbnailCrop.equals("Y")) {
				newName = this.getTimeStamp() + fileKey + "." + fileExt;
			}
			
			filePath = storePathString + File.separator + newName;
			file.transferTo(new File(egovframework.com.cmm.EgovWebUtil.filePathBlackList(filePath)));
			
			fvo.setFileExtn(fileExt);
			fvo.setFileSavePath(storePathString);
			fvo.setFileSize(fileSize);
			fvo.setOrgFileName(originFileName);
			fvo.setSaveFileName(newName);
			fvo.setThumbnailCrop(thumbnailCrop);
		}
		return fvo;
	}
	
	/**
	 * [File 저장 type 1]</br>
	 * MultipartFile 로 넘어온 File을 서버의 특정 경로에 저장한다.</br>
	 * 화면에서 모두 다른 input name인 경우.(<pre> < form method='post' action=...> < input name="xx_1" type="file"> ,< input name="xx_2" type="file"> ,< input name="xx_3" type="file"> < / form > </pre>)
	 * @param files 		: MultipartHttpServletRequest 넘어온 파일(단건).
	 * @param keyStr 		: 서버에 저장될 파일명( 접두사 )
	 * @param fileKeyParam 	: 서버에 저장될 파일명( 접미사 : 같은 PK에대한 순번)
	 * @param atchFileId 	: 첨부파일 Table에 저장할 PKey 정보
	 * @param storePath 	: 서버에 저장될 위치. (없으면 Global properties ( "Globals.fileStorePath" )에 저장된 경로로 저장됨.)
	 * @return
	 * @throws Exception : framework/spring/context-common.xml  -> <bean id="spring.RegularCommonsMultipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
	 * List<AtchFileVO>
	 */
    public List<FileVO> parseAtchFileInfo(Map<String, MultipartFile> files, String keyStr, int fileKeyParam, String atchFileId, String storePath , String thumbnailCrop) throws Exception {
		
		int fileKey = fileKeyParam;
		String storePathString = egovframework.com.cmm.service.EgovProperties.getProperty(StringUtils.defaultIfEmpty(storePath, "Globals.fileStorePath"));

		File saveFolder = new File(egovframework.com.cmm.EgovWebUtil.filePathBlackList(storePathString));
		if (!saveFolder.exists() || saveFolder.isFile()) {
		    saveFolder.mkdirs();
		}
	
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		List<FileVO> result  = new ArrayList<FileVO>();
		
		if( StringUtils.isNotBlank( atchFileId ) ){
			
			while (itr.hasNext()) {
				
				Entry<String, MultipartFile> entry = itr.next();
				MultipartFile file = entry.getValue();
				
				FileVO fvo = getUploadFileInfo( file , fileKey , keyStr , storePathString , atchFileId ,thumbnailCrop );
				if( null != fvo ){
					result.add(fvo);
					++fileKey;		    	
				}
			}
		}
		return result;
    }
	/**
	 * [File 저장 type 2]</br>
	 * MultipartFile 로 넘어온 File을 서버의 특정 경로에 저장한다.</br>
	 * 화면에서 모두 같은 input name인 경우. <pre>(  < form method='post' action=...> < input name="xx" type="file"> ,< input name="xx" type="file"> ,< input name="xx" type="file"> </ form >  ) </pre>  
	 * @param files 		: MultipartHttpServletRequest 넘어온 파일 (배열형태).
	 * @param keyStr 		: 서버에 저장될 파일명( 접두사 )
	 * @param fileKeyParam 	: 서버에 저장될 파일명( 접미사 : 같은 PK에대한 순번)
	 * @param atchFileId 	: 첨부파일 Table에 저장할 PKey 정보
	 * @param storePath 	: 서버에 저장될 위치. (없으면 Global properties ( "Globals.fileStorePath" )에 저장된 경로로 저장됨.)
	 * @param addPath 	: 서버에 저장될 위치 하위폴더추가. (없으면 Global properties ( "Globals.fileStorePath" )에 저장된 경로로 저장됨.)
	 * @return
	 * @throws Exception
	 * List<AtchFileVO>
	 */
	public List<FileVO> parseAtchFileInfo(List<MultipartFile> files, String keyStr, int fileKeyParam, String regSeq, String storePath, String thumbnailCrop) throws Exception {
		
		int fileKey = fileKeyParam;
		String storePathString = egovframework.com.cmm.service.EgovProperties.getProperty(StringUtils.defaultIfEmpty(storePath, "Globals.fileStorePath"));

		File saveFolder = new File(egovframework.com.cmm.EgovWebUtil.filePathBlackList(storePathString));
		if (!saveFolder.exists() || saveFolder.isFile()) {
		    saveFolder.mkdirs();
		}
		
		Iterator<MultipartFile> itr = files.iterator();
		List<FileVO> result  = new ArrayList<FileVO>();
		
		if(StringUtils.isNotBlank( regSeq )){
			while (itr.hasNext()) {
				
				MultipartFile file = itr.next();
				
				FileVO fvo = getUploadFileInfo( file , fileKey , keyStr , storePathString , regSeq , thumbnailCrop );
				if( null != fvo ){
					result.add(fvo);
					++fileKey;		    	
				}
			}
		}
		return result;
	}
	
	public static boolean deleteFile(String filePath) throws Exception {
		boolean retStatus;
		
		File uf = new File(filePath);
		if(uf.exists() && uf.isFile() ){
			retStatus = uf.delete();
		}else{
			retStatus = false;
		}
		
		return retStatus;
	}
	
	private String getBrowser(HttpServletRequest request ) {
		String header = request.getHeader( "User-Agent" );
		if (header.indexOf( "MSIE" ) > -1) {
			return "MSIE";
		} else if (header.indexOf( "Trident" ) > -1) { // IE11 문자열 깨짐 방지
			return "Trident";
		} else if (header.indexOf( "Chrome" ) > -1) {
			return "Chrome";
		} else if (header.indexOf( "Opera" ) > -1) {
			return "Opera";
		}
		return "Firefox";
	}
	
	public void setDisposition( String filename, HttpServletRequest request, HttpServletResponse response ) throws Exception {
		
		String browser = this.getBrowser( request );

		String encodedFilename = this.getAttachFileName(request, filename);

		String dispositionPrefix = "attachment; filename=";
		response.setHeader( "Content-Disposition", dispositionPrefix + encodedFilename );

		if ("Opera".equals( browser )) {
			response.setContentType( "application/octet-stream;charset=UTF-8" );
		}
	}
	
	/**
	 * 브라우저 종류별로 다운로드 파일명을 엔코딩 한다.
	 * 
	 * @param request
	 * @param filename
	 * @return
	 * @throws Exception
	 */
	private static String getAttachFileName(HttpServletRequest request, String filename) throws Exception {
		// 브라우저 종류를 알아낸다.
		String browser = "Firefox";
		String header = request.getHeader("User-Agent");

		if (header.indexOf("MSIE") > -1)
			browser = "MSIE";
		else if (header.indexOf("Trident") > -1)
			browser = "Trident";				
		else if (header.indexOf("Chrome") > -1)
			browser = "Chrome";
		else if (header.indexOf("Opera") > -1)
			browser = "Opera";

		// 브라우저 종류별로 파일명을 엔코딩한다.
		String encodedFilename = null;
		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		}else if (browser.equals("Trident")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");			
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~')
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				else
					sb.append(c);
			}
			encodedFilename = sb.toString();
		} else {
			throw new RuntimeException("Not supported browser");
		}

		return encodedFilename;
	}

	/**
	 * [File 저장 type 2]</br>
	 * MultipartFile 로 넘어온 File을 서버의 특정 경로에 저장한다.</br>
	 * 화면에서 모두 같은 input name인 경우. <pre>(  < form method='post' action=...> < input name="xx" type="file"> ,< input name="xx" type="file"> ,< input name="xx" type="file"> </ form >  ) </pre>  
	 * @param files 		: MultipartHttpServletRequest 넘어온 파일 (배열형태).
	 * @param keyStr 		: 서버에 저장될 파일명( 접두사 )
	 * @param fileKeyParam 	: 서버에 저장될 파일명( 접미사 : 같은 PK에대한 순번)
	 * @param atchFileId 	: 첨부파일 Table에 저장할 PKey 정보
	 * @param storePath 	: 서버에 저장될 위치. (없으면 Global properties ( "Globals.fileStorePath" )에 저장된 경로로 저장됨.)
	 * @return
	 * @throws Exception
	 * List<AtchFileVO>
	 */
    public List<FileVO> parseComBannerFileInfo(List<MultipartFile> files, String comBbsNoticeId, int fileKeyParam, String atchFileId, String storePath, String thumbnailCrop) throws Exception {
		
		int fileKey = fileKeyParam;
 
		
		String storePathString = egovframework.com.cmm.service.EgovProperties.getProperty(StringUtils.defaultIfEmpty(storePath, "Globals.bStorePath"));

		File saveFolder = new File(egovframework.com.cmm.EgovWebUtil.filePathBlackList(storePathString));

		if (!saveFolder.exists() || saveFolder.isFile()) {
		    saveFolder.mkdirs();
		}

		//Iterator<MultipartFile> itr = files.iterator();
		

		List<FileVO> result  = new ArrayList<FileVO>();
 

		for(int a=0;files.size()>a ; a++){

			MultipartFile filem = files.get(a);
				//게시판첨부파일 키값 게시물키
				atchFileId = fileSerivce.getFileIdx();
				
				long fleSize = filem.getSize();

				FileVO fvo = getUploadFileInfo1( filem , fileKey , comBbsNoticeId , storePathString , atchFileId , thumbnailCrop);

				if( null != fvo ){
					result.add(fvo);
					++fileKey;		    	
				}
		}
 
 
		return result;
    }
    
    
    /**
	 * 서버의 특정 위치에 파일을 저장하는 역활을 하는 공통 함수</br>
	 * 서버에 저장될 파일명의 명명 규칙 : newName = keyStr + atchFileUtil.getTimeStamp() + fileKey;
	 * @param file : MultipartFile
	 * @param fileKey : 서버에 저장될 파일명 맨뒤에 붙을 순번 값
	 * @param keyStr : 서버에 저장될 파일명 앞에 붙을 prefix 값
	 * @param storePathString : 저장될 서버에서의 경로.
	 * @param atchFileIdString : DB 에서 식별할수있는 PK 값
	 * @return 저장에 사용된 AtchFileVO 객체.
	 * @throws IllegalStateException
	 * @throws IOException
	 * @throws Exception
	 * AtchFileVO
	 */
	private FileVO getUploadFileInfo1(MultipartFile file,
			int fileKey, String comBbsNoticeId , String storePathString, String atchFileIdString, String thumbnailCrop) throws IllegalStateException, IOException, Exception {

		FileVO fvo = null;
		String filePath = "";
	    String orginFileName = file.getOriginalFilename();
	    LOG.debug("#### orginFileName : " + orginFileName );
	    LOG.debug("#### thumbnailCrop : " + thumbnailCrop );
	    //--------------------------------------
	    // 원 파일명이 없는 경우 처리
	    // (첨부가 되지 않은 input file type)
	    //--------------------------------------

	    if ("".equals(orginFileName)) {
	    	return fvo;
	    }

	    String keyStr="";

	    if( this.checkIsFileName(orginFileName) ){

	    	int index = orginFileName.lastIndexOf(".");
	    	//String fileName = orginFileName.substring(0, index);
	    	String fileExt = orginFileName.substring(index + 1);
	    	if(thumbnailCrop == "N"){
		    	String newName = keyStr + this.getTimeStamp() + fileKey;
	
		    	long fleSize = file.getSize();
	
		    	if (!"".equals(orginFileName)) {
		    		filePath = storePathString + File.separator + newName;
		    		file.transferTo(new File(egovframework.com.cmm.EgovWebUtil.filePathBlackList(filePath)));
		    	}
	
		    	fvo = new FileVO();
		    	fvo.setFileExtn(fileExt);
		    	fvo.setFileSavePath(storePathString);
		    	fvo.setFileSize(fleSize);
		    	fvo.setOrgFileName(orginFileName);
		    	fvo.setSaveFileName(newName);
		    	fvo.setThumbnailCrop(thumbnailCrop); //이부분 추가 해주니 됬다..하
		    //	fvo.setBbsFileId(atchFileIdString);
		    //	fvo.setBbsNoticeId(comBbsNoticeId);
		    	LOG.debug("#### AtchFileVO.toString : " + fvo.toString() );
		    	//writeFile(file, newName, storePathString);
		    	return fvo;
	    	}else if(thumbnailCrop == "Y"){
	    		String newName = keyStr + this.getTimeStamp() + fileKey +"."+fileExt;
	    		
		    	long fleSize = file.getSize();
	
		    	if (!"".equals(orginFileName)) {
		    		filePath = storePathString + File.separator + newName;
		    		file.transferTo(new File(egovframework.com.cmm.EgovWebUtil.filePathBlackList(filePath)));
		    	}
	
		    	fvo = new FileVO();
		    	fvo.setFileExtn(fileExt);
		    	fvo.setFileSavePath(storePathString);
		    	fvo.setFileSize(fleSize);
		    	fvo.setOrgFileName(orginFileName);
		    	fvo.setSaveFileName(newName);
		    	fvo.setThumbnailCrop(thumbnailCrop);
		    //	fvo.setBbsFileId(atchFileIdString);
		    //	fvo.setBbsNoticeId(comBbsNoticeId);
		    	LOG.debug("#### AtchFileVO.toString : " + fvo.toString() );
		    	//writeFile(file, newName, storePathString);
		    	return fvo;
	    		
	    	}
	    }
	    return fvo;
	}
}
