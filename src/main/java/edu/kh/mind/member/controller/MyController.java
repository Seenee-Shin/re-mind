package edu.kh.mind.member.controller;

import com.google.gson.Gson;
import edu.kh.mind.member.model.service.MyService;
import edu.kh.mind.member.model.vo.EmotionCategory;
import edu.kh.mind.member.model.vo.EmotionDiary;
import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

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

    // 감정기록 form
    @RequestMapping(value="emotionDiary", method= RequestMethod.GET)
    public String emotionDiary(Model model) {
        List<EmotionCategory> emotionCategoryList = service.emotionCategory();

        model.addAttribute("emotionCategoryList", emotionCategoryList);
    	model.addAttribute("css", "my");

        return "my/emotionDiary";
    }

    // 감정기록 등록
    @RequestMapping(value="emotionDiary", method=RequestMethod.POST)
    public String emotionDiaryInsert(EmotionDiary emotionDiary, @ModelAttribute("loginMember") Member loginMember, HttpServletRequest req, HttpSession session) {

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

        if(session.getAttribute("loginMember") != null) {
            emotionDiary.setMemberNo(loginMember.getMemberNo());
            int result = service.insertEmotionDiary(emotionDiary);

        } else {
            System.out.println("로그인 필요");
        }

        return "redirect:/my/emotionRecord";
    }

    // 감정 기록 보기
    @RequestMapping("emotionRecord")
    public String emotionRecord(Model model) {

        List<EmotionCategory> emotionCategoryList = service.emotionCategory();
//        if (loginMember != null) {
//            System.out.println(loginMember.getMemberNo());
//        List<EmotionDiary> emotionDiaryDate = service.selectEmotionDiaryDate();

//        }

        model.addAttribute("emotionCategoryList", emotionCategoryList);
        
    	model.addAttribute("css", "my");

        return "my/emotionRecord";
    }

    // 감정 기록 select
    @RequestMapping(value="emotionRecordData", method=RequestMethod.POST)
    @ResponseBody
    public EmotionDiary emotionRecordData(String selectDate) {
        System.out.println(selectDate);

        EmotionDiary emotionRecordData = service.selectEmotionRecord(selectDate);

        System.out.println(emotionRecordData);
        return emotionRecordData;
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
    public String myBoardList(Model model){
        model.addAttribute("css", "my/myBoardList");
        return "my/myBoardList";
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
}
