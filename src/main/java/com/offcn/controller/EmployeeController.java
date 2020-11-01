package com.offcn.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import com.offcn.bean.ConditionBean;
import com.offcn.bean.EmpBean;
import com.offcn.bean.Employee;
import com.offcn.service.EmployeeService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("emps")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    //注入连接池--Redis
    @Autowired
    private JedisPool jedisPool;

    //分页异步展示员工列表
    @RequestMapping("list-employee.do")
    @ResponseBody
    public PageInfo<Employee>listEmployee(@RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "4") int pageSize, ConditionBean conditionBean){
        //System.out.println(conditionBean.getCaption()+"-----"+conditionBean.getKeyword());
        //conditionBean对象封装这查询条件，但是有可能有、有可能无
        //有条件就是按照条件查询，无条件就是相当于页面刚展示的时候查询所有
        return employeeService.queryList(currentPage,pageSize,conditionBean);
    }

    //保存功能
    @RequestMapping("save-employee.do")
    @ResponseBody
    public Map<String,String> saveEmployee(EmpBean empBean, MultipartFile upload) throws IOException {
        //System.out.println(empBean.getEmp());
        //System.out.println(empBean.getRole_fk());
        //String originalFilename = upload.getOriginalFilename();
        //System.out.println(originalFilename);
        if(upload != null && !upload.isEmpty()){
            String originalFilename = upload.getOriginalFilename();
            String newName = UUID.randomUUID().toString().replaceAll("-","") + "_" + originalFilename;
            File file = new File("E:\\pic",newName);
            upload.transferTo(file);
            Employee emp = empBean.getEmp();
            emp.setPic(newName);
        }

        employeeService.save(empBean);

        Map<String,String>map = new HashMap<>();
        map.put("keyS","200");
        return map;
    }

    //删除一项
    @RequestMapping("deleteone.do")
    @ResponseBody
    public Map<String,String>deleteOne(int eid){
        employeeService.deleteOne(eid);

        Map<String,String>map = new HashMap<>();
        map.put("keyS","200");
        return map;
    }

    //批量删除
    @RequestMapping("deletemany.do")
    @ResponseBody
    public Map<String,String>deleteMany(int[] ids){
        employeeService.deleteMany(ids);

        Map<String,String>map = new HashMap<>();
        map.put("keyS","200");
        return map;
    }


    //修改员工信息---员工信息的回显
    @RequestMapping("show-employee.do")
    @ResponseBody
    public EmpBean showEmployee(int eid){
        //System.out.println(eid);

        EmpBean empBean = employeeService.queryEmployeeByID(eid);

        return empBean;
    }

    //修改功能的实现
    @RequestMapping("update-employee.do")
    @ResponseBody
    public Map<String,String>updateEmployee(EmpBean empBean,MultipartFile upload) throws IOException {
        //判断 -- 判断文件是否上传
        if(upload != null && !upload.isEmpty()){
            //删除原来的图片，添加新的图片
            String pic = empBean.getEmp().getPic();
            String path = "E:\\pic";
            File file = new File(path,pic);
            file.delete();

            String originalFilename = upload.getOriginalFilename();
            String newName = UUID.randomUUID().toString().replaceAll("-","") + "_" + originalFilename;
            file = new File(path,newName);
            upload.transferTo(file);

            empBean.getEmp().setPic(newName);
        }

        employeeService.edit(empBean);
        Map<String,String>map = new HashMap<>();
        map.put("keyS","200");
        return map;
    }


    //导出数据到Excel
    @RequestMapping("exportToExcel.xlsx")
    public String exportToExcel(int[] ids, HttpServletResponse response)throws Exception{
        //for(int id : ids)
        //    System.out.println(id);

        //导出Excel的操作
        //准备数据 --- 要被导出的数据
        //一种思路
        /*
        List<Employee> list = new ArrayList<>();
        for(int id : ids) {
            EmpBean empBean = employeeService.queryEmployeeByID(id);
            list.add(empBean.getEmp());
        }*/

        //另一种思路：直接根据IDS查询--在mybatis中采用循环标签
        List<Employee>list = employeeService.queryEmployeeByIDS(ids);

        //导出到Excel --- 导出到服务器端 -- 形成Excel文件
        /*
        * 1、创建一个Excel文档文件对象
        * 2、创建文档中包含的sheet表格对象
        * 3、创建sheet表中标题行对象
        * 4、在标题行内创建单元格对象--多个/一个标题对应一个单元格
        *
        * 5、创建内容行对象(会有多个，保存每一行数据内容)
        * 6、创建内容行中包含的内容单元(每行多个，保存每个值--一行中每个标题对应的值)
        *
        * 7、通过流写出为文件
        * */

        //文档对象
        SXSSFWorkbook workbook = new SXSSFWorkbook(1000);//缓存
        //是否设置临时文件
        workbook.setCompressTempFiles(true);
        //创建表格sheet
        SXSSFSheet sheet = workbook.createSheet("emp");

        //先创建标题数组
        String[] captions = {"编号","姓名","性别","年龄","电话","入职时间","身份号码","备注"};
        //创建标题行
        SXSSFRow headerRow = sheet.createRow(0);//第一行，下标为0
        //单元格对象的声明，未初始化
        SXSSFCell headerCell = null;
        for(int i = 0;i < captions.length;i++){
            //单元格初始化
            headerCell = headerRow.createCell(i);//从0开始第一个单元
            //给单元格填充标题值
            headerCell.setCellValue(captions[i]);
        }

        //数据行
        for(int i = 0;i < list.size();i++){
            Employee employee = list.get(i);
            //创建一个数据行
            SXSSFRow row = sheet.createRow(i + 1);
            //声明单元格
            SXSSFCell cell = null;

            int te = 0;
            //设置编号值
            cell = row.createCell(te++);
            cell.setCellValue(employee.getEid());

            //设置姓名
            cell = row.createCell(te++);
            cell.setCellValue(employee.getEname());

            //设置性别
            cell = row.createCell(te++);
            cell.setCellValue(employee.getEsex());

            //年龄
            cell = row.createCell(te++);
            cell.setCellValue(employee.getEage());

            //设置电话
            cell = row.createCell(te++);
            cell.setCellValue(employee.getTelephone());

            //入职时间
            Date hiredate = employee.getHiredate();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String format = sdf.format(hiredate);

            cell = row.createCell(te++);
            cell.setCellValue(format);

            //号码
            cell = row.createCell(te++);
            cell.setCellValue(employee.getPnum());

            //备注
            cell = row.createCell(te++);
            cell.setCellValue(employee.getRemark());
        }

        /*
        //写出为文件
        String path = "C:\\Users\\Administrator\\Desktop\\upload\\employee.xlsx";
        FileOutputStream fileOut = new FileOutputStream(path);
        workbook.write(fileOut);
        fileOut.close();

        //下载给用户
        //一个头、两个流
        response.setHeader("content-disposition","attachment;filename=employee.xlsx");
        //读入流
        InputStream fis = new FileInputStream(path);
        //写出流
        OutputStream os = response.getOutputStream();
        //边读边写
        int len = -1;
        byte[]bs = new byte[1024];
        while ((len = fis.read(bs)) != -1){
            os.write(bs,0,len);
        }
        //释放资源
        os.close();
        fis.close();
        */

        //采用默认文件名 --- 当前请求url
        OutputStream os = response.getOutputStream();
        workbook.write(os);
        os.close();

        return "redirect:/emps/list-employee.jsp";
    }


    ///登录功能实现
    @RequestMapping("login.do")
    public String login(String username, String userpwd, HttpServletRequest request,HttpServletResponse response) throws JsonProcessingException {
        System.out.println(username+"---"+userpwd);
        //登录验证 --- 用户信息登录成功保存到session--用redis模拟session
        Employee employee = employeeService.login(username,userpwd);
        if(employee != null) {
            //使用redis模拟session完成用户的缓存
            //获取到jedis对象-单一对象-从池子中
            Jedis jedis = jedisPool.getResource();
            ObjectMapper om = new ObjectMapper();

            String key = UUID.randomUUID().toString().replaceAll("-","");
            String value = om.writeValueAsString(employee);

            jedis.set(key,value);

            jedis.expire(key,1800);//可以考虑使用拦截器或者过滤器实现有效时间的不断更新

            jedis.close();

            //key的获取范围扩大--使用cookie
            Cookie co = new Cookie("emp_redis",key);

            //扩大cookie的作用范围
            //通过request获取项目名称
            co.setPath(request.getServletContext().getContextPath());

            response.addCookie(co);

            return "redirect:/index.jsp";
        }else {
            //登录不成功，提示信息
            return "redirect:/login.jsp?flag=error";
        }
    }


    //给主页返回用户名称
    @RequestMapping("show-username.do")
    @ResponseBody
    public Employee showUsername(@CookieValue("emp_redis") String key) throws JsonProcessingException {
        //拿到radis对应的key值value---->
        Jedis jedis = jedisPool.getResource();
        String value = jedis.get(key);
        //将String类型的value值转换成对象类型的数据类型
        ObjectMapper om = new ObjectMapper();
        Employee employee = om.readValue(value, Employee.class);
        jedis.close();
        return employee;
    }

    //在修改密码的时候，检验旧密码是否正确
    @RequestMapping("checkOldPassword.do")
    @ResponseBody
    public Map<String,Boolean>checkOldPassword(@CookieValue("emp_redis") String key,String oldpassword) throws JsonProcessingException {
        Map<String,Boolean>map = new HashMap<>();
        map.put("chpassword",false);

        Jedis jedis = jedisPool.getResource();
        String value = jedis.get(key);
        ObjectMapper om = new ObjectMapper();
        Employee employee = om.readValue(value, Employee.class);
        jedis.close();

        Integer eid = employee.getEid();
        EmpBean empBean = employeeService.queryEmployeeByID(eid);
        Employee emp = empBean.getEmp();

        if(oldpassword != null){
            oldpassword = DigestUtils.md5Hex(oldpassword);
            String password = emp.getPassword();
            if(oldpassword.equals(password)){
                map.put("chpassword",true);
            }
        }

        return map;
    }

    //修改密码实现
    @RequestMapping("updatepwd.do")
    public String updatePassword(@CookieValue("emp_redis") String key,String newpassword) throws JsonProcessingException {
        Jedis jedis = jedisPool.getResource();
        String value = jedis.get(key);
        ObjectMapper om = new ObjectMapper();
        Employee employee = om.readValue(value, Employee.class);

        employeeService.updatePassword(newpassword,employee.getEid());

        //Redis中键值对清空，重新登录
        jedis.expire(key,0);
        jedis.close();

        return "redirect:/login.jsp";
    }

    //安全退出---登出操作
    @RequestMapping("logout.do")
    public String logout(@CookieValue("emp_redis") String key){
        //清除缓存
        Jedis jedis = jedisPool.getResource();
        String value = jedis.get(key);
        //Redis中键值对清空，重新登录
        jedis.expire(key,0);
        jedis.close();

        //返回登录页面
        return "redirect:/login.jsp";
    }
}
