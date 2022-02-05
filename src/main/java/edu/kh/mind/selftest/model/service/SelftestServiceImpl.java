package edu.kh.mind.selftest.model.service;

import edu.kh.mind.selftest.model.dao.SelftestDAO;
import edu.kh.mind.selftest.model.vo.Selftest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SelftestServiceImpl implements SelftestService {

    @Autowired
    private SelftestDAO dao;

    @Override
    public List<Selftest> selectQ(Selftest selftest) {

        return dao.selectQ(selftest);
    }
}
