package com.gocle.yangju.forest.adm.chsubj.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.chsubj.service.impl.SubjCateManageMapper;
import com.gocle.yangju.forest.adm.chsubj.service.SubjCateManageService;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageVo;



@Transactional(rollbackFor = {Exception.class})
@Service(value = "subjCateManageService")
public class SubjCateManageServiceImpl extends EgovAbstractServiceImpl implements SubjCateManageService {

	@Autowired
	SubjCateManageMapper subjCateManageMapper;

	@Override
	public List<SubjCateManageVo> selectList(SubjCateManageVo subjCateManageVo) throws Exception {
		
		return subjCateManageMapper.selectList(subjCateManageVo);
	}

	@Override
	public Integer selectNextSortOrder(SubjCateManageVo subjCateManageVo) throws Exception {
		
		return subjCateManageMapper.selectNextSortOrder(subjCateManageVo);
	}

	@Override
	public SubjCateManageVo selectUpper(SubjCateManageVo subjCateManageVo) throws Exception {
		
		return subjCateManageMapper.selectUpper(subjCateManageVo);
	}

	@Override
	public int insert(SubjCateManageVo subjCateManageVo) throws Exception {
		
		SubjCateManageVo upperDataMap = subjCateManageMapper.selectUpper(subjCateManageVo.getSgrCd(), subjCateManageVo.getUpperCateCd());
        if (subjCateManageVo.getCatePath() == null || subjCateManageVo.getCatePath().equals("")) {
            if (upperDataMap != null) {
                subjCateManageVo.setCatePath(upperDataMap.getCateCd() + "/" + subjCateManageVo.getCateCd());
            }
            else {
                subjCateManageVo.setCatePath("/" + subjCateManageVo.getSgrCd() + "/" + subjCateManageVo.getCateCd());
            }
        }
		
		return subjCateManageMapper.insert(subjCateManageVo);
	}

	@Override
	public SubjCateManageVo select(SubjCateManageVo subjCateManageVo) throws Exception {
		
		return subjCateManageMapper.select(subjCateManageVo);
	}
	
	@Override
	public int update(SubjCateManageVo subjCateManageVo) throws Exception {
		
		return subjCateManageMapper.update(subjCateManageVo);
	}

	@Override
	public int delete(SubjCateManageVo subjCateManageVo) throws Exception {
		
		return subjCateManageMapper.delete(subjCateManageVo);
	}
	
}
