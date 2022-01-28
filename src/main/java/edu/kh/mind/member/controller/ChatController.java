package edu.kh.mind.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {

	@RequestMapping("/chat/{chatRoomNo}")
	public String chatOpen(@PathVariable("chatRoomNo") int chatRoomNo, Model model) {

		model.addAttribute("css", "my");

		return "chatting/chat";
	}
}
