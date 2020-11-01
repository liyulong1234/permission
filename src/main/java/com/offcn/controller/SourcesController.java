package com.offcn.controller;

import com.offcn.bean.Sources;
import com.offcn.service.SourcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("resources")
public class SourcesController {

    @Autowired
    private SourcesService sourcesService;


    //树结构展示资源数据 --- 送回json串 --- 符合ztree所要的结构
    @RequestMapping("list-resources.do")
    @ResponseBody
    public List<Sources> listResources(){
        //service层的方法相对灵活一些
        return sourcesService.queryList(0);
    }

    //添加界面，父项下拉列表框展示信息
    @RequestMapping("ajax-save-list.do")
    @ResponseBody
    public List<Sources>ajaxSaveList(){
        return sourcesService.queryListToSave();
    }


    //保存功能
    @RequestMapping("save-source.do")
    @ResponseBody
    public Map<String,String> saveSource(Sources sources){
        sourcesService.save(sources);

        Map<String,String>map = new HashMap<>();
        map.put("keyS","200");
        return map;
    }

    //修改页面数据回显
    @RequestMapping("show-update-source.do")
    @ResponseBody
    public Sources showUpdateSource(int id){
        return sourcesService.querySourceByID(id);
    }

    //修改功能实现
    @RequestMapping("update.do")
    @ResponseBody
    public Map<String,String>update(Sources sources){
        sourcesService.edit(sources);

        Map<String,String>map = new HashMap<>();
        map.put("keyS","200");
        return map;
    }

    //删除操作
    @RequestMapping("delete.do")
    @ResponseBody
    public Map<String,String>delete(int id){
        sourcesService.deleteOne(id);

        Map<String,String>map = new HashMap<>();
        map.put("keyS","200");
        return map;
    }
}
