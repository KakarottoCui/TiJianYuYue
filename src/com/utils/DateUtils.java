package com.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 
 * @date 2021/9/10
 */
public class DateUtils {
	 
    /**
     * 获取当前时间，格式是yyyy-MM-dd HH:mm:ss，
     * @param date
     * @return string
     */
    public static String getCurrnetDate() {
        Date date = new Date();
        String dateString = convertDateToString(date);
        return dateString;
    }
    

 
    public static String convertDateToString(Date date) {
        String dateString = "";
        if (null == date) {
            return dateString;
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateString = dateFormat.format(date);
        return dateString;
    }

}
