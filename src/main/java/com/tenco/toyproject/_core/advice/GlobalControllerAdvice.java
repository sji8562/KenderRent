package com.tenco.toyproject._core.advice;

import com.tenco.toyproject.repository.entity.FirstCategory;
import com.tenco.toyproject.repository.entity.SecondCategory;
import com.tenco.toyproject.service.IndexService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@ControllerAdvice
public class GlobalControllerAdvice {
    @Autowired
    IndexService indexService;
    @ModelAttribute
    public void addCommonAttributes(Model model, HttpSession session) {
        List<FirstCategory> firstCategories = indexService.findByFCategory();
        List<FirstCategory> firstcacode2 = indexService.findByFCategoryCode2();


        model.addAttribute("firstCategories", firstCategories);
        model.addAttribute("firstcacode2", firstcacode2);

        session.setAttribute("firstCategories", firstCategories);
        session.setAttribute("firstcacode2", firstcacode2);

    }
}
