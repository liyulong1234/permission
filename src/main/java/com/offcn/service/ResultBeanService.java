package com.offcn.service;

import com.offcn.bean.ResultBean;

import java.util.List;
import java.util.Map;

public interface ResultBeanService {
    List<ResultBean> queryList();

    Map<String, String> querySourcesByEmployeeID(Integer eid);
}
