package com.gocle.yangju.forest.adm.chsubj.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gocle.yangju.forest.adm.chsubj.service.impl.SubjCateManageMapper;
import com.gocle.spring.vo.OrderVo;
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
		
		SubjCateManageVo upperDataMap = subjCateManageMapper.selectUpper(subjCateManageVo);
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

	@Override
	public String orderSave(OrderVo orderVo) throws Exception {
		
		if ("".equals(this.dataSetTableInfo(orderVo).getTableNm()) || null == this.dataSetTableInfo(orderVo).getTableNm()) {
            return "정렬 저장이 실패했습니다.";
       }
       else {
           OrderVo insertVo = null;
           int orderSize = orderVo.getOrder().length;
           for(int i=0; i < orderSize;i++) {
               insertVo = new OrderVo();
               insertVo = this.dataSetTableInfo(insertVo);
               orderVo.setOrderNo(orderVo.getOrder()[i]);
               orderVo.setSortNo(orderVo.getSortKey()[i]);
               subjCateManageMapper.orderUpdate(orderVo);
           }

           return "저장되었습니다.";
       }
	}
	
	private OrderVo dataSetTableInfo(OrderVo orderVo) {
        if ("trustContLesson".equals(orderVo.getTbnm())) {
            orderVo.setTableNm("TB_CONT_LESSON");
            orderVo.setColumnNm("trust_order");
            orderVo.setKeyNm("cont_les_seqno");
        }
        else if ("sysCate".equals(orderVo.getTbnm())){
            orderVo.setTableNm("TB_SYS_CATE");
            orderVo.setColumnNm("sort_order");
            orderVo.setKeyNm("cate_cd");
        }
        else if ("subjCate".equals(orderVo.getTbnm())){
            orderVo.setTableNm("TB_SUBJ_CATE");
            orderVo.setColumnNm("sort_order");
            orderVo.setKeyNm("cate_cd");
        }
        else if ("contLesson".equals(orderVo.getTbnm())){
            orderVo.setTableNm("TB_CONT_LESSON");
            orderVo.setColumnNm("cont_les_order");
            orderVo.setKeyNm("cont_les_seqno");
        }
        // 전문강사 단계 관리 추가
        else if ("subjCateSub".equals(orderVo.getTbnm())){
            orderVo.setTableNm("TB_SUBJ_CATE_SUB");
            orderVo.setColumnNm("sort_order");
            orderVo.setKeyNm("cate_cd_sub");
        }

        return orderVo;
    }
	
}
