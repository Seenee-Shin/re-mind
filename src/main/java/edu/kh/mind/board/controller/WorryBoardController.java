package edu.kh.mind.board.controller;

import edu.kh.mind.board.model.service.WorryService;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.WorryCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/worry/*")
public class WorryBoardController {

    @Autowired
    private WorryService service;

    // 고민상담 게시판
    @RequestMapping(value="worryList", method=RequestMethod.GET)
    public String worryBoard(Model model) {

        // 카테고리
        List<WorryCategory> categoryList = service.selectWorryCategory();

        model.addAttribute("categoryList", categoryList);

        model.addAttribute("css", "board/worryList");

        return "board/worryList";
    }

    // 고민상담 게시글
    @ResponseBody
    @RequestMapping(value="worryList", method=RequestMethod.POST)
    public HashMap<String, Object> worryList() {
        System.out.println("start");
        HashMap<String, Object> map = new HashMap<>();

        // 게시글 목록
        List<Board> worryList = service.selectWorryList();

        map.put("worryList", worryList);

        return map;
    }


}
