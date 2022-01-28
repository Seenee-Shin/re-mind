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
	//-------- 모바일 댓글창 --------------
	
	@RequestMapping("moblieComment")
    public String mobileCommentView(Model model) {
    	
    	model.addAttribute("css", "board/mobileComment");
    	model.addAttribute("header", "main");
    	 
        return "board/mobilComment";
    }

	//--------------자유게시판--------------------
    @RequestMapping("freeList")
    public String freeBoardList(Model model) {
    	
    	model.addAttribute("css", "board/freeList");
    	model.addAttribute("header", "community");
    	 
        return "board/freeList";
    }
    
    @RequestMapping("freeView")
    public String freeBoardView(Model model) {
    	model.addAttribute("css", "board/freeView");
    	model.addAttribute("header", "community");
    	
    	return "board/freeView";
    }
    
    @RequestMapping("freeInsert")
    public String freeBoardInsert(Model model) {
    	model.addAttribute("css", "board/freeList");
    	model.addAttribute("header", "community");
    	
    	return "board/freeList";
    }
    
    @RequestMapping("freeUpdate")
    public String freeBoardUpdate(Model model) {
    	model.addAttribute("css", "board/update");
    	model.addAttribute("header", "community");
    	
    	return "board/freeView";
    }
    
    @RequestMapping("freeDelete")
    public String freeBoarDelete(Model model) {
    	model.addAttribute("header", "community");
    	model.addAttribute("css", "board/freeList");
    	return "board/freeList";
    }
    
    
    //-----------------고민상담 게시판 ------------------
    @RequestMapping("worryList")
    public String worryBoardList(Model model) {
    	
    	model.addAttribute("css", "board/worryList");
    	model.addAttribute("header", "community");
    	 
        return "board/worryList";
    }
    
    @RequestMapping("worryView")
    public String worryBoardView(Model model) {
    	
    	model.addAttribute("css", "board/worryView");
    	model.addAttribute("header", "community");
    	 
        return "board/worryView";
    }
    
    @RequestMapping("worryUpdate")
    public String worryBoardUpdate(Model model) {
    	model.addAttribute("css", "board/update");
    	model.addAttribute("header", "community");
    	
    	return "board/freeView";
    }
    



}
