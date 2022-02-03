package edu.kh.mind.adminPro.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mind.adminPro.model.dao.AdminProDAO;
import edu.kh.mind.member.model.vo.Profession;

@Service
public class AdminProServiceImpl implements AdminProService{
	
	@Autowired
	AdminProDAO dao;

	@Override
	public int proRegister(Profession profession) {
		return dao.proRegister(profession);
	}


}
