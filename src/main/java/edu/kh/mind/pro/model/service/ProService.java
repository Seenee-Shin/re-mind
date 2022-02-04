package edu.kh.mind.pro.model.service;

import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.pro.model.vo.ReservationPayMent;

import java.util.List;

public interface ProService {

    List<Profession> selectProfession(List<String> worryCtCd);

    List<Profession> selectAllProfession();

    // 총 가격 insert
    int priceInsert(int price, ReservationPayMent rv);
}
