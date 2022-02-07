package edu.kh.mind.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/worry/*")
public class WorryBoardController {

    @RequestMapping("worryList")
    public String worryList() {

        return "board/worryList";
    }
}
