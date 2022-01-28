package edu.kh.mind.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mind.board.model.dao.BoardDAO;
import edu.kh.mind.board.model.dao.MindPostDAO;

@Service
public class MindPostServiceImpl implements MindPostService{

	@Autowired
	private MindPostDAO dao;
	
}
