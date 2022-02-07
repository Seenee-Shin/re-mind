package edu.kh.mind.member.model.service;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.common.util.Util;
import edu.kh.mind.member.model.dao.MyDAO;
import edu.kh.mind.member.model.vo.EmotionCategory;
import edu.kh.mind.member.model.vo.EmotionDiary;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MyServiceImpl implements MyService {

    @Autowired
    private MyDAO dao;

    @Override
    public List<ProfessionHospital> loadProMap() {
        return dao.loadProMap();
    }

    @Override
    public List<EmotionCategory> emotionCategory() {
        return dao.emotionCategory();
    }

    // 감정 기록 등록
    @Override
    public int insertEmotionDiary(EmotionDiary emotionDiary) {

        emotionDiary.setEmotionContent(Util.XSS(emotionDiary.getEmotionContent()));
        emotionDiary.setEmotionContent(Util.changeNewLine(emotionDiary.getEmotionContent()));

        Map<String, String> map = new HashMap<>();
        map.put("memberNo", emotionDiary.getMemberNo()+"");
        map.put("selectDate", emotionDiary.getEmotionDate());
        EmotionDiary emotionRecord = dao.selectEmotionRecord(map);
        if (emotionRecord == null) {
            return dao.insertEmotionDiary(emotionDiary);
        } else {
            emotionDiary.setEmotionNo(emotionRecord.getEmotionNo());
            System.out.println(emotionDiary);
            return dao.updateEmotionDiary(emotionDiary);
        }

    }

    // 감정 기록 select
    @Override
    public EmotionDiary selectEmotionRecord(Map<String, String> map) {
        return dao.selectEmotionRecord(map);
    }

    // 감정 기록 등록일 list
    @Override
    public  List<String> selectEmotionDiaryDate(int memberNo) {
        return dao.selectEmotionDiaryDate(memberNo);
    }


    // 내 게시글 조회
    @Override
    public List<Board> myBoardList(int memberNo) {
        return dao.myBoardList(memberNo);
    }
}
