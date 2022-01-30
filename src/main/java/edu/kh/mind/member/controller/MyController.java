package edu.kh.mind.member.controller;

import edu.kh.mind.member.model.service.MyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/my/*")
@SessionAttributes({"loginMember"})
public class MyController {

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

    @RequestMapping("emotionDiary")
    public String emotionDiary(Model model) {
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
    	model.addAttribute("css", "my/enquiry");
        return "my/letterList";
    }

    @GetMapping("map")
    public String map(Model model){
        return "my/map";
    }

    @GetMapping("muteMember")
    public String muteMember(Model model){
        return "my/muteMember";
    }

    @GetMapping("myBoardList")
    public String myBoardList(Model model){
        return "my/myBoardList";
    }

    @GetMapping("postscript")
    public String postscript(Model model){
        return "my/postscript";
    }

    @GetMapping("secession")
    public String secession(Model model){
        return "my/secession";
    }

    @GetMapping("updateMyInfo")
    public String updateMyInfo(Model model){
        return "my/updateMyInfo";
    }
}
