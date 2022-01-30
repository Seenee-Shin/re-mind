package edu.kh.mind.selftest;

import edu.kh.mind.selftest.model.service.selftestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/selftest/*")
public class selftestController {

    private selftestService service;



    @RequestMapping("selftestForm")
    public String selftestForm(Model model){
    	
    	model.addAttribute("css", "selftestForm");
    	model.addAttribute("header", "main");
    	
        return "selftest/selftestForm";
    }


    @RequestMapping("mbSelftest")
    public String mbSelftest(Model model){
    	
    	model.addAttribute("css", "selftestResult");
    	model.addAttribute("header", "main");
    	
        return "selftest/mbSelftest";
    }

    @RequestMapping(value = "selftestResult", method = RequestMethod.POST)
    public String selftestResult(){

        return "selftestResult";
    }










}
