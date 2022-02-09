package edu.kh.mind.member.model.service;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Pagination;
import edu.kh.mind.board.model.vo.Reply;
import edu.kh.mind.board.model.vo.Scrap;
import edu.kh.mind.common.util.Util;
import edu.kh.mind.member.model.dao.MyDAO;

import edu.kh.mind.member.model.vo.EmotionCategory;
import edu.kh.mind.member.model.vo.EmotionDiary;
import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.member.model.vo.Mute;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import edu.kh.mind.member.model.vo.Review;


import edu.kh.mind.member.social.naver.vo.Naver;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MyServiceImpl implements MyService {

    @Autowired
    private MyDAO dao;

    @Override
    public int secessionMember(Naver naver, Member loginMember) {

        int result = 0;

        if(naver.getMemberSocialToken() != null){

            result = dao.deleteToken(naver);

            if(result > 0)  result = dao.deleteSocial(loginMember);
        }else{

            result = dao.secessionMember(loginMember);
        }

        return result;
    }

    @Override
    public int clearMember(Mute mute) {
        return dao.clearMember(mute);
    }

    @Override
    public List<Mute> selectMuteMember(int memberNo) {
        return dao.selectMuteMember(memberNo);
    }

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
    public List<Board> myBoardList(Map<String, Integer> map) {
        return dao.myBoardList(map);
    }

    @Override
    public int countBoardList(Map<String, Integer> map) {
        return dao.countBoardList(map);
    }

    @Override
    public int countScrapList(Map<String, Integer> map) {
        return dao.countScrapList(map);
    }

    @Override
    public List<Scrap> myScrapList(Map<String, Integer> map) {
        return dao.myScrapList(map);
    }

    // 페이징 처리
    @Override
    public Pagination getPagination(int cp, int memberNo) {

        // 전체 게시글 수
        int listCount = dao.getBoardListCount(memberNo);
//        System.out.println(listCount);

        return new Pagination(listCount, cp);
    }

    @Override
    public int countReplyList(Map<String, Integer> map) {
        return dao.countReplyList(map);
    }

    // 내 댓글 조회
    @Override
    public List<Reply> selectMyReplyList(Map<String, Integer> map) {
        return dao.selectMyReplyList(map);
    }

    // 후기 등록
    @Transactional
	@Override
	public int reviewInsert(Review review) {
		
		review.setReviewContent(Util.XSS(review.getReviewContent()));
		review.setReviewContent(Util.changeNewLine(review.getReviewContent()));
		
		return dao.reviewInsert(review);
	}
}
