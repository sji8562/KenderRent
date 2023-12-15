package com.tenco.toyproject._core.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class DateUtil {
    public static String dateToString(Timestamp date) {
        if(date != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            return sdf.format(date);
        } else {
            return "-";
        }

    }
}
