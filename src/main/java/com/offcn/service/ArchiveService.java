package com.offcn.service;

import com.github.pagehelper.PageInfo;
import com.offcn.bean.Archives;

import java.util.List;

public interface ArchiveService {
    PageInfo<Archives> queryList(int currentPage, int pageSize);

    void save(List<Archives> list);
}
