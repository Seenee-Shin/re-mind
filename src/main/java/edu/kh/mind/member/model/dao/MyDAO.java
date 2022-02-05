package edu.kh.mind.member.model.dao;

import edu.kh.mind.member.model.vo.EmotionCategory;
import edu.kh.mind.member.model.vo.EmotionDiary;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class MyDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public List<ProfessionHospital> loadProMap() {
        return sqlSession.selectList("professionMapper.loadProMap");
    }

	public List<EmotionCategory> emotionCategory() {
		return sqlSession.selectList("emotionMapper.emotionCategory");
	}

	/**
	 * 감정 기록 등록
	 * @param emotionDiary
	 * @return result
	 */
	public int insertEmotionDiary(EmotionDiary emotionDiary) {
		return sqlSession.insert("emotionMapper.insertEmotionDiary", emotionDiary);
	}

	/**
	 * 감정 기록 select
	 * @param map
	 * @return result
	 */
	public EmotionDiary selectEmotionRecord(Map<String, String> map) {
		return sqlSession.selectOne("emotionMapper.selectEmotionRecord", map);
	}

	/**
	 * 감정 기록 등록일 list
	 * @param memberNo
	 * @return list
	 */
    public List<String> selectEmotionDiaryDate(int memberNo) {
		return sqlSession.selectList("emotionMapper.selectEmotionDiaryDate", memberNo);
    }

	/**
	 * 감정 기록 update
	 * @param emotionDiary
	 * @return result
	 */
	public int updateEmotionDiary(EmotionDiary emotionDiary) {
		return sqlSession.update("emotionMapper.updateEmotionDiary", emotionDiary);
	}
}
