package edu.kh.mind.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mind.board.model.service.BoardService;

@Controller
@RequestMapping("/board/*")
@SessionAttributes({"loginMember"})
public class BoardController {

	@Autowired
    private BoardService service;

    @RequestMapping("freeList")
    public String freeBoardList(Model model) {
    	 model.addAttribute("header", "community");
    	 
        return "board/freeList";
    }
    
    @RequestMapping("freeView")
    public String freeBoardView(Model model) {
    	model.addAttribute("header", "community");
    	
    	return "board/freeView";
    }
    
    @RequestMapping("freeInsert")
    public String freeBoardInsert(Model model) {
    	model.addAttribute("header", "community");
    	
    	return "board/freeList";
    }
    
    @RequestMapping("freeUpdate")
    public String freeBoardUpdate(Model model) {
    	model.addAttribute("header", "community");
    	
    	return "board/freeView";
    }
    
    @RequestMapping("freeDelete")
    public String freeBoarDelete(Model model) {
    	model.addAttribute("header", "community");
    	
    	return "board/freeList";
    }



}
