package com.offcn.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.bean.Archives;
import com.offcn.dao.ArchiveDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ArchiveServiceImpl implements ArchiveService{

    @Autowired
    private ArchiveDao archiveDao;

    @Override
    public PageInfo<Archives> queryList(int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<Archives> list = archiveDao.selectList();
        PageInfo<Archives>pageInfo = new PageInfo<>(list,5);
        return pageInfo;
    }

    //Excel表格的数据导入MySQL
    @Transactional
    @Override
    public void save(List<Archives> list) {
        //批量操作
        archiveDao.insertArchs(list);
    }
}
