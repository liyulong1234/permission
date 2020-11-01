package com.offcn.dao;

import com.offcn.bean.Archives;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArchiveDao {
    List<Archives> selectList();

    void insertArchs(@Param("list") List<Archives> list);
}
