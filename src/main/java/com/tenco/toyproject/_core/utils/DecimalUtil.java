package com.tenco.toyproject._core.utils;

import java.text.DecimalFormat;

public class DecimalUtil {

    public static String decimalToString(Long amount) {
        DecimalFormat df = new DecimalFormat("#,###");
        String formatNumber = df.format(amount);
        return formatNumber;
    }
}