package edu.kh.mind.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.mind.board.model.service.BoardService;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Image;
import edu.kh.mind.common.util.Util;
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
	
    //게시판 리스트 연결
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.GET)
    public String freeBoardList(Model model) {
    	
    	model.addAttribute("css", "board/freeList");
    	model.addAttribute("header", "community");
    	
    	List<Board> freeBoardList = service.selectBoardList();
    	
    	System.out.println(freeBoardList);
    	
        return new Gson().toJson(freeBoardList);
    }
    
	//게시판 글작성 페이지 연결
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String freeBoardinsert(Model model) {
    	model.addAttribute("css", "board/freeList");
    	model.addAttribute("header", "community");
    	
    	return "free/insert";
	}
	
	// 글작성 기능 
	@ResponseBody
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public int freeBoardInsert(Model model, @ModelAttribute("loginMember") Member loginMember, Board board, 
    		List<MultipartFile> images,HttpSession session,RedirectAttributes ra) {
    	
		board.setMemberNo(loginMember.getMemberNo());
		//웹 접근경로(web path), 서버 저장경로(serverPath)
		String webPath = "/resources/images/board/";
		
		String serverPath= session.getServletContext().getRealPath(webPath);
		
		//게시글 작성 후 상세 조회(DB에 입력된 게시글)할 boardNo 
		int result = service.insertFreeBoard(board, images, webPath, serverPath);
		
		if(result > 0) { // insert 성공 
			Util.swalSetMessage("게시글 등록 성공", null, "success", ra);
		}else {
			Util.swalSetMessage("게시글 등록 실패", null, "error", ra);
		}
		
    	return result;
    }
    
	
	
    //게시판 상세조회
    @RequestMapping("view/{boardNo}")
    public String freeBoardView(Model model, @PathVariable("boardNo") int boardNo,
    							RedirectAttributes ra, HttpSession session) {
    	model.addAttribute("css", "board/freeView");
    	model.addAttribute("header", "community");
    	
    	int memberNo= 0;
    	//session에 login member가 있을 경우 
    	
		if(session.getAttribute("loginMember") != null) {
			memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
		}
		
		Board board = service.selectBoard(boardNo,memberNo);
		
		String path =null;
		//조회 결과에 따른 처리
		if(board != null) { 
			//댓글 목록 조회 Service호출 
			//List<Reply> rList = replyService.selectList(boardNo);
			
			//model.addAttribute("rList", rList);
			
			//게시글이 존재할 때 
			model.addAttribute("board",board);
			path = "board/boardView";
			
		}else {
			Util.swalSetMessage("해당 글이 존재하지 않습니다.", null , "info", ra);
			path = "redirect:../list";
		}
		
		return path;
    	
    }
    
    //게시판 글수정 
    @RequestMapping("update/{boardNo}")
    public String freeBoardUpdate(Model model) {
    	model.addAttribute("css", "board/update");
    	model.addAttribute("header", "community");
    	
    	return "free/update";
    }
    
    @RequestMapping("delete")
    public String freeBoarDelete(Model model) {
    	model.addAttribute("header", "community");
    	model.addAttribute("css", "board/freeList");
    	return "free/list";
    }
    
    //예외처리
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		
		//Model : 데이터 전달용 객체(Map형식, request범위)
		
		model.addAttribute("errorMessage", "회원 관련 서비스 이용 중 문제가 발생했습니다.");
		model.addAttribute("e", e);
		
		return "/common/error";
	}
  

}
