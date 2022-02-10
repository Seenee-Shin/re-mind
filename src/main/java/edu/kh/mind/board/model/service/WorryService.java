package edu.kh.mind.board.model.service;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.WorryCategory;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface WorryService {

	/**
	 * 고민상담 조회
	 * @param param
	 * @return
	 */
	List<Board> selectWorryList(Map<String, String> param);

	/**
	 * 고민상담 카테고리
	 * @return list
	 */
	List<WorryCategory> selectWorryCategory();

	int insertWorryBoard(Board board, List<MultipartFile> images, String webPath, String serverPath);

	/**
	 * 고민상담 상세
	 * @param boardNo
	 * @param memberNo
	 * @return result
	 */
    Board selectWorryBoard(int boardNo, int memberNo);
}
