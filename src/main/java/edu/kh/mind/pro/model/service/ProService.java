package edu.kh.mind.pro.model.service;

import edu.kh.mind.member.model.vo.Profession;

import java.util.List;

public interface ProService {

    List<Profession> selectProfession(List<String> worryCtCd);

    List<Profession> selectAllProfession();
}
