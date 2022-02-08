package edu.kh.mind.board.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.mind.board.model.dao.SecretDAO;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.WorryCategory;
import edu.kh.mind.common.util.Util;

@Service
public class SecretServiceImpl implements SecretService {

	@Autowired
	private SecretDAO dao;

	
	@Override
	public List<Board> selectSecretList() {
		return dao.selectSecretList();
	}


	@Override
	public List<WorryCategory> selectWorryCategory() {
		return dao.selectWorryCategory();
	}


	@Override
	public int updateBoard(Board board, List<MultipartFile> images, String webPath, String serverPath,
			String deleteImages) {

		// 1) 게시글 제목/내용 XSS, 개행문자 처리 
		board.setBoardContent( Util.XSS( board.getBoardContent() ));
		board.setBoardContent( Util.changeNewLine( board.getBoardContent() ));
		
		/*// 2) 게시글 부분 수정 진행 
		int result = dao.updateBoard(board);
		
		// 3) 기존에 있었지만 삭제된 이미지 DELETE 처리
		if(result > 0 ) {
			// 마이바티스는 SQL 수행 시 파라미터를 1개만 받을 수 있다! 
			// 전달할 파라미터가 다수인 경우 Map과 같은 컬렉션 객체를 이용하면 된다! 
			
			if( !deleteImages.equals("") ) { // 삭제할 이미지 있을 경우
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("boardNo",  board.getBoardNo());
										// int-(Auto Boxing) -> Integer -> Object 
				map.put("deleteImages", deleteImages);
										// String -> Object
				
				result = dao.deleteImages(map);
			}
		}
		
		// 4) images에 담겨있는 파일 정보 중
		// 	  업로드된 파일 정보를 imgList에 올겨 담기
		
		if(result > 0) {
			
			List<BoardImage> imgList = new ArrayList<BoardImage>();
			
			for(int i=0; i<images.size(); i++) {
				// i == images 인덱스 == imgLevel
				
				// 업로드된 파일이 있는 경우
				if( !images.get(i).getOriginalFilename().equals("") ) {
					
					BoardImage img = new BoardImage();
					
					img.setImgPath(webPath); // 웹 접근 경로 
					img.setImgName( Util.fileRename(images.get(i).getOriginalFilename())); // 변경된 파일명
					img.setImgOriginal( images.get(i).getOriginalFilename()); // 원본 파일명
					img.setImgLevel(i); // 이미지 레벨
					img.setBoardNo( board.getBoardNo() ); // 게시글 번호 
					
					imgList.add(img);
				}
			}
			
			
			// 5) imgList가 비어있지 않을 경우
			//    imgList에 있는 내용을 update 또는 insert
			
			// 향상된 for문으로 반복 접근할 List가 비어있다면 for문은 수행되지 않음. 
			for(BoardImage img : imgList) {
				
				// 서로 다른 행을 일괄적으로 update 방법이 없기에
				// 한 행씩 수정 
				result = dao.updateBoardImage(img);
				// 결과 1 -> 기존에 저장된 이미지가 수정됨.
				// 결과 0 -> 기존에 저장되지 않은 이미지가 추가됨 -> INSERT 진행 
				
				if(result == 0) { // 기존에 저장되지 않은 이미지가 추가됨 -> INSERT 진행
					result = dao.insertBoardImage(img);
					
					if(result == 0) {
						// 사용자 정의 예외
						throw new UpdateBoardFailException("이미지 삽입 중 문제 발생");
						
					}
						
				  }
					
				} // for end
			
				// 6) 전달 받은 images 중 업로드된 파일이 있는 부분을 실제 파일 저장 
			
				if( !imgList.isEmpty()) {
					
					try {
						for(int i=0; i<imgList.size(); i++) {
							images.get( imgList.get(i).getImgLevel() )
							.transferTo(new File(serverPath +"/" + imgList.get(i).getImgName() ));
						}
					}catch(Exception e) {
						e.printStackTrace();
						
						// 사용자 정의 예외 (RuntimeException)
						throw new UpdateBoardFailException();
					}
				}
			
			} // if end */
		
		return 0;
	}


	@Override
	public Board selectBoard(int boardNo, int memberNo) {
	
		Board board = dao.selectBoard(boardNo);
		
		// 게시글 상세조회 성공 && 게시글 작성자 != 회원번호 
		if( board != null && board.getMemberNo() != memberNo) {
			
			// 조회수 증가 
			int result = dao.increaseReadCount(boardNo);
			
			// 조회 수 증가 성공 시
			// 미리 조회된 board의 readCount를 + 1 (DB동기화)
			if(result > 0) {
				board.setReadCount( board.getReadCount() + 1 );
			}
		}
		
		return board;
	}
	
	
	
}
