package com.offcn.controller;

import com.github.pagehelper.PageInfo;
import com.offcn.bean.Archives;
import com.offcn.service.ArchiveService;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("emps")
public class ArchiveController {

    @Autowired
    private ArchiveService archiveService;

    //列表展示
    @RequestMapping("list-archive.do")
    @ResponseBody
    public PageInfo<Archives>listArchive(@RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "4") int pageSize){
        return archiveService.queryList(currentPage,pageSize);
    }

    //档案保存 --- Excel导入操作
    @RequestMapping("save-archive.do")
    @ResponseBody
    public Map<String,String> saveArchive(MultipartFile files) throws IOException {

        if(files != null && !files.isEmpty()){
            String originalFilename = files.getOriginalFilename();
            //首先先把上传文件保存到指定位置  用户端保存到服务器端
            String path = "E:\\pic" + originalFilename;
            File file = new File(path);
            files.transferTo(file);

            //从保存位置读取文件   服务器端硬盘读到内存
            InputStream is = new FileInputStream(file);

            //造集合对象封装数据
            List<Archives> list = new ArrayList<>();

            //创建文档对象 -- 把文件读给文档对象
            XSSFWorkbook workbook = new XSSFWorkbook(is);
            is.close();

            //文档对象读文件中的sheet表 -- 如果有多个sheet表，那么循环读取
            XSSFSheet hssfSheet = workbook.getSheetAt(0);

            //读到一个sheet表，从sheet表中一行一行的读取
            for (int i = 0;i <= hssfSheet.getLastRowNum();i++){
                //单元格中数据的封装 --- 一个格中的数据对应实体类对象中一个属性，每一行数据对应一个实体类对象，所有的sheet表对应一个集合
                Archives archive = new Archives();

                //读取到每一行，再从行中读取每一个单元格
                XSSFRow hssfRow = hssfSheet.getRow(i);
                //可能读取到的是空行，所以判断一下，如果是空行则跳过当前此循环
                if (hssfRow == null) {
                    continue;
                }

                //第一个单元格
                XSSFCell cell0 = hssfRow.getCell(0);
                //判断单元格是否为空，如果为空调到下一个单元格
                if (cell0 == null) {
                    continue;
                }
                archive.setSchool(cell0.getStringCellValue());

                //第二个单元格
                XSSFCell cell1 = hssfRow.getCell(1);
                //判断单元格是否为空，如果为空调到下一个单元格
                if (cell1 == null) {
                    continue;
                }
                archive.setDegree(cell1.getStringCellValue());

                //第三个单元格
                XSSFCell cell2 = hssfRow.getCell(2);
                //判断单元格是否为空，如果为空调到下一个单元格
                if (cell2 == null) {
                    continue;
                }
                archive.setSpecialty(cell2.getStringCellValue());

                //第四个单元格
                XSSFCell cell3 = hssfRow.getCell(3);
                //判断单元格是否为空，如果为空调到下一个单元格
                if (cell3 == null) {
                    continue;
                }
                archive.setPoliticc(cell3.getStringCellValue());

                //第五个单元格
                XSSFCell cell4 = hssfRow.getCell(4);
                //判断单元格是否为空，如果为空调到下一个单元格
                if (cell4 == null) {
                    continue;
                }
                archive.setEmail(cell4.getStringCellValue());

                //第六个单元格
                XSSFCell cell5 = hssfRow.getCell(5);
                //判断单元格是否为空，如果为空调到下一个单元格
                if (cell5 == null) {
                    continue;
                }
                archive.setNation(cell5.getStringCellValue());

                //第七个单元格
                XSSFCell cell6 = hssfRow.getCell(6);
                //判断单元格是否为空，如果为空调到下一个单元格
                if (cell6 == null) {
                    continue;
                }
                archive.setEmergencyper(cell6.getStringCellValue());

                //第八个单元格
                XSSFCell cell7 = hssfRow.getCell(7);
                //判断单元格是否为空，如果为空调到下一个单元格
                if (cell7 == null) {
                    continue;
                }
                double dou = cell7.getNumericCellValue();
                long lo = (long)dou;
                archive.setEmergencytel(lo + "");

                //第九个单元格
                XSSFCell cell8 = hssfRow.getCell(8);
                //判断单元格是否为空，如果为空调到下一个单元格
                if (cell8 == null) {
                    continue;
                }
                double dou2 = cell8.getNumericCellValue();
                int eid = (int)dou2;
                archive.setEmp_fk(eid);

                //把对象放入集合
                list.add(archive);
            }

            //for(Archives archive : list){
            //    System.out.println(archive);
            //}
            //集合数据向下传递--service--dao---数据库
            archiveService.save(list);

            //可以删除上传文件

        }

        Map<String,String>map = new HashMap<>();
        map.put("keyS","200");
        return map;
    }
}
