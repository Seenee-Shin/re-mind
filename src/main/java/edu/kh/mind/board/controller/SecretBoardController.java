package edu.kh.mind.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.mind.board.model.service.ReplyService;
import edu.kh.mind.board.model.service.SecretService;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Reply;
import edu.kh.mind.board.model.vo.WorryCategory;
import edu.kh.mind.common.util.Util;
import edu.kh.mind.member.model.vo.Member;



@Controller
@RequestMapping("/secret/*")
@SessionAttributes({"loginMember"})
public class SecretBoardController {

	
	@Autowired
    private SecretService service;
	
	@Autowired
    private ReplyService replyService;
	
	
    
	
    // 털어놓기 게시글
    @ResponseBody
    @RequestMapping(value="list", method=RequestMethod.POST)
    public String secretBoardList(@RequestParam Map<String, String> param) {
      
    	HashMap<String, Object> map = new HashMap<>();
    	
    	System.out.println(param.get("last") + param.get("first"));

        // 게시글 목록
        List<Board> secretBoardList = service.selectSecretList(param);
        
        Board board = new Board();
        int result = service.countSecretList();
        board.setMaxValue(result);
        
        secretBoardList.add(board);
        

        map.put("secretList", secretBoardList);

        return new Gson().toJson(secretBoardList);
    }

    
    
    
	//게시판 글작성, 게시판 페이지 연결
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String secretBoardinsert(Model model) {
    	model.addAttribute("css", "board/secretList");
    	model.addAttribute("header", "community");
    	
    	return "secret/insert";
	}
    
    
    
    
    //글 작성 
    @ResponseBody
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public int secretBoardInsert(Model model, @ModelAttribute("loginMember") Member loginMember, 
    		@RequestPart(value = "images",required = false) List<MultipartFile> images,  HttpSession session,
    		Board board, String contentFiles) throws Exception {
		
    	
		board.setMemberNo(loginMember.getMemberNo());
		//웹 접근경로(web path), 서버 저장경로(serverPath)
		String webPath = "/resources/images/board/";
		
		String serverPath= session.getServletContext().getRealPath(webPath);
		//System.out.println(board);
		System.out.println(webPath);
		System.out.println(serverPath);
		System.out.println(images);
		
		//게시글 작성 후 상세 조회(DB에 입력된 게시글)할 boardNo 
		int result = service.insertSecretBoard(board, images, webPath, serverPath);
		
    	return result;
    }
    
    
    //게시판 상세조회
    @RequestMapping("view/{boardNo}")
    public String SecretView(Model model, 
    							@PathVariable("boardNo") int boardNo,
    							RedirectAttributes ra, 
    							HttpSession session) {
    	model.addAttribute("css", "board/secretView");
    	model.addAttribute("header", "community");
    	
    	int memberNo = 0;
    	
		if(session.getAttribute("loginMember") != null) {
			memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
		}
    	
		Board board = service.selectBoard(boardNo, memberNo);
		
    	if(board != null) {
    		
    		// 댓글 
    		List<Reply> rList = replyService.selectList(boardNo);
    		model.addAttribute("rList", rList);
    		
    		model.addAttribute("board", board);
    		return "secret/view";
    		
    	}else {
    		
    		return "redirect:";
    	}
    	
    }
    
    //게시판 글수정 화면 전환
    @RequestMapping(value="updateForm")
    public String freeBoardUpdate(int boardNo, Model model) {
    	model.addAttribute("css", "board/update");
    	model.addAttribute("header", "community");
    	
    	Board board = service.selectBoard(boardNo);
    	model.addAttribute("board", board);
    	return "secret/update";
    }
    
    
    
	// 수정
    @RequestMapping(value="update", method=RequestMethod.POST)
    public String secretUpdate(Model model, Board board,
						@RequestParam("deleteImages") String deleteImages,
						@RequestParam("images") List<MultipartFile> images,
						RedirectAttributes ra, HttpSession session ) {

    	
    			String webPath = "/resources/images/board/"; 
    			String serverPath = session.getServletContext().getRealPath(webPath);
    			
    			// 2) 게시글 수정 Service 호출 
    			int result = service.updateBoard(board, images, webPath, serverPath, deleteImages);
    			
    			
    			String path = null;
    			if(result > 0) { 
    				 	Util.swalSetMessage("게시글 수정 성공", null, "success", ra);
    				 	path = "view/" + board.getBoardNo();
    				 	
    				 				
    			}else { 
    					Util.swalSetMessage("게시글 수정 실패", null, "error", ra);
    					path = "updateForm";
    			}
    			
    			return "redirect:"+path;
    		}
    		
    //게시글 삭제
    @RequestMapping(value="delete")
    public String freeBoarDelete(int boardNo, Model model, RedirectAttributes ra) {
    	model.addAttribute("header", "community");
    	model.addAttribute("css", "board/secretList");
    	
    	int result = service.deleteBoard(boardNo);
    	
    	String path = null;
		
		if(result > 0) {
			Util.swalSetMessage("게시글 삭제 성공", null, "success", ra);
			path = "insert";
			
		}else {
			Util.swalSetMessage("게시글 삭제 실패", null, "error", ra);
			path = "view/" + boardNo;
		}
    	return "redirect:" + path;
    }
    
    //예외처리
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		
		//Model : 데이터 전달용 객체(Map형식, request범위)
		
		model.addAttribute("errorMessage", "회원 관련 서비스 이용 중 문제가 발생했습니다.");
		model.addAttribute("e", e);
		
		return "/common/error";
	}

    
    
  //-------- 모바일 댓글창 --------------
	
  	@RequestMapping("mobileComment")
      public String mobileCommentView(Model model) {
      	
      	model.addAttribute("css", "board/mobileComment"); //각 페이지 css 추가 태그 
      	model.addAttribute("header", "main"); //헤더구분 사이드메뉴가 없는 페이지일 경우 main작성  
      	 
          return "board/mobileComment";
      }
    
    
    

}