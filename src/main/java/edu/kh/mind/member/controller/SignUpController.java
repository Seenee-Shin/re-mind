package edu.kh.mind.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.mind.member.model.service.SignUpService;


@Controller
@RequestMapping("/signUp/*")
public class SignUpController {

    @Autowired
    private SignUpService service;
    
}