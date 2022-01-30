package edu.kh.mind.selftest;

import edu.kh.mind.selftest.model.service.SelftestService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/selftest/*")
public class SelftestController {

    private SelftestService service;



    @RequestMapping("selftestForm")
    public String selftestForm(){

        return "selftest/selftestForm";
    }


    @RequestMapping("mbSelftest")
    public String mbSelftest(){

        return "selftest/mbSelftest";
    }

    @RequestMapping(value = "selftestResult", method = RequestMethod.POST)
    public String selftestResult(){

        return "selftestResult";
    }










}
