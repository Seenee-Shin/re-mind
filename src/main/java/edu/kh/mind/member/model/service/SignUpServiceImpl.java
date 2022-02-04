package edu.kh.mind.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mind.member.model.dao.SignUpDAO;

@Service
public class SignUpServiceImpl implements SignUpService{
	
	@Autowired
	private SignUpDAO dao;

	@Override
	public int idDupCheck(String inputId) {
		return dao.idDupCheck(inputId);
	}

	@Override
	public int nickNmDupCheck(String inputNickNm) {
		return dao.nickNmDupCheck(inputNickNm);
	}

}
