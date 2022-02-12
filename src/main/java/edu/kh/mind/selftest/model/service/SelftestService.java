package edu.kh.mind.selftest.model.service;


import edu.kh.mind.selftest.model.vo.Selftest;

import java.util.List;
import java.util.Map;

public interface SelftestService {
    Map<String, Object> selectQ(Selftest selftest);

}
