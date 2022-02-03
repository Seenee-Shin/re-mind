package edu.kh.mind.selftest;

import edu.kh.mind.selftest.model.service.SelftestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/selftest/*")
public class SelftestController {

    private SelftestService service;



    @RequestMapping("selftestForm")
    public String selftestForm(Model model){
    	
    	model.addAttribute("css", "selftestForm");
    	model.addAttribute("header", "main");
    	
        return "/selftestForm";
    }


    @RequestMapping("mbSelftest")
    public String mbSelftest(Model model){
    	
    	model.addAttribute("css", "mb_selftest");
    	model.addAttribute("header", "main");
    	
        return "/mbSelftest";
    }

    @RequestMapping(value = "selftestResult", method = RequestMethod.POST)
    public String selftestResult(Model model){

        model.addAttribute("css", "selftestResult");
        model.addAttribute("header", "main");


        return "/selftestResult";
    }










}
