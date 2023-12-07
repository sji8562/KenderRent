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
                str = "반납 중";
            case 4:
                str = "소독 중";
        }

        return str;
    }
}
