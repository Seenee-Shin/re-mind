package edu.kh.mind.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.kh.mind.board.model.service.ReplyService;


@RestController

@RequestMapping("/reply/*")
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	

}
