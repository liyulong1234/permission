package com.offcn.dao;

import com.offcn.bean.Role;

import java.util.List;

public interface RoleDao {
    List<Role> selectList();

    void insert(Role role);

    Role selectByID(int rid);

    void update(Role role);
}
