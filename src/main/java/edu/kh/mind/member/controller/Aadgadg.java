package edu.kh.mind.member.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import edu.kh.mind.HomeController;
import edu.kh.mind.member.model.service.GoogleService;
import edu.kh.mind.member.model.service.KakaoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.HashMap;

@RequestMapping("/oauth_kakao/*")
@Controller
public class Aadgadg {


    @Autowired
    private KakaoService kakaoService;

    @Autowired
    GoogleService googleService;

    @GetMapping("callback")
    public String kakaooLogin(@RequestParam(value = "code", required = false) String code,
                              RedirectAttributes ra){

        ra.addFlashAttribute("code", code);
        System.out.println("#########" + code);
        String access_Token = kakaoService.getAccessToken(code);
        HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
//        System.out.println("###profile_image#### : " + userInfo.get("profile_image"));
        return "redirect:/";
    }

    @PostMapping("callback")
    @ResponseBody
    public String kakaooLogin(){

        return null;
    }







}
