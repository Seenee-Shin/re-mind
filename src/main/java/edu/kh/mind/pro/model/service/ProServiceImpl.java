package edu.kh.mind.pro.model.service;

import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.pro.model.dao.ProDAO;
import edu.kh.mind.pro.model.vo.ReservationPayMent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProServiceImpl implements ProService{

    @Autowired
    private ProDAO dao;

    @Override
    public List<Profession> selectProfession(List<String> worryCtCd) {
        return dao.selectProfession(worryCtCd);
    }

    @Override
    public List<Profession> selectAllProfession() {
        return dao.selectAllProfession();
    }

    // 총 금액 insert
    @Override
    public int priceInsert(int price, ReservationPayMent rv) {

        // 상담예약결제 insert
        int reservationPayNo = dao.reservationPaymentInsert(rv);


        return 0;
    }
}
