package com.offcn.dao;

import com.offcn.bean.Dept;

import java.util.List;

public interface DeptDao {
    List<Dept> selectList();

    void insert(Dept dept);

    Dept selectDeptByID(int deptno);

    void update(Dept dept);

    void deleteOne(int deptno);
}
