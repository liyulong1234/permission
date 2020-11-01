package com.offcn.controller;

import com.alibaba.druid.pool.DruidDataSource;
import com.github.pagehelper.PageInfo;
import com.offcn.bean.Dept;
import com.offcn.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("dept")
public class DeptController {

    @Autowired
    private DeptService deptService;

    //分页实现列表展示
    @RequestMapping("list-dept.do")
    public String list(@RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "4") int pageSize, Model model){
        PageInfo<Dept> pageInfo = deptService.queryList(currentPage, pageSize);
        //转存request
        model.addAttribute("pageInfo",pageInfo);
        return "list-dept";
    }

    //保存功能
    @RequestMapping("save-dept.do")
    public String saveDept(Dept dept){
        //实现保存
        deptService.save(dept);
        //回列表
        return "redirect:/dept/list-dept.do";
    }

    //修改页面的显示
    @RequestMapping("update-dept.do")
    public String updateDept(int deptno,Model model){
        Dept dept = deptService.queryDeptByID(deptno);
        model.addAttribute("dept",dept);
        return "update-dept";
    }

    //修改功能
    @RequestMapping("update.do")
    public String update(Dept dept){
        deptService.edit(dept);
        return "redirect:/dept/list-dept.do";
    }

    //删除一项
    @RequestMapping("deleteOne.do")
    public String deleteOne(int deptno){
        deptService.deleteOne(deptno);
        return "redirect:/dept/list-dept.do";
    }

    //批量删除
    @RequestMapping("deleteMany.do")
    public String deleteMany(int[] ids){
        deptService.deleteMany(ids);
        return "redirect:/dept/list-dept.do";
    }

    /////////////////////////////////////////////
    //员工添加界面--部门展示
    @RequestMapping("ajax-empsave-deptshow.do")
    @ResponseBody
    public List<Dept>ajaxEmpsaveDeptshow(){
        return deptService.queryList();
    }
}
