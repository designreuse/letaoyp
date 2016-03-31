package com.iac.letaoyp.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;

public class DateUtil extends DateUtils {

	public static final String DEFAULT_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	private static final String[] parsePatterns = new String[] {  
        "yyyy-MM-dd HH:mm:ss",
        "yyyy-MM-dd HH:mm",
        "yyyy-MM-dd",
        "MM/dd/yyyy HH:mm:ss",  
        "MM/dd/yyyy"
        // 这里可以增加更多的日期格式，用得多的放在前面  
    };  
	
	public static String format(Date date, String format) {
		if(date == null) return "";
		
		SimpleDateFormat df = new SimpleDateFormat(StringUtils.defaultIfEmpty(
				format, DEFAULT_FORMAT));
		return df.format(date);
	}
	
	public static String format(Date date) {
		return format(date, DEFAULT_FORMAT);
	}

	public static Date parse(String date) {
		try {
			return parseDate(date, parsePatterns);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
