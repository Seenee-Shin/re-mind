package edu.kh.mind.member.model.dao;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Reply;

import edu.kh.mind.board.model.vo.Scrap;
import edu.kh.mind.member.model.vo.EmotionCategory;
import edu.kh.mind.member.model.vo.EmotionDiary;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import edu.kh.mind.member.model.vo.Review;

import edu.kh.mind.member.model.vo.*;
import edu.kh.mind.member.social.naver.vo.Naver;

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

	// 내 게시글 보기
    public List<Board> myBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("boardMapper.myBoardList", map);
	}

	// 페이징 처리 필요한 전체 게시글 계산
	public int getBoardListCount(int memberNo) {
		return sqlSession.selectOne("boardMapper.getBoardListCount", memberNo);
	}

	// 내 댓글 보기
    public List<Reply> selectMyReplyList(Map<String, Integer> map) {
//		System.out.println(memberNo); 담김
		return sqlSession.selectList("replyMapper.selectMyReplyList", map);
    }

    
    // 후기 등록
	public int reviewInsert(Review review) {

	return sqlSession.insert("reviewMapper.reviewInsert", review);
	}	

	public List<Mute> selectMuteMember(int memberNo) {
		return sqlSession.selectList("memberMapper.selectMuteMember", memberNo);
	}

	public int clearMember(Mute mute) {
		return sqlSession.delete("memberMapper.clearMember", mute);
	}

	public int deleteToken(Naver naver) {
		return sqlSession.delete("memberMapper.deleteToken", naver);
	}

	public int deleteSocial(Member loginMember) {
		return sqlSession.update("memberMapper.deleteSocial", loginMember);
	}

	public int secessionMember(Member loginMember) {
		return sqlSession.update("memberMapper.secessionMember", loginMember);

	}


	public List<Scrap> myScrapList(Map<String, Integer> memberNo) {
		return sqlSession.selectList("boardMapper.myScrapList", memberNo);
	}

	public int countBoardList(Map<String, Integer> map) {
		return sqlSession.selectOne("boardMapper.countBoardList", map);
	}

	public int countReplyList(Map<String, Integer> map) {
		return sqlSession.selectOne("replyMapper.countReplyList", map);
	}

	public int countScrapList(Map<String, Integer> map) {
		return sqlSession.selectOne("boardMapper.countScrapList", map);
	}
}
