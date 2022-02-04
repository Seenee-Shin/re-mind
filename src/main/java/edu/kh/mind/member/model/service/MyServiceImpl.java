package edu.kh.mind.member.model.service;

import edu.kh.mind.member.model.dao.MyDAO;
import edu.kh.mind.member.model.vo.EmotionCategory;
import edu.kh.mind.member.model.vo.EmotionDiary;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public int insertEmotionDiary(EmotionDiary emotionDiary) {
        return dao.insertEmotionDiary(emotionDiary);
    }

    // 감정 기록 select
    @Override
    public EmotionDiary selectEmotionRecord(String selectDate) {
        return dao.selectEmotionRecord(selectDate);
    }


}
