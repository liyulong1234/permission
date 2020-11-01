package com.offcn.service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.bean.Forum;
import com.offcn.dao.ForumDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ForumServiceImpl implements ForumService {
    @Autowired
    private ForumDao forumDao;

    @Override
    public PageInfo<Forum> queryList(int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<Forum> list = forumDao.selectList();
        PageInfo<Forum> pageInfo = new PageInfo<>(list,5);
        return pageInfo;
    }
}
