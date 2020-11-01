package com.offcn.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.bean.ConditionBean;
import com.offcn.bean.EmpBean;
import com.offcn.bean.EmpRole;
import com.offcn.bean.Employee;
import com.offcn.dao.EmpRoleDao;
import com.offcn.dao.EmployeeDao;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService{

    @Autowired
    private EmployeeDao employeeDao;
    @Autowired
    private EmpRoleDao empRoleDao;//员工和角色中间表dao

    //分页查询员工列表
    @Override
    public PageInfo<Employee> queryList(int currentPage, int pageSize, ConditionBean conditionBean) {
        PageHelper.startPage(currentPage,pageSize);
        List<Employee> list = employeeDao.selectList(conditionBean);
        PageInfo<Employee>pageInfo = new PageInfo<>(list,5);
        return pageInfo;
    }

    //保存功能
    @Transactional
    @Override
    public void save(EmpBean empBean) {

        Employee employee = empBean.getEmp();
        //要对密码进行加密处理：在数据库中保存的时候不使用明文，要使用密文
        //加密处理的方式很多：md5   password

        //获取到原密码
        String password = employee.getPassword();
        //加密
        password = DigestUtils.md5Hex(password);

        employee.setPassword(password);

        //保存员工数据
        employeeDao.insert(employee);


        EmpRole empRole = new EmpRole();
        empRole.setRole_fk(empBean.getRole_fk());
        empRole.setEmp_fk(employee.getEid());
        empRole.setErdis(employee.getEname()+"的"+empBean.getRole_fk()+"角色");
        //保存中间表数据
        empRoleDao.insert(empRole);
    }

    //删除一项
    @Transactional
    @Override
    public void deleteOne(int eid) {
        //先删除中间表数据
        empRoleDao.deleteByEmpID(eid);

        //先获取到员工的文件，然后再删除
        Employee employee = employeeDao.selectByID(eid);
        String pic = employee.getPic();
        String path = "C:\\Users\\Administrator\\Desktop\\upload";
        File file = new File(path,pic);
        file.delete();

        //再删除员工数据
        employeeDao.deleteOne(eid);

    }

    //批量删除
    @Transactional
    @Override
    public void deleteMany(int[] ids) {
        for(int id : ids){
            deleteOne(id);
        }
    }

    //按照id查员工，同时还要查角色id
    @Override
    public EmpBean queryEmployeeByID(int eid) {
        //查询某个员工信息
        Employee employee = employeeDao.selectByID(eid);
        //查当前这位员工对应的角色id
        int rid = empRoleDao.selectRoleIdByEmployeeID(eid);

        EmpBean empBean = new EmpBean();
        empBean.setEmp(employee);
        empBean.setRole_fk(rid);

        return empBean;
    }

    //修改员工信息以及员工对应的角色信息
    @Transactional
    @Override
    public void edit(EmpBean empBean) {
        Employee emp = empBean.getEmp();
        //修改员工信息
        employeeDao.update(emp);

        //变动中间表的信息 --- 先按照员工id删除、再添加新的
        Integer eid = emp.getEid();
        empRoleDao.deleteByEmpID(eid);

        EmpRole empRole = new EmpRole();
        empRole.setEmp_fk(eid);
        empRole.setRole_fk(empBean.getRole_fk());
        empRole.setErdis(emp.getEname() + "的角色");

        empRoleDao.insert(empRole);
    }

    //按照一组id查询一组员工数据
    @Override
    public List<Employee> queryEmployeeByIDS(int[] ids) {
        return employeeDao.selectByIDS(ids);
    }

    //登录验证方法
    @Override
    public Employee login(String username, String userpwd) {
        //两种实现方案：
        //第一种：SELECT * FROM employee WHERE username = 'xiaozao' AND PASSWORD = MD5('123');
        //意思是把原始密码送入数据库，在数据库中调用加密函数先加密再判断 --- 缺点，需要数据库提供相应的加密函数

        //第二种：前提用户名不能重复，先使用用户名进行查询，查回来一个用户信息(有可能查不回来)，对原始密码在此处加密和从库中查回来的密码对比
        Employee employee = employeeDao.selectEmployeeByUsername(username);
        if(employee != null){
            String password = employee.getPassword();
            if(userpwd != null){
                userpwd = DigestUtils.md5Hex(userpwd);
                if(password.equals(userpwd)){
                    //密码处理一下
                    employee.setPassword(null);
                    return employee;
                }
            }
        }
        return null;
    }

    //修改密码
    @Transactional
    @Override
    public void updatePassword(String newpassword, Integer eid) {
        newpassword = DigestUtils.md5Hex(newpassword);
        employeeDao.updatePassword(newpassword,eid);
    }
}
