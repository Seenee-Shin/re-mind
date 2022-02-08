package edu.kh.mind.member.controller;

import com.google.gson.Gson;
import edu.kh.mind.board.model.vo.Reply;
import edu.kh.mind.member.model.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/my/*")
public class MyRestController {

    @Autowired
    MyService service;

    @RequestMapping(value = "myReplyList", method = RequestMethod.GET)
    public String selectMyReplyList(int memberNo){

        System.out.println(memberNo);
        List<Reply> result = service.selectMyReplyList(memberNo);
        System.out.println(result);

        return new Gson().toJson(result);
    }


}
