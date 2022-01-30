package edu.kh.mind.member.controller;

import edu.kh.mind.member.model.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/login/*")
public class LoginController {

    @Autowired
    private LoginService service;

    @PostMapping("kakao")
    public String kakaoLogin(String kakaoEmail, String kakaoGender, String kakaonickname){

        if(kakaoGender.equals("male"))  kakaoGender = "남";
        else                            kakaoGender = "여";

        Map map = new HashMap();
        map.put("kakaoEmail", kakaoEmail);
        map.put("kakaoGender", kakaoGender);
        map.put("kakaonickname", kakaonickname);

        System.out.println(map.get("kakaoEmail") + " / " + map.get("kakaoGender") + " / " + map.get("kakaonickname"));

        int result = service.kakaoLogin(map);

        return null;
    }

    @RequestMapping(value = "/loginpage_kakao_callback", method = RequestMethod.GET)
    public String kakaoCallback(){

        return null;
    }



}
