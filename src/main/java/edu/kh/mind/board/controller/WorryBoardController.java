package edu.kh.mind.board.controller;

import edu.kh.mind.board.model.service.WorryService;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.WorryCategory;
import edu.kh.mind.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/worry/*")
@SessionAttributes({"loginMember"})
public class WorryBoardController {

    @Autowired
    private WorryService service;

    // 고민상담 게시판
    @RequestMapping(value="worryList", method=RequestMethod.GET)
    public String worryBoard(Model model, WorryCategory worryCategory) {
        // 카테고리
        List<WorryCategory> categoryList = service.selectWorryCategory();

        model.addAttribute("categoryList", categoryList);

        model.addAttribute("css", "board/worryList");

        return "board/worryList";
    }

    // 고민상담 게시글
    @ResponseBody
    @RequestMapping(value="worryList", method=RequestMethod.POST)
    public HashMap<String, Object> worryList(@RequestParam Map<String, String> param) {
        HashMap<String, Object> map = new HashMap<>();

        // 게시글 목록
        List<Board> worryList = service.selectWorryList(param);

        map.put("worryList", worryList);

        return map;
    }

    // 고민상담 글 작성
    // 글작성 기능
    @ResponseBody
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public int worryBoardInsert(@ModelAttribute("loginMember") Member loginMember,
            @RequestPart(value="images", required=false) List<MultipartFile> images, HttpSession session,
            Board board, String contentFiles) throws Exception {

        board.setMemberNo(loginMember.getMemberNo());

        //웹 접근경로(web path), 서버 저장경로(serverPath)
        String webPath = "/resources/images/board/";

        String serverPath= session.getServletContext().getRealPath(webPath);

        //게시글 작성 후 상세 조회(DB에 입력된 게시글)할 boardNo
        int result = service.insertWorryBoard(board, images, webPath, serverPath);

        return result;
    }

}
