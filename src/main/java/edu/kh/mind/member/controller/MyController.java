package edu.kh.mind.member.controller;

import com.google.gson.Gson;
import edu.kh.mind.member.model.service.MyService;
import edu.kh.mind.member.model.vo.EmotionCategory;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

@Controller
@RequestMapping("/my/*")
@SessionAttributes({"loginMember"})
public class MyController {

    @Autowired
    private MyService service;
    

    @RequestMapping("appointment")
    public String appointment(Model model) {

    	model.addAttribute("css", "my");
        return "my/appointment";
    }

    @RequestMapping("appointment/past")
    public String appointmentPast(Model model) {
    	model.addAttribute("css", "my");
        return "my/appointmentPast";
    }

    /**
     * 감정 기록 form
     * @param model
     * @return
     */
    @RequestMapping("emotionDiary")
    public String emotionDiary(Model model) {
        List<EmotionCategory> emotionCategoryList = service.emotionCategory();
        System.out.println(emotionCategoryList);

        model.addAttribute("emotionCategoryList", emotionCategoryList);


    	model.addAttribute("css", "my");

        return "my/emotionDiary";
    }

    @RequestMapping("emotionRecord")
    public String emotionRecord(Model model) {
    	model.addAttribute("css", "my");

        return "my/emotionRecord";
    }

    @GetMapping("counselor")
    public String counselor(Model model){
    	model.addAttribute("css", "my/counselor");
        return "my/counselor";
    }

    @GetMapping("enquiry")
    public String enquiry(Model model){
    	model.addAttribute("css", "my/enquiry");
        return "my/enquiry";
    }

    @GetMapping("letterList")
    public String letterList(Model model){
    	model.addAttribute("css", "my/letterList");
        return "my/letterList";
    }

    @GetMapping("map")
    public String map(Model model){
        model.addAttribute("css", "my/map");
        return "my/map";
    }

    @GetMapping("muteMember")
    public String muteMember(Model model){
        model.addAttribute("css", "my/muteMember");
        return "my/muteMember";
    }

    @GetMapping("myBoardList")
    public String myBoardList(Model model){
        model.addAttribute("css", "my/myBoardList");
        return "my/myBoardList";
    }

    @GetMapping("postscript")
    public String postscript(Model model){
        model.addAttribute("css", "my/postscript");
        return "my/postscript";
    }

    @GetMapping("secession")
    public String secession(Model model){
        model.addAttribute("css", "my/secession");
        return "my/secession";
    }

    @GetMapping("updateMyInfo")
    public String updateMyInfo(Model model){
        model.addAttribute("css", "my/muteMember");
        return "my/updateMyInfo";
    }

    @GetMapping("loadProMap")
    @ResponseBody
    public String loadProMap(){

        List<ProfessionHospital> proList = service.loadProMap();

        for(ProfessionHospital p : proList){
            System.out.println(p);
        }

        return new Gson().toJson(proList);
    }
}
