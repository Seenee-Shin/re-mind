package edu.kh.mind.board.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	
	// 털어놓기 게시판
    @RequestMapping(value="secretList", method=RequestMethod.GET)
    public String secretBoard(Model model) {

        // 카테고리
        List<WorryCategory> categoryList = service.selectWorryCategory();

        model.addAttribute("categoryList", categoryList);

        model.addAttribute("css", "board/worryList");

        return "secret/list";
    }
	
    // 털어놓기 게시글
    @ResponseBody
    @RequestMapping(value="secretList", method=RequestMethod.POST)
    public HashMap<String, Object> worryList() {
      
    	HashMap<String, Object> map = new HashMap<>();

        // 게시글 목록
        List<Board> secretList = service.selectSecretList();

        map.put("secretList", secretList);

        return map;
    }


	// 수정
    @RequestMapping(value="update", method=RequestMethod.GET)
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
    		
    //게시판 상세조회
    @RequestMapping("view/{boardNo}")
    public String SecretView(Model model, 
    							@PathVariable("boardNo") int boardNo,
    							RedirectAttributes ra, 
    							//@ModelAttribute("loginMember") Member loginMember,
    							HttpSession session) {
    	model.addAttribute("css", "board/freeView");
    	model.addAttribute("header", "community");
    	
    	int memberNo = 0;
    	
    	
    	
		/*if(session.getAttribute("loginMember") != null) {
			memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
		}*/
    	
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
    
    
    

}