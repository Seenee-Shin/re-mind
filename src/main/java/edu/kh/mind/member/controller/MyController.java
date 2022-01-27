package edu.kh.mind.member.controller;

import edu.kh.mind.member.model.service.MyService;
import org.springframework.stereotype.Controller;
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
}
