package edu.kh.mind.member.controller;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import edu.kh.mind.member.model.service.KakaoService;
import edu.kh.mind.member.model.vo.GoogleOAuthRequest;
import edu.kh.mind.member.model.vo.GoogleOAuthResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/oauth_kakao/*")
@Controller
public class Aadgadg {

    @Autowired
    private KakaoService kakaoService;


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


    @RequestMapping(value = "googleLogin", method = RequestMethod.GET)
    public String googleAuth(Model model, @RequestParam(value = "code") String authCode, HttpServletRequest request)
            throws Exception {

        //HTTP Request를 위한 RestTemplate
        RestTemplate restTemplate = new RestTemplate();

        //Google OAuth Access Token 요청을 위한 파라미터 세팅
        GoogleOAuthRequest googleOAuthRequestParam =  new GoogleOAuthRequest();
        googleOAuthRequestParam.setCode(authCode);
        googleOAuthRequestParam.setClientId("251812285867-iarbblabr07shf2kvjjmuaoa3tuv6n8r.apps.googleusercontent.com");
        googleOAuthRequestParam.setClientSecret("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");
        googleOAuthRequestParam.setRedirectUri("http://localhost:9000/mind/oauth_kakao/googleLogin");
        googleOAuthRequestParam.setGrantType("authorization_code");

        //JSON 파싱을 위한 기본값 세팅
        //요청시 파라미터는 스네이크 케이스로 세팅되므로 Object mapper에 미리 설정해준다.
        ObjectMapper mapper = new ObjectMapper();
        mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
//        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);

        //AccessToken 발급 요청
        ResponseEntity<String> resultEntity = restTemplate.postForEntity("https://www.googleapis.com/oauth2/v4/token", googleOAuthRequestParam, String.class);
        System.out.println("resultEntity : " + resultEntity);
        //https://oauth2.googleapis.com/token
        // https://accounts.google.com/o/oauth2/token
        // https://www.googleapis.com/oauth2/v4/token

        //Token Request
        GoogleOAuthResponse result = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleOAuthResponse>() {
        });

        //ID Token만 추출 (사용자의 정보는 jwt로 인코딩 되어있다)
        String jwtToken = result.getIdToken();
        String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo").queryParam("id_token", jwtToken).toUriString();

        String resultJson = restTemplate.getForObject(requestUrl, String.class);

        Map<String,String> userInfo = mapper.readValue(resultJson, new TypeReference<Map<String, String>>(){});
        model.addAllAttributes(userInfo);
        model.addAttribute("token", result.getAccessToken());

        System.out.println("userInfo : " + userInfo);
        System.out.println("AccessToken : " + result.getAccessToken());
        System.out.println("code : " + googleOAuthRequestParam.getCode());
        System.out.println("AccessType : " + googleOAuthRequestParam.getAccessType());
        System.out.println("GrantType : " + googleOAuthRequestParam.getGrantType());
        System.out.println("refreshToken : " + result.getRefreshToken());
        // refreshToken 재발급 하려면 access권한 삭제해야함
        // https://developers.google.com/identity/gsi/web/guides/revoke

        return "common/main";
    }


}
