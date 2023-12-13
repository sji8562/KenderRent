package com.tenco.toyproject.controller;

import com.tenco.toyproject._core.utils.Define;
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
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("image")
public class ImageController {

    @PostMapping("upload")
    public String image(MultipartHttpServletRequest request) throws Exception {

        MultipartFile uploadFile = request.getFile("upload");

        System.out.println("upload file" + uploadFile);

        String originalFileName = uploadFile.getOriginalFilename();

        System.out.println("ORIGINAL NAME ===" + originalFileName);

        String ext = originalFileName.substring(originalFileName.indexOf("."));

        String newFileName = UUID.randomUUID() + ext;

        System.out.println("new file name" + newFileName);

        String saveDirectory = Define.UPLOAD_DIRECTORY;

        // 폴더가 없다면
        File dir = new File(saveDirectory);
        if(dir.exists() == false) {
            dir.mkdirs();
        }

        Path savePath = Paths.get(Define.UPLOAD_DIRECTORY + newFileName);
        Files.write(savePath, uploadFile.getBytes());


//        String realPath = request.getServletContext().getRealPath("/");
//
//        String savePath = realPath + "images/" + newFileName;
//
        String uploadPath = "./images/" + newFileName;

//        File file = new File(savePath);

//        uploadFile.transferTo(file);

        System.out.println("uploadPath" + uploadPath);

        return uploadPath;

    }

//    public ResponseEntity<String> handleFileUpload(@RequestParam("file") MultipartFile file) {
//
//        System.out.println("==== CKEDITOR 이미지 CONTORLLER ======");
//
//        System.out.println("FILE이 왔따 === " + file);
//
//        return ResponseEntity.ok().body("temp");
//    }
}
