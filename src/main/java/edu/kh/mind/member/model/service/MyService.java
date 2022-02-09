package edu.kh.mind.member.model.service;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Pagination;
import edu.kh.mind.board.model.vo.Reply;

import edu.kh.mind.board.model.vo.Scrap;
import edu.kh.mind.member.model.vo.EmotionCategory;
import edu.kh.mind.member.model.vo.EmotionDiary;
import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.member.model.vo.Mute;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import edu.kh.mind.member.model.vo.Review;

import edu.kh.mind.member.social.naver.vo.Naver;
import edu.kh.mind.pro.model.vo.Reservation;


import java.util.List;
import java.util.Map;


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
	 * @param map
	 * @return result
	 */
	EmotionDiary selectEmotionRecord(Map<String, String> map);

	/**
	 * 감정 기록 등록일 list
	 * @param memberNo
	 * @return list
	 */
	List<String> selectEmotionDiaryDate(int memberNo);


	// 내가 쓴글 조회
	List<Board> myBoardList(Map<String, Integer> map);

	// 페이징
	Pagination getPagination(int cp, int memberNo);

	// 내가 쓴 댓글 조회
    List<Reply> selectMyReplyList(Map<String, Integer> map);

    
    // 후기 등록
	int reviewInsert(Review review);


	List<Mute> selectMuteMember(int memberNo);

	int clearMember(Mute mute);


	int secessionMember(Naver naver, Member loginMember);

	List<Scrap> myScrapList(Map<String, Integer> map);

	int countBoardList(Map<String, Integer> map);

	int countReplyList(Map<String, Integer> map);

	int countScrapList(Map<String, Integer> map);

	/**
	 * 상담 예약 조회
	 * @param memberNo
	 * @return reservationList
	 */
	List<Reservation> selectReservation(int memberNo);
}
