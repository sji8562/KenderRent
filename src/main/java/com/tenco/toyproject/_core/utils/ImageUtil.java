package com.tenco.toyproject._core.utils;

public class ImageUtil {
    public static String checkImageUrl(String image) {
        String imageUrl = "/assets/images/empty_img.jpg";

        if (image != null) {
            imageUrl = Define.UPLOAD_DIRECTORY + "/" + image;
//            imageUrl = image;
        }

        return imageUrl;
    }
}
