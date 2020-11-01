package com.offcn.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.offcn.bean.Employee;
import com.offcn.bean.ResultBean;
import com.offcn.service.ResultBeanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("main")
public class MainController {

    @Autowired
    private ResultBeanService resultBeanService;

    @Autowired
    private JedisPool jedisPool;



    @RequestMapping("show-echarts.do")
    @ResponseBody
    public List<ResultBean> showEcharts(){
        return resultBeanService.queryList();
    }


    //首页左侧导航
    @RequestMapping("show-nav.do")
    @ResponseBody
    public Map<String,String> showNav(@CookieValue("emp_redis") String key) throws JsonProcessingException {
        Jedis jedis = jedisPool.getResource();
        String value = jedis.get(key);
        ObjectMapper om = new ObjectMapper();
        Employee employee = om.readValue(value, Employee.class);

        //通过员工获取员工的id
        Integer eid = employee.getEid();

        //根据用户查资源
        Map<String,String>map = resultBeanService.querySourcesByEmployeeID(eid);

        return map;
    }
}
