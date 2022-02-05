package edu.kh.mind.selftest.model.service;


import edu.kh.mind.selftest.model.vo.Selftest;

import java.util.List;

public interface SelftestService {
    List<Selftest> selectQ(Selftest selftest);

}
