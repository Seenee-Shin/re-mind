package edu.kh.mind.member.model.service;

import edu.kh.mind.member.model.dao.MyDAO;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyServiceImpl implements MyService {

    @Autowired
    private MyDAO dao;

    @Override
    public List<ProfessionHospital> loadProMap() {
        return dao.loadProMap();
    }
}
