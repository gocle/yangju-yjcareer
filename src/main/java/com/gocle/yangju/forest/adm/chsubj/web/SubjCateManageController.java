package com.gocle.yangju.forest.adm.chsubj.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.spring.vo.OrderVo;
import com.gocle.yangju.forest.adm.chsgr.service.SgrManageService;
import com.gocle.yangju.forest.adm.chsgr.vo.SgrManageDefaultVo;
import com.gocle.yangju.forest.adm.chsgr.vo.SgrManageVo;
import com.gocle.yangju.forest.adm.chsubj.service.SubjCateManageService;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageDefaultVo;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageVo;

@RequestMapping(value = "/adm/chsubj")
@Controller(value = "subjCateManageController")
public class SubjCateManageController {

	@Autowired
    SubjCateManageService subjCateManageService;

	@Autowired
    SgrManageService sgrManageService;

    /**
     * 과정 분류 목록을 조회합니다.
     *
     * @param subjCateManageVo
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "SubjCateManageList.do")
    public String selectSubjCateManageList(@ModelAttribute("subjCateManageVo") SubjCateManageVo subjCateManageVo,
    		ModelMap model, HttpSession session) throws Exception {

        SgrManageVo sgrManageVo = new SgrManageVo();
        sgrManageVo.setSearchSgrCd(subjCateManageVo.getSearchSgrCd());
        
        model.addAttribute("sgrManageList", this.sgrManageService.selectList(sgrManageVo)); // 교육사이트 목록
        model.addAttribute("resultList", this.subjCateManageService.selectList(subjCateManageVo));

        return "/adm/chsubj/SubjCateManageList";
    }
    
    /**
     * 과정 분류 등록 화면을 출력합니다.
     *
     * @param subjCateManageVo
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "SubjCateManageInsertForm.do")
    public String selectSubjCateManageForm(@ModelAttribute("subjCateManageVo") SubjCateManageVo subjCateManageVo,ModelMap model) throws Exception {

        SgrManageVo sgrManageVo = new SgrManageVo();
        sgrManageVo.setSgrCd(subjCateManageVo.getSgrCd());
        SgrManageVo sgrMap = this.sgrManageService.select(sgrManageVo);

        Map<String, Object> resultMap = new HashMap<>();

        resultMap.put("sortOrder", this.subjCateManageService.selectNextSortOrder(subjCateManageVo)); // 다음 순서

        SubjCateManageVo resultUpperMap = this.subjCateManageService.selectUpper(subjCateManageVo);
        
        model.addAttribute("sgrMap", sgrMap);
        model.addAttribute("resultUpperMap", resultUpperMap);
        model.addAttribute("resultMap", resultMap);
        model.addAttribute("cmd", "Insert");

        return "adm/chsubj/SubjCateManageForm";
    }
    
    @RequestMapping(value = "SubjCateManageUpdateForm.do")
    public String selectSubjCateManageUpdateForm(@ModelAttribute("subjCateManageVo") SubjCateManageVo subjCateManageVo,
            @ModelAttribute("searchVo") SubjCateManageDefaultVo searchVo, ModelMap model) throws Exception {
        SgrManageVo sgrManageVo = new SgrManageVo();
        sgrManageVo.setSgrCd(subjCateManageVo.getSgrCd());
        SgrManageVo sgrMap = this.sgrManageService.select(sgrManageVo);

        SubjCateManageVo resultMap = this.subjCateManageService.select(subjCateManageVo);

        SubjCateManageVo resultUpperMap = this.subjCateManageService.selectUpper(subjCateManageVo);
        
        model.addAttribute("sgrMap", sgrMap);
        model.addAttribute("resultMap", resultMap);
        model.addAttribute("resultUpperMap", resultUpperMap);
        model.addAttribute("cmd", "Update");

        return "adm/chsubj/SubjCateManageForm";
    }
    
    @RequestMapping(value = "SubjCateManageInsert.do", method = RequestMethod.POST)
    public String insertSubjCateManage(
            @ModelAttribute("subjCateManageVo") SubjCateManageVo subjCateManageVo,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            SessionStatus status) throws Exception {

        int result = subjCateManageService.insert(subjCateManageVo);

        String retMsg;
        if (result > 0) {
            retMsg = "등록되었습니다.";
            status.setComplete();
        } else {
            retMsg = "등록에 실패했습니다.";
        }

        redirectAttributes.addFlashAttribute("retMsg", retMsg);
        
        return "redirect:/adm/chsubj/SubjCateManageList.do";
    }
    
    @RequestMapping(value = "SubjCateManageUpdate.do", method = RequestMethod.POST)
    public String updateSubjCateManage(
            @ModelAttribute("subjCateManageVo") SubjCateManageVo subjCateManageVo,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            SessionStatus status) throws Exception {

        int result = subjCateManageService.update(subjCateManageVo);

        String retMsg;
        if (result > 0) {
            retMsg = "수정되었습니다.";
            status.setComplete();
        } else {
            retMsg = "수정에 실패했습니다.";
        }

        redirectAttributes.addFlashAttribute("retMsg", retMsg);
        
        return "redirect:/adm/chsubj/SubjCateManageList.do";
    }
    
    @RequestMapping(value = "SubjCateManageDelete.do", method = RequestMethod.POST)
    public String deleteSubjCateManage(
            @ModelAttribute("subjCateManageVo") SubjCateManageVo subjCateManageVo,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            SessionStatus status) throws Exception {
    	
        int result = subjCateManageService.delete(subjCateManageVo);

        String retMsg;
        if (result > 0) {
            retMsg = "삭제되었습니다.";
            status.setComplete();
        } else {
            retMsg = "삭제에 실패했습니다.";
        }

        redirectAttributes.addFlashAttribute("retMsg", retMsg);
        
        return "redirect:/adm/chsubj/SubjCateManageList.do";
    }
    
    
    @RequestMapping(value = "OrderUpdate.do", method = RequestMethod.POST)
    public String orderUpdate(
    		@ModelAttribute("orderVo") OrderVo orderVo,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            SessionStatus status) throws Exception {
    	
    	System.out.println("111111111111");
    	System.out.println(orderVo);
    	System.out.println(orderVo.getOrderNo());
    	System.out.println(orderVo.getOrder());
    	
    	String result = subjCateManageService.orderSave(orderVo);

        redirectAttributes.addFlashAttribute("retMsg", result);
        
        return "redirect:/adm/chsubj/SubjCateManageList.do";
    }
}
