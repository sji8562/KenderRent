package com.tenco.toyproject.utils;

public class ImageUtil {
    public static String checkImageUrl(String image) {
        String imageUrl = "/assets/images/empty_img.jpg";
        if (image != null) {
            imageUrl = image;
        }

        return imageUrl;
    }
}
