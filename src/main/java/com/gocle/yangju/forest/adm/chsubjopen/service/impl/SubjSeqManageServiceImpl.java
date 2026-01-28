package com.gocle.yangju.forest.adm.chsubjopen.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.chsubjopen.service.SubjSeqManageService;
import com.gocle.yangju.forest.adm.chsubjopen.vo.SubjSeqManageVo;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;

@Transactional(rollbackFor = {Exception.class})
@Service(value = "subjSeqManageService")
public class SubjSeqManageServiceImpl extends EgovAbstractServiceImpl implements SubjSeqManageService {
	
	@Autowired
	SubjSeqManageMapper subjSeqManageMapper;
	
	@Autowired
	FileService fileService;
	
	@Override
	public int selectTotalCount(SubjSeqManageVo subjSeqManageVo) throws Exception {
		return subjSeqManageMapper.selectTotalCount(subjSeqManageVo);
	}
	
	@Override
	public List<SubjSeqManageVo> selectList(SubjSeqManageVo subjSeqManageVo) throws Exception {
		return subjSeqManageMapper.selectList(subjSeqManageVo);
	}
	
	@Override
	public SubjSeqManageVo select(SubjSeqManageVo subjSeqManageVo) throws Exception {
		return subjSeqManageMapper.select(subjSeqManageVo);
	}
	
	@Override
	public int insert(SubjSeqManageVo subjSeqManageVo) throws Exception {
		int seqCnt = 0;
		
		// 과정마스터에 등록된 썸네일
		FileVO fvo = new FileVO();
		fvo.setpId(subjSeqManageVo.getSubjCd());
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listProductFile(fvo);
		// 과정마스터에 등록된 첨부파일
		fvo.setThumbnailCrop("N");
		List<FileVO> fileList = fileService.listProductFile(fvo);

		for(int i=0;i<subjSeqManageVo.getSubjNms().length;i++) {
			if(subjSeqManageVo.getSubjNms()[i] != "" && subjSeqManageVo.getSessionNms()[i] != ""
					&& subjSeqManageVo.getEnrollStartDts()[i] != "" && subjSeqManageVo.getEnrollEndDts()[i] != ""
					&& subjSeqManageVo.getCapacitys()[i] != "" && subjSeqManageVo.getWaitEnrollCnts()[i] != ""
					&& subjSeqManageVo.getLearnStartDts()[i] != "" && subjSeqManageVo.getLearnEndDts()[i] != "") {
				String seqCd = subjSeqManageMapper.selectSubjSeqCd(subjSeqManageVo);
				subjSeqManageVo.setSeqCd(seqCd);
				
				if(tFileList != null && !tFileList.isEmpty()) {
					for(FileVO tFile : tFileList) {
						tFile.setFileSn(0);
					}
					fileService.insertProductFile(tFileList, subjSeqManageVo.getSeqCd(), subjSeqManageVo.getSessionMemSeq(), "Y");
				}
				
				if(fileList != null && !fileList.isEmpty()) {
					for(FileVO file : fileList) {
						file.setFileSn(0);
					}
					fileService.insertProductFile(fileList, subjSeqManageVo.getSeqCd(), subjSeqManageVo.getSessionMemSeq(), "N");
				}
				
				subjSeqManageVo.setSubjNm(subjSeqManageVo.getSubjNms()[i]);
        		subjSeqManageVo.setSessionNm(subjSeqManageVo.getSessionNms()[i]);
        		subjSeqManageVo.setEnrollStartDt(subjSeqManageVo.getEnrollStartDts()[i]);
        		subjSeqManageVo.setEnrollEndDt(subjSeqManageVo.getEnrollEndDts()[i]);
        		subjSeqManageVo.setLearnStartDt(subjSeqManageVo.getLearnStartDts()[i]);
        		subjSeqManageVo.setLearnEndDt(subjSeqManageVo.getLearnEndDts()[i]);
        		subjSeqManageVo.setCapacity(subjSeqManageVo.getCapacitys()[i]);
        		subjSeqManageVo.setWaitEnrollCnt(subjSeqManageVo.getWaitEnrollCnts()[i]);
        		
        		subjSeqManageMapper.insert(subjSeqManageVo);
        		seqCnt++;
			}
		}
		
		return seqCnt;
	}
	
	@Override
	public int update(SubjSeqManageVo subjSeqManageVo) throws Exception {
		return subjSeqManageMapper.update(subjSeqManageVo);
	}
	
	@Override
	public int delete(SubjSeqManageVo subjSeqManageVo) throws Exception {
		FileVO fvo = new FileVO();
		fvo.setpId(subjSeqManageVo.getSeqCd());
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listProductFile(fvo);
		if(tFileList != null && !tFileList.isEmpty()) {
			for(FileVO tFile : tFileList) {
				fileService.deleteFile(tFile);
			}
		}
		fvo.setThumbnailCrop("N");
		List<FileVO> fileList = fileService.listProductFile(fvo);
		if(fileList != null && !fileList.isEmpty()) {
			for(FileVO file : fileList) {
				fileService.deleteFile(file);
			}
		}
		return subjSeqManageMapper.delete(subjSeqManageVo);
	}
}
