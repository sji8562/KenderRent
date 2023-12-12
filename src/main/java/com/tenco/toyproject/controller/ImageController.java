package com.tenco.toyproject.controller;

import com.tenco.toyproject.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/image")
public class ImageController {

//    private ImageService imageService;

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



    @PostMapping("/upload")
    public ResponseEntity<String> handleFileUpload(@RequestParam("file") MultipartFile file) {
        System.out.println("==== CKEDITOR 이미지 CONTORLLER ======");

        System.out.println("FILE이 왔따 === " + file);

        // 이미지를 저장하고 저장된 파일의 경로를 반환
//        String filePath = saveImage(file);

        // 클라이언트에게 파일 경로를 응답
//        return ResponseEntity.ok().body(filePath);
        return ResponseEntity.ok().body("temp");

//        ModelAndView mav = new ModelAndView("jsonView");
//
//        MultipartFile uploadFile = request.getFile("upload");
//
//        String originalFileName = uploadFile.getOriginalFilename();
//
//        String ext = originalFileName.substring(originalFileName.indexOf("."));
//
//        String newFileName = UUID.randomUUID() + ext;
//
//        String realPath = request.getServletContext().getRealPath("/");
//
//        String savePath = realPath + "upload/" + newFileName;
//
//        String uploadPath = "./upload/" + newFileName;
//
//        File file = new File(savePath);
//
//        uploadFile.transferTo(file);
//
//        mav.addObject("uploaded", true);
//        mav.addObject("url", uploadPath);
//
//        return mav;

    }
}
