package com.offcn.controller;

import com.github.pagehelper.PageInfo;
import com.offcn.bean.Role;
import com.offcn.service.RoleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;


    //分页列表展示
    @RequestMapping("list-role.do")
    @ResponseBody
    public PageInfo<Role> listRole(@RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "4") int pageSize){
        return roleService.queryList(currentPage,pageSize);
    }

    //保存功能实现
    @RequestMapping("save-role.do")
    @ResponseBody
    public Map<String,String> saveRole(Role role){

        //System.out.println(role);
        //System.out.println(role.getStaStr());
        roleService.save(role);

        Map<String,String>map = new HashMap<>();
        map.put("keyS","200");
        return map;
    }

    //修改页面回显角色数据，包括当前角色对应的资源
    @RequestMapping("show-role.do")
    @ResponseBody
    public Role showRole(int rid){
        return roleService.queryRoleByID(rid);
    }

    //修改功能实现
    @RequestMapping("update.do")
    @ResponseBody
    public Map<String,String>update(Role role){
        System.out.println(role.getStatus());
        roleService.edit(role);

        Map<String,String>map = new HashMap<>();
        map.put("keyS","200");
        return map;
    }

    ///////////////////////////////////////////////////
    //员工添加页面异步加载角色列表
    //springmvc中默认此处也会添加.do
    @RequestMapping("ajax-empsave-roleshow.do")
    @ResponseBody
    public List<Role> ajaxEmpsaveRoleshow(){
        return roleService.queryList();
    }
}
