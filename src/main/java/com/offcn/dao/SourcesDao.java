package com.offcn.dao;

import com.offcn.bean.Sources;

import java.util.List;

public interface SourcesDao {
    List<Sources> selectSourceByPid(int pid);

    List<Sources> selectSource();

    void insert(Sources sources);

    Sources selectSourceByID(int id);

    void update(Sources sources);

    void deleteOne(int id);
}
