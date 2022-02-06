package edu.kh.mind.selftest;

import com.google.gson.Gson;
import edu.kh.mind.selftest.model.service.SelftestService;
import edu.kh.mind.selftest.model.vo.Selftest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Type;
import java.util.List;

@RestController
@RequestMapping("/selftest/*")
//@SessionAttributes({ "loginMember" })
public class SelftestRestController {


    @Autowired
    private SelftestService service;

    @RequestMapping(value = "selftestQuestion", method = RequestMethod.POST)
    public String selftestForm(Model model, int categoryNo, Selftest selftest){

        model.addAttribute("css", "selftestForm");
        model.addAttribute("header", "main");

//        System.out.println(questionNo);

        selftest.setCategoryNo(categoryNo);


        List<Selftest> selectQ = service.selectQ(selftest);
        System.out.println("List : " + selectQ);



        return new Gson().toJson(selectQ);
    }

    @RequestMapping(value = "mbSelftest", method = RequestMethod.POST)
    public String mbSelftest(Model model) {

        model.addAttribute("css", "mb_selftest");
        model.addAttribute("header", "main");

        return "mbSelftest";
    }

    @RequestMapping(value = "selftestResult", method = RequestMethod.POST)
    public String selftestResult(Model model) {

        model.addAttribute("css", "selftestResult");
        model.addAttribute("header", "main");


        return "selftestResult";
    }


}
