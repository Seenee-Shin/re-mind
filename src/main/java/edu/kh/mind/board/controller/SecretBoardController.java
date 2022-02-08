package edu.kh.mind.board.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.mind.board.model.service.SecretService;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.WorryCategory;



@Controller
@RequestMapping("/secret/*")
@SessionAttributes({"loginMember"})
public class SecretBoardController {

	
	@Autowired
    private SecretService service;
	
	
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






}