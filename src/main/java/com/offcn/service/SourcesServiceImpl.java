package com.offcn.service;

import com.offcn.bean.Sources;
import com.offcn.dao.SourcesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SourcesServiceImpl implements SourcesService{

    @Autowired
    private SourcesDao sourcesDao;

    @Override
    public List<Sources> queryList(int pid) {
        List<Sources>list = sourcesDao.selectSourceByPid(pid);
        //递归方法，进去的时候没有子数据，出来的时候有了子数据
        list = change(list);
        return list;
    }

    //查询资源列表在添加数据下拉框显示
    @Override
    public List<Sources> queryListToSave() {
        return sourcesDao.selectSource();
    }

    //添加功能
    @Transactional
    @Override
    public void save(Sources sources) {
        sourcesDao.insert(sources);
    }

    //主键查询
    @Override
    public Sources querySourceByID(int id) {
        return sourcesDao.selectSourceByID(id);
    }

    //修改数据
    @Transactional
    @Override
    public void edit(Sources sources) {
        sourcesDao.update(sources);
    }

    @Override
    public void deleteOne(int id) {
        sourcesDao.deleteOne(id);
    }

    private List<Sources> change(List<Sources> list) {
        if(list != null && list.size() > 0){
            //遍历list集合 --- 父
            for(Sources source : list){
                source.setUrl(null);
                //父 -- 49
                Integer id = source.getId();
                //通过父找子  根据49查子  二代
                List<Sources> children = sourcesDao.selectSourceByPid(id);

                if(children != null && children.size() > 0) {
                    //通过子再找子  二代找三代
                    children = change(children);

                    //给父设置子
                    source.setChildren(children);

                    source.setParent(true);
                }
            }
        }
        return list;
    }
}
