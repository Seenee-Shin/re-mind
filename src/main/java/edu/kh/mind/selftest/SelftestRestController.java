package edu.kh.mind.selftest;

import com.google.gson.Gson;
import edu.kh.mind.selftest.model.service.SelftestService;
import edu.kh.mind.selftest.model.vo.Selftest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/selftest/*")
public class SelftestRestController {


    @Autowired
    private SelftestService service;

    @RequestMapping(value = "selftestForm", method = RequestMethod.POST)
    public String selftestForm(Model model, int questionNo){

        model.addAttribute("css", "selftestForm");
        model.addAttribute("header", "main");

        String selectQ = service.selectQ(questionNo);


        return new Gson().toJson(selectQ);
    }

    @RequestMapping(value = "mbSelftest", method = RequestMethod.POST)
    public String mbSelftest(Model model) {

        model.addAttribute("css", "mb_selftest");
        model.addAttribute("header", "main");

        return "/mbSelftest";
    }

    @RequestMapping(value = "selftestResult", method = RequestMethod.POST)
    public String selftestResult(Model model) {

        model.addAttribute("css", "selftestResult");
        model.addAttribute("header", "main");


        return "/selftestResult";
    }


}
