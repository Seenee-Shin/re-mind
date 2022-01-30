package edu.kh.mind.member.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/oauth_kakao/*")
public class Aadgadg {

    @GetMapping("callback")
    public String kakaooLogin(@RequestParam("code") String code){

        System.out.println(code);
        return null;
    }
}
