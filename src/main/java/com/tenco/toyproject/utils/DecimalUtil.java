package com.tenco.toyproject.utils;

import java.text.DecimalFormat;

public class DecimalUtil {

    public static String decimalToString(int amount) {
        DecimalFormat df = new DecimalFormat("#,###");
        String formatNumber = df.format(amount);
        return formatNumber;
    }
}