package edu.kh.mind.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.mind.board.model.service.BoardService;
import edu.kh.mind.board.model.service.MindPostService;
import edu.kh.mind.board.model.vo.MindPost;
import edu.kh.mind.common.util.Util;
import edu.kh.mind.member.model.vo.Member;

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
    
    
    // 글 작성 
    @RequestMapping(value="insert", method=RequestMethod.POST)
    public String postInsert(MindPost post, 
    		//@ModelAttribute("loginMember") Member loginMember,
    		RedirectAttributes ra) {
    	
    	post.setMemberNo(60);
    	
    	int postNo = service.insertPost(post);
    	
    	String title;
		String icon;
		
    	if(postNo > 0) { 
    			title="연구 성공!";
				icon = "success";
    		}else {
    			title="연구 실패";
 				icon = "error";
    		}
    	
    		ra.addFlashAttribute("title", title);
			ra.addFlashAttribute("icon", icon);
		
    	return "post/list";
    }
    



}
