package edu.kh.mind.member.controller;

import edu.kh.mind.common.util.Util;
import edu.kh.mind.member.model.service.ChatService;
import edu.kh.mind.member.model.vo.ChatJoin;
import edu.kh.mind.member.model.vo.ChatMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class ChatController {

	@Autowired
	private ChatService service;

	@RequestMapping("/chat/room/{reservationNo}")
	public String chatJoin(@PathVariable("reservationNo") int reservationNo, ChatJoin chat, RedirectAttributes ra, Model model) {

		// 회원 번호
		int memberNo = 1;

		// 전문가 번호
		int professionNo = 1;

		// 상담 예약 번호
		reservationNo = 1;

		chat.setMemberNo(memberNo);
		chat.setProfessionNo(professionNo);
		chat.setReservationNo(reservationNo);

		// 채팅방 입장
		List<ChatMessage> list = service.joinChat(chat);
		System.out.println(list);

		if (list != null) {
			model.addAttribute("css", "my");


			model.addAttribute("chat", chat);
			model.addAttribute("list", list);

			return "chatting/chat";
		} else {
			Util.swalSetMessage("해당 채팅방이 존재하지 않습니다.", null, "info", ra);
			return "redirect:/";
		}

	}
}
