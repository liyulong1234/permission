package com.offcn.service;

import com.offcn.bean.Sources;

import java.util.List;

public interface SourcesService {
    List<Sources> queryList(int pid);

    List<Sources> queryListToSave();

    void save(Sources sources);

    Sources querySourceByID(int id);

    void edit(Sources sources);

    void deleteOne(int id);
}
