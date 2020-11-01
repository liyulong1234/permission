package com.offcn.dao;

import com.offcn.bean.RoleSources;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleSourcesDao {
    void insert(RoleSources rs);

    List<RoleSources> selectRoleSourceByRoleID(int roleid);

    void deleteRoleID(Integer roleid);

    List<Integer> selectSourceIdByRoleIds(@Param("rids") List<Integer> rids);
}
