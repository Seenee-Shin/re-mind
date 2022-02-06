package edu.kh.mind.board.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.mind.board.model.vo.Board;

public interface BoardService {


	List<Board> selectBoardList();

	int insertFreeBoard(Board board, List<MultipartFile> images, String webPath, String serverPath);

	Board selectBoard(int boardNo, int memberNo);

}
