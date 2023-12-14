package com.tenco.toyproject._core.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class DateUtil {
    public static String dateToString(Timestamp date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }
}
