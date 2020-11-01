package com.offcn.converter;

import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

//自定义实现日期字符串转成Date类型数据的
public class DateConverter implements Converter<String, Date> {
    //此方法实现类型的转换
    @Override
    public Date convert(String s) {
        try {
            //2020-10-9 String
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.parse(s);
        } catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
