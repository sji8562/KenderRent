package com.tenco.toyproject.controller;

import com.tenco.toyproject._core.utils.Define;
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
@RequestMapping("/image")
public class ImageController {

    @PostMapping("/upload")
    @ResponseBody
    public String image(MultipartHttpServletRequest request) throws Exception {

        try {
            MultipartFile uploadFile = request.getFile("upload");

            if (uploadFile == null || uploadFile.isEmpty()) {
                return "NO file uploaded";
            }

            String originalFileName = uploadFile.getOriginalFilename();
            String ext = originalFileName.substring(originalFileName.indexOf("."));
            String newFileName = UUID.randomUUID() + ext;

            String saveDirectory = Define.UPLOAD_DIRECTORY;

            File dir = new File(saveDirectory);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            Path savePath = Paths.get(saveDirectory, newFileName);
            Files.write(savePath, uploadFile.getBytes());
//
            String uploadPath = "/images/" + newFileName;

//        File file = new File(savePath);

//        uploadFile.transferTo(file);

            System.out.println("Uploaded file path: " + uploadPath);

            return uploadPath;
        } catch (Exception e) {
            e.printStackTrace();
            return "Upload failed: " + e.getMessage();
        }


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
