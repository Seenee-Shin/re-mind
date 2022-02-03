package edu.kh.mind.selftest.model.service;

import edu.kh.mind.selftest.model.dao.SelftestDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SelftestServiceImpl implements SelftestService {

    @Autowired
    private SelftestDAO dao;

    @Override
    public String selectQ(int questionNo) {

        return dao.selectQ(questionNo);
    }
}
