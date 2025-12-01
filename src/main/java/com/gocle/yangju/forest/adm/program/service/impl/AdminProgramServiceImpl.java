package com.gocle.yangju.forest.adm.program.service.impl;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocle.yangju.forest.adm.code.service.AdminCodeService;
import com.gocle.yangju.forest.adm.code.vo.CodeVO;
import com.gocle.yangju.forest.adm.program.service.AdminProgramService;
import com.gocle.yangju.forest.adm.program.vo.ProgramVO;
import com.gocle.yangju.forest.adm.time.service.impl.AdminProgramTimeMapper;
import com.gocle.yangju.forest.adm.time.vo.ProgramTimeVO;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.service.impl.FileMapper;
import com.gocle.yangju.forest.comm.file.vo.FileVO;


@Transactional(rollbackFor=Exception.class)
@Service
public class AdminProgramServiceImpl extends EgovAbstractServiceImpl implements AdminProgramService {

	@Autowired
	AdminProgramMapper adminProgramMapper;
	
	@Autowired
	FileMapper fileMapper;
	
	@Autowired
	EgovIdGnrService programIdGnrService;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	AdminCodeService adminCodeService;
	
	@Autowired
	EgovIdGnrService programTimeIdGnrService;
	
	@Autowired
	AdminProgramTimeMapper adminProgramTimeMapper;
	
	@Override
	public List<ProgramVO> selectProgramList(ProgramVO programVO) throws Exception {
		return adminProgramMapper.selectProgramList(programVO);
	}

	@Override
	public int insertProgram(ProgramVO programVO, MultipartHttpServletRequest multiRequest) throws Exception {
		
		programVO.setPgId(programIdGnrService.getNextStringId());
		String programId = programVO.getPgId();
		String regId = programVO.getSessionMemSeq();
		
		String fileUploadPath = "Globals.productFileStorePath";
		String ImgFileUploadPath = "Globals.thumbnailStorePath";
		
		if(null != multiRequest) {
			final List<MultipartFile> fileObj = multiRequest.getFiles("file_atchFileId");
			fileService.saveProductFile(fileObj, programId, regId, fileUploadPath, "N");
			
			if(multiRequest.getFiles("file_thumbFileId") != null) {
				final List<MultipartFile> tFileObj = multiRequest.getFiles("file_thumbFileId");
				fileService.saveProductThumFile(tFileObj, programId, regId, ImgFileUploadPath, "Y");
			}
		}
		int result = adminProgramMapper.insertProgram(programVO);
		
		//목재문화체험 시간표 입력
		if(programVO.getPgType().equals("wood")) {
			CodeVO cvo = new CodeVO();
			List<CodeVO> timeList = null;
			//원데이클래스
			if(programVO.getClassType().equals("ONEDAY")) {
				cvo.setCodeGroup("ONEDAY_TIME_SLOT");
				timeList = adminCodeService.selectCodeList(cvo);
			}
			//유치원
			if(programVO.getClassType().equals("CHILD")) {
				cvo.setCodeGroup("CHILD_TIME_SLOT");
				timeList = adminCodeService.selectCodeList(cvo);
			}
			if(timeList != null) {
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				LocalDate startDate = LocalDate.parse(programVO.getStartDate(), formatter);
				LocalDate endDate = LocalDate.parse(programVO.getEndDate(), formatter);
				for (LocalDate date = startDate; !date.isAfter(endDate); date = date.plusDays(1)) {
					if(date.getDayOfWeek() == DayOfWeek.SUNDAY || date.getDayOfWeek() == DayOfWeek.MONDAY) {
						//공휴일 체크 필요시 추가
						continue;
					}
					for(int i=0; i<timeList.size(); i++) {
						String[] times = timeList.get(i).getCodeName().split("~");
						ProgramTimeVO ptVO = new ProgramTimeVO();
						ptVO.setSlotId(programTimeIdGnrService.getNextStringId());
						ptVO.setSlotNo(i+1);
						ptVO.setPgId(programVO.getPgId());
						ptVO.setSlotDate(date.toString());
						ptVO.setStartTime(LocalTime.parse(times[0]));
						ptVO.setEndTime(LocalTime.parse(times[1]));
						ptVO.setCapacity(programVO.getCapacity());//프로그램 기본정원으로 세팅
						adminProgramTimeMapper.insertSlot(ptVO);
					}
				}
			}
		}
		
		return result;
	}

	@Override
	public ProgramVO selectProgram(ProgramVO programVO) throws Exception {
		return adminProgramMapper.selectProgram(programVO);
	}

