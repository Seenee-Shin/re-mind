package edu.kh.mind.member.model.service;

import edu.kh.mind.member.model.vo.EmotionCategory;
import edu.kh.mind.member.model.vo.EmotionDiary;
import edu.kh.mind.member.model.vo.ProfessionHospital;

import java.util.List;


public interface MyService {

    List<ProfessionHospital> loadProMap();

	/**
	 * 스트레스 증상 목록
	 * @return emotionCategoryList
	 */
	List<EmotionCategory> emotionCategory();


	/**
	 * 감정 기록 등록
	 * @param emotionDiary
	 * @return result
	 */
	int insertEmotionDiary(EmotionDiary emotionDiary);

	/**
	 * 감정 기록 select
	 * @param selectDate
	 * @return result
	 */
	EmotionDiary selectEmotionRecord(String selectDate);

	/**
	 * 감정 기록 등록일 list
	 * @return list
	 */
    List<EmotionDiary> selectEmotionDiaryDate();
}
