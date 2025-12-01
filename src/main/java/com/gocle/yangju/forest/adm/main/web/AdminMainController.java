package com.gocle.yangju.forest.adm.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminMainController {

    @RequestMapping(value = "/adm/main.do")
    public String adminIndex(Model model) {
        return "adm/main";
    }
    
    @RequestMapping(value = "/staff/main.do")
    public String staffIndex(Model model) {
        return "staff/main";
    }
}