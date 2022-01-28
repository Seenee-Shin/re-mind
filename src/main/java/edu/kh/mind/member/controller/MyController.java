package edu.kh.mind.member.controller;

import edu.kh.mind.member.model.service.MyService;
import org.springframework.stereotype.Controller;
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

}
