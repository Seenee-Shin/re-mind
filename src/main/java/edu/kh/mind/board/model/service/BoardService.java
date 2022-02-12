package edu.kh.mind.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Scrap;

public interface BoardService {


	List<Board> selectBoardList(Map<String, String> param);

	int insertFreeBoard(Board board, List<MultipartFile> images, String webPath, String serverPath);

	Board selectBoard(int boardNo, int memberNo);

	int updateBoard(Board board);

	Board selectBoard(int boardNo);

	int deleteBoard(int boardNo);


	int boardScrap(Scrap scrap);

	int countFreeList();

}
