package edu.kh.mind.google;

import edu.kh.mind.member.social.google.GoogleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class GoogleLoginController {

    @Autowired
    GoogleService googleService;


	/*@RequestMapping(value = "/mind", method = RequestMethod.GET)
	public String googleAuth(Model model, @RequestParam(value = "code") String authCode, HttpServletRequest req){
        //HTTP Request를 위한 RestTemplate
        RestTemplate restTemplate = new RestTemplate();

        //Google OAuth Access Token 요청을 위한 파라미터 세팅
        GoogleOAuthRequest googleOAuthRequestParam =  new GoogleOAuthRequest();
        googleOAuthRequestParam.setClientId("251812285867-osc8dhqrlc0f5tu31kiike62ehrro734.apps.googleusercontent.com");
        googleOAuthRequestParam.setClientSecret("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");
        googleOAuthRequestParam.setCode(authCode);
        googleOAuthRequestParam.setRedirectUri("http://localhost:8080/mind");
        googleOAuthRequestParam.setGrantType("authorization_code");

        //JSON 파싱을 위한 기본값 세팅
        //요청시 파라미터는 스네이크 케이스로 세팅되므로 Object mapper에 미리 설정해준다.
        ObjectMapper mapper = new ObjectMapper();
        mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);

        //AccessToken 발급 요청
        ResponseEntity<String> resultEntity = restTemplate.postForEntity("https://oauth2.googleapis.com/token", googleOAuthRequestParam, String.class);

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

        return "/mind";
	}*/

}