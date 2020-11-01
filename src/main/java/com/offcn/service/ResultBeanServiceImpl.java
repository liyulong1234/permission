package com.offcn.service;

import com.offcn.bean.ResultBean;
import com.offcn.bean.Sources;
import com.offcn.dao.EmpRoleDao;
import com.offcn.dao.ResultBeanDao;
import com.offcn.dao.RoleSourcesDao;
import com.offcn.dao.SourcesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ResultBeanServiceImpl implements ResultBeanService{

    @Autowired
    private ResultBeanDao resultBeanDao;

    @Autowired
    private EmpRoleDao empRoleDao;

    @Autowired
    private RoleSourcesDao roleSourcesDao;

    @Autowired
    private SourcesDao sourcesDao;

    //实现首页中图表数据展示
    @Override
    public List<ResultBean> queryList() {
        return resultBeanDao.selectList();
    }

    //根据用户id查资源
    @Override
    public Map<String, String> querySourcesByEmployeeID(Integer eid) {
        Map<String,String>map = new HashMap<>();
        //根据用户id，查用户对应的角色id，可能有多个角色id
        List<Integer> rids = empRoleDao.selectRoleIds(eid);
        if(rids != null && rids.size() > 0){
            //根据一组角色id，找角色对应的资源id
            List<Integer>sids = roleSourcesDao.selectSourceIdByRoleIds(rids);
            if(sids != null && sids.size() > 0){
                //通过一组资源id，找对应的资源
                for(int sid : sids){
                    //通过主键查询获取到资源
                    Sources source = sourcesDao.selectSourceByID(sid);
                    map.put(source.getName(),source.getUrl());
                }
            }
        }
        return map;
    }
}
