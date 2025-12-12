package com.gocle.yangju.forest.adm.chsubj.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.chsubj.service.SubjManageService;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjManageVo;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;

@Transactional(rollbackFor = {Exception.class})
@Service(value = "subjManageService")
public class SubjManageServiceImpl extends EgovAbstractServiceImpl implements SubjManageService {
	
	@Autowired
	SubjManageMapper subjManageMapper;
	
	@Autowired
	FileService fileService;
	
	@Override
	public int selectTotalCount(SubjManageVo subjManageVo) throws Exception {
		return subjManageMapper.selectTotalCount(subjManageVo);
	}
	
	@Override
	public List<SubjManageVo> selectList(SubjManageVo subjManageVo) throws Exception {
		return subjManageMapper.selectList(subjManageVo);
	}
	
	@Override
	public int insert(SubjManageVo subjManageVo) throws Exception {
		String subjCd = subjManageMapper.selectSubjCd(subjManageVo);
		subjManageVo.setSubjCd(subjCd);
		return subjManageMapper.insert(subjManageVo);
	}
	
	@Override
	public SubjManageVo select(SubjManageVo subjManageVo) throws Exception {
		return subjManageMapper.select(subjManageVo);
	}
	
	@Override
	public int update(SubjManageVo subjManageVo) throws Exception {
		return subjManageMapper.update(subjManageVo);
	}
	
	@Override
	public int delete(SubjManageVo subjManageVo) throws Exception {
		FileVO fvo = new FileVO();
		fvo.setpId(subjManageVo.getSubjCd());
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listProductFile(fvo);
		if(tFileList != null && !tFileList.isEmpty()) {
			for(FileVO tFile : tFileList) {
				fileService.deleteFile(tFile);
			}
		}
		return subjManageMapper.delete(subjManageVo);
	}
}