	@Override
	public int updateProgram(ProgramVO programVO, MultipartHttpServletRequest multiRequest) throws Exception {
		
		String programId = programVO.getPgId();
		String regId = programVO.getSessionMemSeq();
		String fileUploadPath = "Globals.productFileStorePath";
		String ImgFileUploadPath = "Globals.thumbnailStorePath";
		
		if(null != multiRequest) {
			final List<MultipartFile> fileObj = multiRequest.getFiles("file_atchFileId");
			fileService.saveProductFile(fileObj, programId, regId, fileUploadPath, "N");
			
			if(multiRequest.getFiles("file_thumbFileId") != null) {
				final List<MultipartFile> tFileObj = multiRequest.getFiles("file_thumbFileId");
				fileService.saveProductThumFile(tFileObj, programId, regId, ImgFileUploadPath, "Y");
			}
		}
		int result = adminProgramMapper.updateProgram(programVO);
		
		if(result > 0 && "wood".equals(programVO.getPgType())) {
	        adminProgramTimeMapper.deleteByPgId(programId);

	        CodeVO cvo = new CodeVO();
	        List<CodeVO> timeList = null;
	        
	        if("ONEDAY".equals(programVO.getClassType())) {
	            cvo.setCodeGroup("ONEDAY_TIME_SLOT");
	            timeList = adminCodeService.selectCodeList(cvo);
	        } else if("CHILD".equals(programVO.getClassType())) {
	            cvo.setCodeGroup("CHILD_TIME_SLOT");
	            timeList = adminCodeService.selectCodeList(cvo);
	        }
	        
	        if(timeList != null) {
	        	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		        LocalDate startDate = LocalDate.parse(programVO.getStartDate(), formatter);
		        LocalDate endDate = LocalDate.parse(programVO.getEndDate(), formatter);

		        for (LocalDate date = startDate; !date.isAfter(endDate); date = date.plusDays(1)) {
		            if(date.getDayOfWeek() == DayOfWeek.SUNDAY || date.getDayOfWeek() == DayOfWeek.MONDAY) {
		                //공휴일 체크 필요시 추가
		                continue;
		            }

		            for(int i=0; i<timeList.size(); i++) {
		                String[] times = timeList.get(i).getCodeName().split("~");

		                ProgramTimeVO ptVO = new ProgramTimeVO();
		                ptVO.setSlotId(programTimeIdGnrService.getNextStringId());
		                ptVO.setSlotNo(i+1);
		                ptVO.setPgId(programId);
		                ptVO.setSlotDate(date.toString());
		                ptVO.setStartTime(LocalTime.parse(times[0]));
		                ptVO.setEndTime(LocalTime.parse(times[1]));
		                ptVO.setCapacity(programVO.getCapacity()); // 정원은 프로그램 기본 정원으로
		                adminProgramTimeMapper.insertSlot(ptVO);
		            }
		        }
	        }
	    }
		
		return result;
	}

	@Override
	public int deleteProgram(ProgramVO programVO) throws Exception {
		return adminProgramMapper.deleteProgram(programVO);
	}

	@Override
	public int copyProgram(ProgramVO programVO) throws Exception {

		String cpProgramId = programIdGnrService.getNextStringId();
		programVO.setPgId(cpProgramId);
		programVO.setPgName("[복사본]" + programVO.getPgName());
		programVO.setStatus("WAIT");
		
		FileVO fvo = new FileVO();
		fvo.setpId(programVO.getPgId());
		fvo.setThumbnailCrop("N");
		List<FileVO> fileList = fileService.listProductFile(fvo);

		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listProductFile(fvo);
		
		for (FileVO file : fileList) {
		    FileVO copyFile = new FileVO();
		    copyFile.setAtchFileIdx(fileMapper.getFileIdx());
		    copyFile.setpId(cpProgramId);
		    copyFile.setFileSavePath(file.getFileSavePath());
		    copyFile.setSaveFileName(file.getSaveFileName());
		    copyFile.setOrgFileName(file.getOrgFileName());
		    copyFile.setFileSize(file.getFileSize());
		    copyFile.setFileExtn(file.getFileExtn());;
		    copyFile.setThumbnailCrop("N");
		    fileMapper.insertFile(copyFile);
		}

		for (FileVO file : tFileList) {
		    FileVO copyFile = new FileVO();
		    copyFile.setAtchFileIdx(fileMapper.getFileIdx());
		    copyFile.setpId(cpProgramId);
		    copyFile.setFileSavePath(file.getFileSavePath());
		    copyFile.setSaveFileName(file.getSaveFileName());
		    copyFile.setOrgFileName(file.getOrgFileName());
		    copyFile.setFileSize(file.getFileSize());
		    copyFile.setFileExtn(file.getFileExtn());;
		    copyFile.setThumbnailCrop("Y");
		    fileMapper.insertFile(copyFile);
		}
		int result = adminProgramMapper.insertProgram(programVO);
		
		return result;
	}

	@Override
	public List<ProgramVO> locationList(ProgramVO programVO) throws Exception {
		return adminProgramMapper.locationList(programVO);
	}

	@Override
	public int peopleCnt(ProgramVO programVO) throws Exception {
		return adminProgramMapper.peopleCnt(programVO);
	}

}
