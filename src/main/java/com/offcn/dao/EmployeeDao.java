package com.offcn.dao;

import com.offcn.bean.ConditionBean;
import com.offcn.bean.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeDao {
    void updateDeptId(int deptno);

    List<Employee> selectList(ConditionBean conditionBean);

    void insert(Employee emp);

    void deleteOne(int eid);

    Employee selectByID(int eid);

    void update(Employee emp);

    List<Employee> selectByIDS(int[] ids);

    Employee selectEmployeeByUsername(String username);

    void updatePassword(@Param("np") String newpassword, @Param("eid") Integer eid);
}
