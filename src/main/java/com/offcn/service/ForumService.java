package com.offcn.service;

import com.github.pagehelper.PageInfo;
import com.offcn.bean.Forum;

public interface ForumService {
    PageInfo<Forum> queryList(int currentPage,int pageSize);
}
