package com.offcn.service;

import com.github.pagehelper.PageInfo;
import com.offcn.bean.Role;

import java.util.List;

public interface RoleService {
    List<Role> queryList();

    PageInfo<Role> queryList(int currentPage, int pageSize);

    void save(Role role);

    Role queryRoleByID(int rid);

    void edit(Role role);
}
