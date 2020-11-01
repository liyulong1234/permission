package com.offcn.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.bean.Dept;
import com.offcn.dao.DeptDao;
import com.offcn.dao.EmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService{
    @Autowired
    private DeptDao deptDao;
    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public PageInfo<Dept> queryList(int currentPage, int pageSize) {
        //固定顺序
        PageHelper.startPage(currentPage,pageSize);//利用收到的参数实现分页
        List<Dept> depts = deptDao.selectList();
        PageInfo<Dept> pageInfo = new PageInfo<>(depts,5);//第二个参数是页面中显示的页码数量
        return pageInfo;
    }

    //查询所有
    @Override
    public List<Dept> queryList() {
        return deptDao.selectList();
    }

    //保存功能
    @Transactional
    @Override
    public void save(Dept dept) {
        deptDao.insert(dept);
    }

    //按照主键查询的方法
    @Override
    public Dept queryDeptByID(int deptno) {
        return deptDao.selectDeptByID(deptno);
    }

    //修改功能
    @Transactional
    @Override
    public void edit(Dept dept) {
        deptDao.update(dept);
    }

    //删除一项
    @Transactional
    @Override
    public void deleteOne(int deptno) {
        //外键关联---删除上层的数据，下层表格外键制约，不允许删除
        //解决方案：一种是先把下层关联字段的数据值改为null；另一种是先删除下层，再删除上层
        //采用第一种
        //先把关联值改为null
        employeeDao.updateDeptId(deptno);
        // ,再删除
        deptDao.deleteOne(deptno);
    }

    //删除功能
    @Transactional
    @Override
    public void deleteMany(int[] ids) {
        for(int id : ids){
            deleteOne(id);
        }
    }


}
