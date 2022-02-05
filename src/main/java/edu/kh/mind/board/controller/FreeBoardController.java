package edu.kh.mind.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import edu.kh.mind.board.model.service.BoardService;
import edu.kh.mind.member.model.vo.Member;

@Controller
@RequestMapping("/free/*")
@SessionAttributes({"loginMember"})
public class FreeBoardController {

	@Autowired
    private BoardService service;
	//-------- 모바일 댓글창 --------------
	
	@RequestMapping("mobileComment")
    public String mobileCommentView(Model model) {
    	
    	model.addAttribute("css", "board/mobileComment"); //각 페이지 css 추가 태그 
    	model.addAttribute("header", "main"); //헤더구분 사이드메뉴가 없는 페이지일 경우 main작성  
    	 
        return "board/mobileComment";
    }

	//--------------자유게시판--------------------
	
    @RequestMapping("list")
    public String freeBoardList(Model model) {
    	
    	model.addAttribute("css", "board/freeList");
    	model.addAttribute("header", "community");
    	
        return "free/list";
    }
    
    @RequestMapping(value = "freeinsert", method = RequestMethod.POST)
    public String freeBoardInsert(Model model, @ModelAttribute("loginMember") Member loginMember) {
    	
    	return null;
    }
    
    @RequestMapping("freeView/{boardNo}")
    public String freeBoardView(Model model, @PathVariable("boardNo") int boardNo) {
    	model.addAttribute("css", "board/freeView");
    	model.addAttribute("header", "community");
    	
    	return null;
    }
    
    
    @RequestMapping("freeUpdate")
    public String freeBoardUpdate(Model model) {
    	model.addAttribute("css", "board/update");
    	model.addAttribute("header", "community");
    	
    	return "free/update";
    }
    
    @RequestMapping("freeDelete")
    public String freeBoarDelete(Model model) {
    	model.addAttribute("header", "community");
    	model.addAttribute("css", "board/freeList");
    	return "free/list";
    }
    
  

}
