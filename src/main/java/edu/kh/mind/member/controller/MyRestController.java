package edu.kh.mind.member.controller;

import com.google.gson.Gson;
import edu.kh.mind.board.model.vo.Reply;
import edu.kh.mind.member.model.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
    public String selectMyReplyList(int memberNo, Model model, Reply reply){

        model.addAttribute("css", "my/myBoardList");
//        System.out.println(memberNo); 담김
        List<Reply> selectMyReplyList = service.selectMyReplyList(memberNo);

        /*for(Reply r : selectMyReplyList){
            System.out.println(r.getMemberNo());
        }*/
        model.addAttribute("myBoardList", selectMyReplyList);

        return new Gson().toJson(selectMyReplyList);
    }


}
