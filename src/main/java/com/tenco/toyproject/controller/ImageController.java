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

@Controller
@RequestMapping("/upload")
public class ImageController {

    @PostMapping("/image")
    public ResponseEntity<String> handleFileUpload(@RequestParam("file") MultipartFile file) {


        System.out.println("==== CKEDITOR 이미지 CONTORLLER ======");

        System.out.println("FILE이 왔따 === " + file);

        return ResponseEntity.ok().body("temp");
    }
}
