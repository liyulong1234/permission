package com.offcn.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.bean.Role;
import com.offcn.bean.RoleSources;
import com.offcn.dao.RoleDao;
import com.offcn.dao.RoleSourcesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService{

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private RoleSourcesDao roleSourcesDao;

    //查询所有角色
    @Override
    public List<Role> queryList() {
        return roleDao.selectList();
    }

    //分页列表展示
    @Override
    public PageInfo<Role> queryList(int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<Role> roles = roleDao.selectList();
        PageInfo<Role>pageInfo = new PageInfo<>(roles,5);
        return pageInfo;
    }

    //保存：角色表保存数据、角色和资源中间表保存数据
    @Transactional
    @Override
    public void save(Role role) {
        //先保存角色信息
        roleDao.insert(role);

        //获取自动生成的角色id
        Integer roleid = role.getRoleid();
        String sids = role.getSids();
        String[] split = sids.split(",");
        for(String sid : split){
            RoleSources rs = new RoleSources();
            rs.setRole_fk(roleid);
            rs.setResources_fk(Integer.parseInt(sid));
            rs.setRsdis("角色描述");
            //再保存中间表数据
            roleSourcesDao.insert(rs);
        }

    }

    //使用id查询一个角色数据，包括当前角色对应的资源
    @Override
    public Role queryRoleByID(int rid) {
        return roleDao.selectByID(rid);
    }

    //修改角色信息以及中间表信息
    @Transactional
    @Override
    public void edit(Role role) {
        //修改角色信息
        roleDao.update(role);

        //修改中间表信息 --- 先删除再添加
        Integer roleid = role.getRoleid();
        roleSourcesDao.deleteRoleID(roleid);

        String sids = role.getSids();
        if(null != sids && sids.length() > 0) {
            String[] split = sids.split(",");
            for (String s : split) {
                RoleSources rs = new RoleSources();
                rs.setRole_fk(roleid);
                rs.setResources_fk(Integer.parseInt(s));
                rs.setRsdis("角色描述");
                roleSourcesDao.insert(rs);
            }
        }
    }
}
