package com.offcn.dao;

import com.offcn.bean.EmpRole;

import java.util.List;

public interface EmpRoleDao {
    void insert(EmpRole empRole);

    void deleteByEmpID(int eid);

    int selectRoleIdByEmployeeID(int eid);

    List<Integer> selectRoleIds(Integer eid);
}
