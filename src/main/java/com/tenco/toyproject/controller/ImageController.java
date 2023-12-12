package com.tenco.toyproject.controller;

import com.tenco.toyproject.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/image")
public class ImageController {

    private ImageService imageService;

//    @Autowired
//    public ImageController(ImageService imageService) {
//        this.imageService = imageService;
//    }

//    @PostMapping("/upload")
//    @ResponseBody
//    public String imageUpload(MultipartRequest request) throws Exception {
//        Map<String, Object> responseData = new HashMap<>();
//
//        try {
////            String s3Url = imageService.imageUpload(request);
//            String imageUrl = imageService.imageUpload(request);
//
//            System.out.println("S3 URL이 뭔데? " + imageUrl);
//
////            responseData.put("uploaded", true);
////            responseData.put("url", s3Url);
//
////            return responseData;
//            return imageUrl;
//
//        } catch (Exception e) {
//            responseData.put("uploaded", false);
////            return responseData;
//            return e.toString();
//        }
//    }



    @PostMapping("upload")
    public ModelAndView image(MultipartHttpServletRequest request) throws Exception {

        ModelAndView mav = new ModelAndView("jsonView");

        MultipartFile uploadFile = request.getFile("upload");

        String originalFileName = uploadFile.getOriginalFilename();

        String ext = originalFileName.substring(originalFileName.indexOf("."));

        String newFileName = UUID.randomUUID() + ext;

        String realPath = request.getServletContext().getRealPath("/");

        String savePath = realPath + "upload/" + newFileName;

        String uploadPath = "./upload/" + newFileName;

        File file = new File(savePath);

        uploadFile.transferTo(file);

        mav.addObject("uploaded", true);
        mav.addObject("url", uploadPath);

        return mav;

    }

}
