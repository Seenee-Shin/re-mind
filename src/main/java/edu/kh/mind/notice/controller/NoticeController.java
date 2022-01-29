package edu.kh.mind.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mind.notice.model.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
@SessionAttributes({"loginMember"})
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping("list")
	public String noticeList(Model model) {
		
		model.addAttribute("css", "notice/noticeList");
		
		return "notice/noticeList";
	}
	
	@RequestMapping("view")
	public String noticeView(Model model) {
		
		model.addAttribute("css", "notice/noticeView");
		
		return "notice/noticeView";
	}

}
