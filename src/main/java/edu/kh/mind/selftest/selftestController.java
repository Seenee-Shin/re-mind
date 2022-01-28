package edu.kh.mind.selftest;

import edu.kh.mind.selftest.model.service.selftestService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/selftest/*")
public class selftestController {

    private selftestService service;

    @RequestMapping("selftestForm")
    public String selftestForm(){

        return "/selftest/selftestForm";

    }










}
