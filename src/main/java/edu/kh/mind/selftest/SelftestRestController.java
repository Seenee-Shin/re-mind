package edu.kh.mind.selftest;

import com.google.gson.Gson;
import edu.kh.mind.selftest.model.service.SelftestService;
import edu.kh.mind.selftest.model.vo.Selftest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/selftest/*")
public class SelftestRestController {


    @Autowired
    private SelftestService service;

    @RequestMapping(value = "selftestQuestion", method = RequestMethod.POST)
    public Map<String, Object> selftestForm(Model model, int categoryNo, Selftest selftest){

        model.addAttribute("css", "selftestForm");
        model.addAttribute("header", "main");

//        System.out.println(questionNo);

        selftest.setCategoryNo(categoryNo);


        Map<String, Object> selectQ = service.selectQ(selftest);

        System.out.println("List : " + selectQ);



        return selectQ;
    }

    @RequestMapping(value = "mbSelftest", method = RequestMethod.POST)
    public String mbSelftest(Model model) {

        model.addAttribute("css", "mb_selftest");
        model.addAttribute("header", "main");

        return "mbSelftest";
    }

    @RequestMapping(value = "selftestResult", method = RequestMethod.GET)
    public String selftestResult(Model model) {

        model.addAttribute("css", "selftestResult");
        model.addAttribute("header", "main");

        System.out.println(selftestResult(model));

        return "selftestResult";
    }


}
