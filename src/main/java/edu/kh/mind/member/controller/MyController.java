package edu.kh.mind.member.controller;

import edu.kh.mind.member.model.service.MyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/my/*")
@SessionAttributes({"loginMember"})
public class MyController {

    private MyService service;

    @RequestMapping("appointment")
    public String appointment() {

        return "my/appointment";
    }

    @RequestMapping("appointment/past")
    public String appointmentPast() {

        return "my/appointmentPast";
    }

    @RequestMapping("emotionDiary")
    public String emotionDiary() {

        return "my/emotionDiary";
    }

    @RequestMapping("emotionRecord")
    public String emotionRecord() {

        return "my/emotionRecord";
    }

    @GetMapping("counselor")
    public String counselor(){
        return "my/counselor";
    }

    @GetMapping("enquiry")
    public String enquiry(){
        return "my/enquiry";
    }

    @GetMapping("letterList")
    public String letterList(){
        return "my/letterList";
    }

    @GetMapping("map")
    public String map(){
        return "my/map";
    }

    @GetMapping("muteMember")
    public String muteMember(){
        return "my/muteMember";
    }

    @GetMapping("myBoardList")
    public String myBoardList(){
        return "my/myBoardList";
    }

    @GetMapping("postscript")
    public String postscript(){
        return "my/postscript";
    }

    @GetMapping("secession")
    public String secession(){
        return "my/secession";
    }

    @GetMapping("updateMyInfo")
    public String updateMyInfo(){
        return "my/updateMyInfo";
    }
}
