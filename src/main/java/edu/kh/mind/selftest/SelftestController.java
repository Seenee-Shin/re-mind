package edu.kh.mind.selftest;

import edu.kh.mind.selftest.model.service.SelftestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/selftest/*")
public class SelftestController {

    @Autowired
    private SelftestService service;



    @RequestMapping(value = "selftestForm", method = RequestMethod.GET)
    public String selftestForm(Model model, String type){
	    System.out.println(type);

    	model.addAttribute("css", "selftestForm");
    	model.addAttribute("header", "main");
		model.addAttribute("type", type);
    	
        return "selftest/selftestForm";
    }



}
