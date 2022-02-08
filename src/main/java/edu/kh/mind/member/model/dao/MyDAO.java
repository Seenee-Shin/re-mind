package edu.kh.mind.member.model.dao;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Pagination;
import edu.kh.mind.board.model.vo.Reply;
import edu.kh.mind.member.model.vo.*;
import edu.kh.mind.member.social.naver.vo.Naver;
import org.apache.ibatis.session.RowBounds;
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
    public List<Board> myBoardList(Pagination pagination) {

		int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();
		int limit = pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("boardMapper.myBoardList", pagination, rowBounds);
	}

	// 페이징 처리 필요한 전체 게시글 계산
	public int getBoardListCount(int memberNo) {
		return sqlSession.selectOne("boardMapper.getBoardListCount", memberNo);
	}

	//
    public List<Reply> selectMyReplyList(int memberNo) {
		return sqlSession.selectList("replyMapper.selectMyReplyList", memberNo);
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
}
