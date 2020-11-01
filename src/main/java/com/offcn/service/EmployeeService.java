package com.offcn.service;

import com.github.pagehelper.PageInfo;
import com.offcn.bean.ConditionBean;
import com.offcn.bean.EmpBean;
import com.offcn.bean.Employee;

import java.util.List;

public interface EmployeeService {
    PageInfo<Employee> queryList(int currentPage, int pageSize, ConditionBean conditionBean);

    void save(EmpBean empBean);

    void deleteOne(int eid);

    void deleteMany(int[] ids);

    EmpBean queryEmployeeByID(int eid);

    void edit(EmpBean empBean);

    List<Employee> queryEmployeeByIDS(int[] ids);

    Employee login(String username, String userpwd);

    void updatePassword(String newpassword, Integer eid);
}
