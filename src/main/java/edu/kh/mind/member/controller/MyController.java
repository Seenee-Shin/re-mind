package edu.kh.mind.member.controller;

import com.google.gson.Gson;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Pagination;
import edu.kh.mind.common.util.Util;
import edu.kh.mind.member.model.service.MyService;
import edu.kh.mind.member.model.vo.EmotionCategory;
import edu.kh.mind.member.model.vo.EmotionDiary;
import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/my/*")
@SessionAttributes({"loginMember"})
public class MyController {

    @Autowired
    private MyService service;
    

    @RequestMapping("appointment")
    public String appointment(Model model) {

    	model.addAttribute("css", "my");
        return "my/appointment";
    }

    @RequestMapping("appointment/past")
    public String appointmentPast(Model model) {
    	model.addAttribute("css", "my");
        return "my/appointmentPast";
    }

    // 감정 기록 페이지
    @RequestMapping("emotionRecord")
    public String emotionRecord(Model model, HttpSession session) {
        List<EmotionCategory> emotionCategoryList = service.emotionCategory();

        // 감정 기록 등록일 list
        String emotionDiaryDate = "[]";

        String gsonData = "";
        if (session.getAttribute("loginMember")  != null) {
            int memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();

            // 감정 기록 등록일
            List<String> emotionDiaryDateList = service.selectEmotionDiaryDate(memberNo);
            emotionDiaryDate = new Gson().toJson(emotionDiaryDateList);

            // 오늘 등록된 감정 기록
            Map<String, String> map = new HashMap<String, String>();
            map.put("memberNo", memberNo +"");
            map.put("selectDate", todayFormat());
            EmotionDiary emotionRecordData = service.selectEmotionRecord(map);
            gsonData = new Gson().toJson(emotionRecordData);
        }

        model.addAttribute("emotionRecordData", gsonData);
        model.addAttribute("emotionDiaryDate", emotionDiaryDate);
        model.addAttribute("emotionCategoryList", emotionCategoryList);
        model.addAttribute("css", "my");

        return "my/emotionRecord";
    }

    // 감정 기록 select
    @RequestMapping(value="emotionRecordData", method=RequestMethod.POST)
    @ResponseBody
    public EmotionDiary emotionRecordData(String selectDate, HttpSession session, RedirectAttributes ra) {
        EmotionDiary emotionRecordData = null;
        if(session.getAttribute("loginMember") != null) {
            int memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();

            Map<String, String> map = new HashMap<String, String>();
            map.put("memberNo", memberNo +"");
            map.put("selectDate", selectDate);

            emotionRecordData = service.selectEmotionRecord(map);
        } else {
            Util.swalSetMessage("로그인이 필요합니다.", null, "info", ra);
        }

        return emotionRecordData;
    }


    // 감정기록 form
    @RequestMapping(value="emotionDiary", method= RequestMethod.GET)
    public String emotionDiary(Model model, HttpSession session, RedirectAttributes ra) {

        if (session.getAttribute("loginMember") != null) {
            List<EmotionCategory> emotionCategoryList = service.emotionCategory();

            int memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();

            // 오늘 등록된 감정 기록
            Map<String, String> map = new HashMap<String, String>();
            map.put("memberNo", memberNo +"");
            map.put("selectDate", todayFormat());
            EmotionDiary emotionRecordData = service.selectEmotionRecord(map);
            String gsonData = new Gson().toJson(emotionRecordData);
            System.out.println(gsonData);

            model.addAttribute("emotionRecordData", gsonData);
            model.addAttribute("emotionCategoryList", emotionCategoryList);
            model.addAttribute("css", "my");

            return "my/emotionDiary";
        } else {
            Util.swalSetMessage("로그인이 필요합니다.", null, "info", ra);
            return "redirect:emotionRecord";
        }


    }

    // 감정기록 등록
    @RequestMapping(value="emotionDiary", method=RequestMethod.POST)
    public String emotionDiaryInsert(EmotionDiary emotionDiary, @ModelAttribute("loginMember") Member loginMember, HttpServletRequest req, HttpSession session, RedirectAttributes ra) {

        if (req.getParameter("stressAgree") != null) {
            emotionDiary.setStressAgree(1);
        } else {
            emotionDiary.setStressAgree(0);
        }

        if (req.getParameter("diaryAgree") != null) {
            emotionDiary.setDiaryAgree(1);
        } else {
            emotionDiary.setDiaryAgree(0);
        }

        emotionDiary.setEmotionDate(todayFormat());

        if (session.getAttribute("loginMember") != null) {
            emotionDiary.setMemberNo(loginMember.getMemberNo());
            int result = service.insertEmotionDiary(emotionDiary);

            return "redirect:/my/emotionRecord";

        } else {
            Util.swalSetMessage("로그인이 필요합니다.", null, "info", ra);
            return null;
        }

    }

    private String todayFormat() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date today = new Date(System.currentTimeMillis());
        return dateFormat.format(today);
    }














    @GetMapping("counselor")
    public String counselor(Model model){
    	model.addAttribute("css", "my/counselor");
        return "my/counselor";
    }

    @GetMapping("enquiry")
    public String enquiry(Model model){
    	model.addAttribute("css", "my/enquiry");
        return "my/enquiry";
    }

    @GetMapping("letterList")
    public String letterList(Model model){
    	model.addAttribute("css", "my/letterList");
        return "my/letterList";
    }

    @GetMapping("map")
    public String map(Model model){
        model.addAttribute("css", "my/map");
        return "my/map";
    }

    @GetMapping("muteMember")
    public String muteMember(Model model){
        model.addAttribute("css", "my/muteMember");
        return "my/muteMember";
    }

    @GetMapping("myBoardList")
    public String myBoardList(Model model,
                              @ModelAttribute("loginMember") Member loginMember,
                              HttpSession session,RedirectAttributes ra, Board board,
                              @RequestParam(value="cp", required = false, defaultValue="1")int cp){
        model.addAttribute("css", "my/myBoardList");

        String path = null;
        int memberNo = 0;
        Pagination pagination = null;


        if (session.getAttribute("loginMember") != null) {
            memberNo = ((Member) session.getAttribute("loginMember")).getMemberNo();
            pagination = service.getPagination(cp, memberNo);
            System.out.println(pagination); //
            pagination.setMemberNo(memberNo);

            List<Board> myBoardList = service.myBoardList(pagination);
            System.out.println(myBoardList.get(board.getBoardNo()).toString());



            model.addAttribute("pagination", pagination);
            model.addAttribute("myBoardList", myBoardList);
            path = "my/myBoardList";
        } else {
            Util.swalSetMessage("로그인이 필요합니다.", null, "info", ra);
            path = "/";
        }
        return path;

    }

    @GetMapping("postscript")
    public String postscript(Model model){
        model.addAttribute("css", "my/postscript");
        return "my/postscript";
    }

    @GetMapping("secession")
    public String secession(Model model){
        model.addAttribute("css", "my/secession");
        return "my/secession";
    }

    @GetMapping("updateMyInfo")
    public String updateMyInfo(Model model){
        model.addAttribute("css", "my/muteMember");
        return "my/updateMyInfo";
    }

    @GetMapping("loadProMap")
    @ResponseBody
    public String loadProMap(){

        List<ProfessionHospital> proList = service.loadProMap();

        for(ProfessionHospital p : proList){
            System.out.println(p);
        }

        return new Gson().toJson(proList);
    }

    // @ExceptionHandler(처리할 예외.class)
    @ExceptionHandler(Exception.class)
    public String exceptionHandler(Exception e, Model model) {

        // Model : 데이터 전달용 객체 (Map형식, request범위)
        model.addAttribute("errorMessage", "회원 관련 서비스 이용중 문제가 발생했습니다.");
        model.addAttribute("e", e);

        return "common/error";
    }

}
