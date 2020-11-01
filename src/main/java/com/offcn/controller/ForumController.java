package com.offcn.controller;

import com.github.pagehelper.PageInfo;
import com.offcn.bean.Forum;
import com.offcn.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("forum")
public class ForumController {
    @Autowired
    private ForumService forumService;
    @RequestMapping("list-forum.do")
    @ResponseBody
    private PageInfo<Forum> listForum(@RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "4") int pageSize){
        return forumService.queryList(currentPage,pageSize);
    }
}
