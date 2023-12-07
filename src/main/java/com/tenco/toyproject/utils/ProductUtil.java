package com.tenco.toyproject.utils;

import java.text.DecimalFormat;

public class ProductUtil {
    public static String statusToString(int status) {
        var str = "재고 있음";

        switch (status) {
            case 2:
                str = "대여 중";
                break;
            case 3:
                str = "소독 중";
            case 4:
                str = "판매 완료";
        }

        return str;
    }

    public static String gradeToString(int grade) {
        String condition = null;
        if (grade == 1) {
            condition = "최상";
        } else if (grade == 2) {
            condition = "상";
        } else if (grade == 3) {
            condition = "중";
        } else if (grade == 4) {
            condition = "하";
        } else {
            condition = "최하";
        }

        return condition;
    }
}
