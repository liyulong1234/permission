package com.offcn.service;

import com.github.pagehelper.PageInfo;
import com.offcn.bean.Dept;

import java.util.List;

public interface DeptService {
    PageInfo<Dept> queryList(int currentPage, int pageSize);
    List<Dept> queryList();

    void save(Dept dept);

    Dept queryDeptByID(int deptno);

    void edit(Dept dept);

    void deleteOne(int deptno);

    void deleteMany(int[] ids);


}
