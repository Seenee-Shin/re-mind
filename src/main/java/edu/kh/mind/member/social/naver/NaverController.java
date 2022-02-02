package edu.kh.mind.member.social.naver;


import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.scribejava.core.model.OAuth2AccessToken;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/naver/*")
public class NaverController {

    private String CLIENT_ID = "bCW4VaBNrrKJO0dNnbwX"; //애플리케이션 클라이언트 아이디값";
    private String CLI_SECRET = "XWBByOkfMf"; //애플리케이션 클라이언트 시크릿값";

    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;

    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "naverlogin", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public String login(HttpSession session) {

        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

        System.out.println("============== Naver OAuth2 URI ==============");
        System.out.println(naverAuthUrl);

        return naverAuthUrl;
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam(value = "code", required = false) String code,
                           @RequestParam String state,
                           HttpSession session) throws IOException {
        System.out.println("============== callback ==============");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        System.out.println("[AccessToken : " + oauthToken.getAccessToken() + "]");
        System.out.println("[RefreshToken : " + oauthToken.getRefreshToken() + "]");

//        naverLoginBO.getNaverAccessToken(session, code, state);

        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        model.addAttribute("result", apiResult);
        System.out.println("result"+apiResult);

        return "socialSuccess";
    }


}
