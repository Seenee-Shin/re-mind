package edu.kh.mind.notice.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.kh.mind.notice.model.vo.Notice;

public interface NoticeService {

	List<Notice> noticeList();

	Notice selectNotice(int noticeNo);

}
