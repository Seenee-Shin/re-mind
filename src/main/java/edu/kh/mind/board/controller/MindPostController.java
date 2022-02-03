package edu.kh.mind.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mind.board.model.service.BoardService;
import edu.kh.mind.board.model.service.MindPostService;

@Controller
@RequestMapping("/post/*")
@SessionAttributes({"loginMember"})
public class MindPostController {

	@Autowired
    private MindPostService service;

    @RequestMapping("list")
    public String MindPostList(Model model) {
    	
    	model.addAttribute("css", "board/mindPost");
    	model.addAttribute("header", "community");
    	 
        return "board/mindPost";
    }
    
    



}
