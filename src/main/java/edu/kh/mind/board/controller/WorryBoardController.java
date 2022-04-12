package edu.kh.mind.board.controller;

import com.google.gson.JsonObject;
import edu.kh.mind.board.model.service.ReplyService;
import edu.kh.mind.board.model.service.WorryService;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Empathy;
import edu.kh.mind.board.model.vo.Reply;
import edu.kh.mind.board.model.vo.WorryCategory;
import edu.kh.mind.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/worry/*")
@SessionAttributes({"loginMember","categoryList"})
public class WorryBoardController {

    @Autowired
    private WorryService service;

    @Autowired
    private ReplyService replyService;

    // 고민상담 게시판
    @RequestMapping(value="worryList", method=RequestMethod.GET)
    public String worryBoard(Model model, WorryCategory worryCategory) {
        // 카테고리
        List<WorryCategory> categoryList = service.selectWorryCategory();

        model.addAttribute("categoryList", categoryList);

        model.addAttribute("css", "board/worryList");
        model.addAttribute("header", "community");

        return "board/worryList";
    }

    // 고민상담 게시글
    @ResponseBody
    @RequestMapping(value="worryList", method=RequestMethod.POST)
    public HashMap<String, Object> worryList(@RequestParam Map<String, String> param, HttpSession session) {
        HashMap<String, Object> map = new HashMap<>();

        System.out.println("___________________________________");
	    System.out.println(param);


		if (session.getAttribute("loginMember") != null) {
			param.put("memberNo", ((Member)session.getAttribute("loginMember")).getMemberNo() +"");
		}
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


    
    // 회원 차단
    @ResponseBody
    @RequestMapping(value = "block", method = RequestMethod.GET)
    public int memberBlock(@ModelAttribute("loginMember") Member loginMember, int muteMember) {
    	
    	System.out.println(loginMember.getMemberNo());
    	System.out.println(muteMember);
    	
    	 HashMap<String, Integer> map = new HashMap<>();
    	 map.put("loginMember", loginMember.getMemberNo());
    	 map.put("memberNo", muteMember);
    	 
    	 int result = 0;
    	 
    	 if(loginMember.getMemberNo()== muteMember) {
    		 result = 0;
    	 }else {
    		 result = service.memberBlock(map);
    	 }
    	 
    	return result;
    }

    //  고민상담 상세
    @RequestMapping(value="view/{boardNo}")
    public String worryView(Model model, @PathVariable("boardNo") int boardNo, HttpSession session) {


        int memberNo = 0;
        if (session.getAttribute("loginMember") != null) {
            memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
        }

        Board board = service.selectWorryBoard(boardNo, memberNo);
        System.out.println(board);

        if (board != null) {
            // 댓글
            List<Reply> replyList = replyService.selectList(boardNo);

            System.out.println(replyList);

            System.out.println(board.getWorryEmpathyArray());
            Map<String, Integer> empathyMap = new HashMap<>();

            if (board.getWorryEmpathyArray() != null) {
                String empathyArr[] = board.getWorryEmpathyArray().split(",");
                String cntArr[] = board.getWorryCntArray().split(",");


                for (int i=1001; i<1006; i++) {
                    String keyStr = Integer.toString(i);
                    System.out.println("keyStr : " + keyStr);


                    int key = Arrays.asList(empathyArr).indexOf(keyStr);
                    System.out.println("key : " + key);


                    if (key >= 0) {
                        empathyMap.put(keyStr, Integer.valueOf(cntArr[key]));
                    } else {
                        empathyMap.put(keyStr, 0);
                    }
                }
            }


            System.out.println(empathyMap);


            model.addAttribute("css", "board/worryView");
            model.addAttribute("header", "community");
            model.addAttribute("replyList", replyList);
            model.addAttribute("board", board);
            model.addAttribute("empathyMap", empathyMap);

            return "board/worryView";
        } else {
            return "redirect:/";
        }
    }

    
    // 공감 
    @ResponseBody
    @RequestMapping(value = "insertEmpathy")
    public int insertEmpathy(@RequestParam int memberNo, @RequestParam int boardNo, 
    						@RequestParam int empathyStatusCode) {
    	
    	Empathy empathy =new Empathy();
    	empathy.setBoardNo(boardNo);
    	empathy.setMemberNo(memberNo);
    	empathy.setEmpathyStatusCode(empathyStatusCode);
    	
    	int result = service.insertEmpathy(empathy);
    	
    	return result;
    }
    
    
    // 공감 수 
    @ResponseBody
    @RequestMapping(value = "countEmpathy")
    public int countEmpathy( @RequestParam int boardNo, 
    						@RequestParam int empathyStatusCode) {
    	
    	Empathy empathy =new Empathy();
    	empathy.setBoardNo(boardNo);
    	empathy.setEmpathyStatusCode(empathyStatusCode);
    	
    	int result = service.countEmpathy(empathy);
    	
    	return result;
    }
    
    //수정 화면 연결 
    @RequestMapping(value="updateForm")
    public String freeBoardUpdate(int boardNo, Model model, @ModelAttribute("loginMember") Member loginMember) {
    	model.addAttribute("css", "board/update");
    	model.addAttribute("header", "community");
    	
    	Board board = service.selectWorryBoard(boardNo, loginMember.getMemberNo());
    	model.addAttribute("board", board);
    	return "board/worryUpdate";
    }
    
    //글 수정하기 
    
    
    
    
    
    //예외처리
    @ExceptionHandler(Exception.class)
    public String exceptionHandler(Exception e, Model model) {
        model.addAttribute("errorMessage", "서비스 이용 중 문제가 발생했습니다.");
        model.addAttribute("e", e);

        return "/common/error";
    }


}
