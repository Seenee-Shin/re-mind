package edu.kh.mind.member.controller;

import edu.kh.mind.member.model.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ChatController {

	@Autowired
	private ChatService service;

	@RequestMapping("/chat/{chatRoomNo}")
	public String chatJoin(@PathVariable("chatRoomNo") int chatRoomNo, RedirectAttributes ra, Model model) {

//		List<Chat service.chatJoin();

		model.addAttribute("css", "my");

		return "chatting/chat";
	}
}
