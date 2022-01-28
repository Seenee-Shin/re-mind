package edu.kh.mind.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/popup/*")
public class PopupController {

	@RequestMapping(value="signUp", method= RequestMethod.GET)
	public String signUp() {
		return "popup/signUp";
	}

	@RequestMapping(value="findPw", method= RequestMethod.GET)
	public String findPw() {
		return "popup/findPw";
	}

	@RequestMapping(value="loginType", method= RequestMethod.GET)
	public String loginType() {
		return "popup/loginType";
	}

	@RequestMapping(value="emailLogin", method= RequestMethod.GET)
	public String emailLogin() {
		return "popup/emailLogin";
	}

}
