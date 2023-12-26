package com.tenco.toyproject.controller.mng;

import com.tenco.toyproject._core.handler.MyRestfullExceptionHandler;
import com.tenco.toyproject._core.handler.exception.CustomRestfulException;
import com.tenco.toyproject._core.handler.exception.CustomRestfullException;
import com.tenco.toyproject._core.handler.exception.Exception404;
import com.tenco.toyproject._core.handler.exception.Exception500;
import com.tenco.toyproject.dto.MngProductDto;
import com.tenco.toyproject.dto.MngProductUpdateDto;
import com.tenco.toyproject.repository.entity.FirstCategory;
import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.entity.Review;
import com.tenco.toyproject.repository.entity.SecondCategory;
import com.tenco.toyproject._core.utils.Define;
import com.tenco.toyproject.service.mng.MngProductService;
import com.tenco.toyproject.vo.PageVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.UUID;


@Controller
@RequestMapping("/mng/product")
@Slf4j
public class MngProductController {

    private static final Logger logger = LoggerFactory.getLogger(MngProductController.class);

    @Autowired
    private MngProductService mngService;

    // 물품 리스트
    @GetMapping("list")
    public String productList(Model model, PageVO pageVO,
                              @RequestParam(value = "nowPage", required = false) String nowPage,
                              @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
                              @RequestParam(value = "keyword", required = false) String keyword,
                              @RequestParam(value = "code", required = false) Integer code) {

        int total = mngService.countProductList(code, keyword);
//        int total = mngService.countProductList(keyword);

        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "5";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "5";
        }

        pageVO = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        model.addAttribute("paging", pageVO);

        model.addAttribute("keyword", keyword);


        System.out.println("===============");
        System.out.println(keyword);
        System.out.println("===============");

        List<Product> productList;

        // 검색어가 있는 경우
        if (keyword != null && !keyword.isEmpty()) {
            // 검색어를 이용해 검색 쿼리 수행
            productList = mngService.findProductByKeyword(pageVO, keyword, code);
        } else {
            // 검색어가 없을 때
            productList = mngService.findProductAll(pageVO, code);
        }


        System.out.println("productList" + productList);
        model.addAttribute(productList);

        String returnUrl = "mng/product/list";
        if(code == 2) {
            returnUrl = "mng/product/listForSale";
        }

        return returnUrl;

    }

    @GetMapping("listForSale")
    public String productListForSale(Model model, PageVO pageVO,
                              @RequestParam(value = "nowPage", required = false) String nowPage,
                              @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
                              @RequestParam(value = "keyword", required = false) String keyword) {

        Integer code = 2;

        int total = mngService.countProductList(code, keyword);

        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "5";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "5";
        }

        pageVO = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        model.addAttribute("paging", pageVO);

        model.addAttribute("keyword", keyword);


        System.out.println("===============");
        System.out.println(keyword);
        System.out.println("===============");

        List<Product> productList;

        // 검색어가 있는 경우
        if (keyword != null && !keyword.isEmpty()) {
            // 검색어를 이용해 검색 쿼리 수행
            productList = mngService.findProductByKeyword(pageVO, keyword, code);
        } else {
            // 검색어가 없을 때
            productList = mngService.findProductAll(pageVO, code);
        }


        System.out.println("productList" + productList);
        model.addAttribute(productList);

        return "mng/product/listForSale";

    }

    @GetMapping("/{pId}/detail")
    public String productDetail(Model model, @PathVariable Integer pId) {
        try {
            Product product = mngService.findProductById(pId);
            if (product == null) {
                throw new CustomRestfullException("없는 상품입니다", HttpStatus.BAD_REQUEST);
            }
            System.out.println("1512345343484531423dsadasdasdasdsads" + product.toString());
            model.addAttribute(product);

            return "mng/product/detail";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @GetMapping("/{pId}/detailForSale")
    public String productDetailForSale(Model model, @PathVariable Integer pId) {
        try {
            Product product = mngService.findProductById(pId);
            if (product == null) {
                throw new CustomRestfulException("없는 상품입니다", HttpStatus.BAD_REQUEST);
            }
            model.addAttribute(product);

            return "mng/product/detailForSale";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @GetMapping("{id}/delete")
    public String productDelete(@PathVariable Integer id) {
        try{
            int result = mngService.deleteProduct(id);
            if(result != 1){
                throw new CustomRestfulException("삭제 되지 않았습니다", HttpStatus.BAD_REQUEST);
            }
            return "redirect:/mng/product/list";
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @GetMapping("review/{id}/delete")
    public String reviewDelete(@PathVariable Integer id) {
        try{
            int result = mngService.deleteProductReview(id);
            if(result != 1){
                throw new CustomRestfulException("삭제 되지 않았습니다", HttpStatus.BAD_REQUEST);
            }
            return "redirect:/mng/product/review";
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @GetMapping("productForm")
    public String productCreate() {
        return "/mng/product/productForm";
    }

    @GetMapping("modifyForRent/{pId}")
    public String productModify(Model model, @PathVariable Integer pId) {
        try {
            Product product = mngService.findProductById(pId);
            List<FirstCategory> fCategory = mngService.findCategoryAll(1);
            List<SecondCategory> sCategory = mngService.findSecondCategoryByFirstCategoryId(Integer.toString(product.getFirstCategoryId()));

            if (product == null) {
                throw new CustomRestfulException("없는 상품입니다", HttpStatus.BAD_REQUEST);
            }
            if (fCategory == null) {
                throw new CustomRestfulException("없는 1차 카테고리입니다.", HttpStatus.BAD_REQUEST);
            }
            if (sCategory == null) {
                throw new CustomRestfulException("없는 2차 카테고리입니다.", HttpStatus.BAD_REQUEST);
            }
//        System.out.println(fCategory.toString());
//        model.addAttribute("fCategory", fCategory);

            model.addAttribute("sCategory", sCategory);
            model.addAttribute("product", product);
            model.addAttribute("fCategory", fCategory);
            return "mng/product/modifyForm";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @GetMapping("modifyForSale/{pId}")
    public String productModifyForSale(Model model, @PathVariable Integer pId) {
        try {
            Product product = mngService.findProductById(pId);
            List<FirstCategory> fCategory = mngService.findCategoryAll(2);
            List<SecondCategory> sCategory = mngService.findSecondCategoryByFirstCategoryId(Integer.toString(product.getFirstCategoryId()));

            if (product == null) {
                throw new CustomRestfulException("없는 상품입니다", HttpStatus.BAD_REQUEST);
            }
            if (fCategory == null) {
                throw new CustomRestfulException("없는 1차 카테고리입니다.", HttpStatus.BAD_REQUEST);
            }
            if (sCategory == null) {
                throw new CustomRestfulException("없는 2차 카테고리입니다.", HttpStatus.BAD_REQUEST);
            }
//        System.out.println(fCategory.toString());
//        model.addAttribute("fCategory", fCategory);

            model.addAttribute("sCategory", sCategory);
            model.addAttribute("product", product);
            model.addAttribute("fCategory", fCategory);
            return "mng/product/modifyFormForSale";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // 대여 물품 등록 페이지로 이동
    @GetMapping("registerForRent")
    public String productRegister(Model model) {

        try {
//            List<SecondCategory> sCategory = mngService.findSecondCategoryForRent();
            List<FirstCategory> fCategory = mngService.findCategoryAll(1); // 대여 물품 조회
            model.addAttribute("fCategory", fCategory);
            if (fCategory == null) {
                throw new CustomRestfulException("1차 카테고리를 찾을 수 없습니다", HttpStatus.BAD_REQUEST);
            }


            model.addAttribute("fCategory", fCategory);

            return "mng/product/submitForm";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    // 판매 물품 등록 페이지로 이동
    @GetMapping("registerForSale")
    public String productRegisterForSale(Model model) {

        try {
            List<FirstCategory> fCategory = mngService.findCategoryAll(2); // 판매 물품 조회
            model.addAttribute("fCategory", fCategory);
            if (fCategory == null) {
                throw new CustomRestfulException("1차 카테고리를 찾을 수 없습니다", HttpStatus.BAD_REQUEST);
            }


            model.addAttribute("fCategory", fCategory);

            return "mng/product/submitFormForSale";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }


    //쓰는건가 ?
    @GetMapping("second-category")
    public List<SecondCategory> getScondCategory(Model model) {
        List<SecondCategory> secondCategory = mngService.findSecondCategoryForRent();

        return secondCategory;
    }

    // 대여용 상품 등록
    @PostMapping("registerForRent")
    public String registerProduct(MngProductDto dto) {

        try {
            if (dto == null)
                throw new CustomRestfulException("입력 받은 값이 없습니다.", HttpStatus.BAD_REQUEST);
            if (dto.getName() == null || dto.getName().isEmpty()) {
                throw new CustomRestfulException("물품 명을 입력해주세요.", HttpStatus.BAD_REQUEST);

            }
            if (dto.getPrice() <= 0) {
                throw new CustomRestfulException("물품 가격은 0원 이하일 수 없습니다.", HttpStatus.BAD_REQUEST);
            }

            if (dto.getFirstCategoryId() == 0) {
                throw new CustomRestfullException("1차 카테고리를 선택해주세요", HttpStatus.BAD_REQUEST);
            }

            if (dto.getSecondCategoryId() == 0) {
                throw new CustomRestfulException("2차 카테고리를 선택해주세요", HttpStatus.BAD_REQUEST);
            }

            if (dto.getContent() == null || dto.getContent().isEmpty()) {
                throw new CustomRestfulException("제품 상세 설명을 입력해주세요.", HttpStatus.BAD_REQUEST);
            }

            // 상품 썸네일 등록
            MultipartFile file = null;

            if (dto.getFile() != null || !dto.getFile().isEmpty()) {
                file = dto.getFile();
            }

            // 등록된 파일이 있으면
            if (!file.isEmpty()) {
                // 파일 사이즈 체크
                if (file.getSize() > Define.MAX_FILE_SIZE) {
                    throw new CustomRestfulException("파일 크기는 200MB 미만이어야 합니다.", HttpStatus.BAD_REQUEST);
                }
            }

            if (file != null && !file.isEmpty()) {
                try {
                    // 업로드 파일 경로
                    String saveDirectory = Define.UPLOAD_DIRECTORY;

                    // 폴더가 없다면
                    File dir = new File(saveDirectory);
                    if (dir.exists() == false) {
                        dir.mkdirs();
                    }

                    // 파일 이름 중복 예방
                    UUID uuid = UUID.randomUUID();
                    // 새로운 파일 이름
                    String fileName = "";

                    if (file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
                        fileName = uuid + "_" + file.getOriginalFilename();
                        Path uploadPath = Paths.get(Define.UPLOAD_DIRECTORY + fileName);
                        Files.write(uploadPath, file.getBytes());
                    } else {
                        fileName = null;
                    }
                    // 전체 경로 지정
                    dto.setPicUrl(fileName);

                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }

            int result = mngService.createProduct(dto);
            if(result != 1){
                throw new CustomRestfulException("제품 등록이 실패했습니다.", HttpStatus.BAD_REQUEST);
            }

            return "redirect:/mng/product/list?code=1&keyword=";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    // 대여용 상품 등록
    @PostMapping("registerForSale")
    public String registerProductForSale(MngProductDto dto) {

        try {
            if (dto == null)
                throw new CustomRestfulException("입력 받은 값이 없습니다.", HttpStatus.BAD_REQUEST);
            if (dto.getName() == null || dto.getName().isEmpty()) {
                throw new CustomRestfulException("물품 명을 입력해주세요.", HttpStatus.BAD_REQUEST);

            }
            if (dto.getPrice() <= 0) {
                throw new CustomRestfulException("물품 가격은 0원 이하일 수 없습니다.", HttpStatus.BAD_REQUEST);
            }

            if (dto.getFirstCategoryId() == 0) {
                throw new CustomRestfullException("1차 카테고리를 선택해주세요", HttpStatus.BAD_REQUEST);
            }

            if (dto.getSecondCategoryId() == 0) {
                throw new CustomRestfulException("2차 카테고리를 선택해주세요", HttpStatus.BAD_REQUEST);
            }

            if (dto.getContent() == null || dto.getContent().isEmpty()) {
                throw new CustomRestfulException("제품 상세 설명을 입력해주세요.", HttpStatus.BAD_REQUEST);
            }

            // 상품 썸네일 등록
            MultipartFile file = null;

            if (dto.getFile() != null || !dto.getFile().isEmpty()) {
                file = dto.getFile();
            }

            // 등록된 파일이 있으면
            if (!file.isEmpty()) {
                // 파일 사이즈 체크
                if (file.getSize() > Define.MAX_FILE_SIZE) {
                    throw new CustomRestfulException("파일 크기는 200MB 미만이어야 합니다.", HttpStatus.BAD_REQUEST);
                }
            }

            if (file != null && !file.isEmpty()) {
                try {
                    // 업로드 파일 경로
                    String saveDirectory = Define.UPLOAD_DIRECTORY;

                    // 폴더가 없다면
                    File dir = new File(saveDirectory);
                    if (dir.exists() == false) {
                        dir.mkdirs();
                    }

                    // 파일 이름 중복 예방
                    UUID uuid = UUID.randomUUID();
                    // 새로운 파일 이름
                    String fileName = "";

                    if (file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
                        fileName = uuid + "_" + file.getOriginalFilename();
                        Path uploadPath = Paths.get(Define.UPLOAD_DIRECTORY + fileName);
                        Files.write(uploadPath, file.getBytes());
                    } else {
                        fileName = null;
                    }
                    // 전체 경로 지정
                    dto.setPicUrl(fileName);

                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }

            int result = mngService.createProduct(dto);
            if(result != 1){
                throw new CustomRestfulException("제품 등록이 실패했습니다.", HttpStatus.BAD_REQUEST);
            }

            return "redirect:/mng/product/listForSale?code=2&keyword=";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @PostMapping("/{id}/modifyForRent")
    public String modifyProduct(MngProductUpdateDto dto, @PathVariable Integer id) {
        try {
            if (dto.getName() == null || dto.getName().isEmpty()) {
                throw new CustomRestfulException("물품명을 입력해주세요.", HttpStatus.NOT_FOUND);
            }
            if (dto.getPrice() <= 0) {
                throw new CustomRestfulException("물품 가격은 0원 이하일 수 없습니다.", HttpStatus.BAD_REQUEST);
            }

            if (dto.getContent() == null || dto.getContent().isEmpty()) {
                throw new CustomRestfulException("제품 상세 설명을 입력해주세요.", HttpStatus.BAD_REQUEST);
            }
            // 상품 썸네일 등록
            MultipartFile file = null;
            if (dto.getFile() != null || !dto.getFile().isEmpty()) {
                file = dto.getFile();
            }


            // 등록된 파일이 있으면
            if (!file.isEmpty()) {
                // 파일 사이즈 체크
                if (file.getSize() > Define.MAX_FILE_SIZE) {
                    throw new CustomRestfulException("파일 크기는 200MB 미만이어야 합니다.", HttpStatus.BAD_REQUEST);
                }
            }
            if (file != null && !file.isEmpty()) {
                try {
                    // 업로드 파일 경로
                    String saveDirectory = Define.UPLOAD_DIRECTORY;
//                String saveDirectory = "/";

                    // 폴더가 없다면
                    File dir = new File(saveDirectory);
                    if (dir.exists() == false) {
                        dir.mkdirs();
                    }

                    // 파일 이름 중복 예방
                    UUID uuid = UUID.randomUUID();
                    // 새로운 파일 이름
                    String fileName = "";

                    if (file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
                        fileName = uuid + "_" + file.getOriginalFilename();
                        Path uploadPath = Paths.get(Define.UPLOAD_DIRECTORY + fileName);
                        Files.write(uploadPath, file.getBytes());

                    } else {
                        if (dto.getPicUrl() != null) {

                            fileName = dto.getPicUrl();
                        } else {
                            fileName = null;

                        }
                    }
                    // 전체 경로 지정

                    dto.setPicUrl(fileName);

                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }


            System.out.println("CONTROLLER UPDATE 전" + dto.toString());

            int result = mngService.updateProduct(dto);
            if(result != 1){
                throw new CustomRestfulException("제품 등록이 실패했습니다.", HttpStatus.BAD_REQUEST);
            }
            return "redirect:/mng/product/" + dto.getId() + "/detail";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @PostMapping("/{id}/modifyForSale")
    public String modifyProductForSale(MngProductUpdateDto dto, @PathVariable Integer id) {
        try {
            if (dto.getName() == null || dto.getName().isEmpty()) {
                throw new CustomRestfulException("물품명을 입력해주세요.", HttpStatus.NOT_FOUND);
            }
            if (dto.getPrice() <= 0) {
                throw new CustomRestfulException("물품 가격은 0원 이하일 수 없습니다.", HttpStatus.BAD_REQUEST);
            }

            if (dto.getContent() == null || dto.getContent().isEmpty()) {
                throw new CustomRestfulException("제품 상세 설명을 입력해주세요.", HttpStatus.BAD_REQUEST);
            }
            // 상품 썸네일 등록
            MultipartFile file = null;
            if (dto.getFile() != null || !dto.getFile().isEmpty()) {
                file = dto.getFile();
            }


            // 등록된 파일이 있으면
            if (!file.isEmpty()) {
                // 파일 사이즈 체크
                if (file.getSize() > Define.MAX_FILE_SIZE) {
                    throw new CustomRestfulException("파일 크기는 200MB 미만이어야 합니다.", HttpStatus.BAD_REQUEST);
                }
            }
            if (file != null && !file.isEmpty()) {
                try {
                    // 업로드 파일 경로
                    String saveDirectory = Define.UPLOAD_DIRECTORY;
//                String saveDirectory = "/";

                    // 폴더가 없다면
                    File dir = new File(saveDirectory);
                    if (dir.exists() == false) {
                        dir.mkdirs();
                    }

                    // 파일 이름 중복 예방
                    UUID uuid = UUID.randomUUID();
                    // 새로운 파일 이름
                    String fileName = "";

                    if (file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
                        fileName = uuid + "_" + file.getOriginalFilename();
                        Path uploadPath = Paths.get(Define.UPLOAD_DIRECTORY + fileName);
                        Files.write(uploadPath, file.getBytes());

                    } else {
                        if (dto.getPicUrl() != null) {

                            fileName = dto.getPicUrl();
                        } else {
                            fileName = null;

                        }
                    }
                    // 전체 경로 지정

                    dto.setPicUrl(fileName);

                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }


            System.out.println("CONTROLLER UPDATE 전" + dto.toString());

            int result = mngService.updateProduct(dto);
            if(result != 1){
                throw new CustomRestfulException("제품 등록이 실패했습니다.", HttpStatus.BAD_REQUEST);
            }
            return "redirect:/mng/product/" + dto.getId() + "/detailForSale";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    /**
     * 판매용 카테고리
     * */
    @GetMapping("categoriesForSale")
    public String categoriesForSalePage(Model model) {
        Integer categoryCode = 2;

        // 1차 카테고리 불러오기
        List<FirstCategory> firstCategoryListForSale = mngService.getFirstCategories(categoryCode); // 2 판매용
        if(firstCategoryListForSale != null || !firstCategoryListForSale.isEmpty()){
            model.addAttribute("firstCategoryList", firstCategoryListForSale);
        }
        return "/mng/product/categoriesForSale";
    }

    /**
     * 대여용 카테고리 조회
     * */
    @GetMapping("categories")
    public String categoriesPage(Model model) {
        Integer categoryCode = 1;

        // 1차 카테고리 불러오기
        List<FirstCategory> firstCategoryList = mngService.getFirstCategories(categoryCode); // 1 대여용
        if(firstCategoryList != null || !firstCategoryList.isEmpty()){
            model.addAttribute("firstCategoryList", firstCategoryList);
        }
        return "/mng/product/categories";
    }

    @GetMapping("second-category-find-by-first-category/{fId}")
    @ResponseBody

    public List<SecondCategory> getScondCategoryfindByFirstCategoryId(@PathVariable String fId) {

        try {
            if(fId == null|| fId.isEmpty()){
                throw new CustomRestfulException("id값이 없습니다", HttpStatus.BAD_REQUEST);
            }
            List<SecondCategory> secondCategory = mngService.findSecondCategoryByFirstCategoryId(fId);
            return secondCategory;
        }catch (Exception e){
         e.printStackTrace();
         return null;
        }
    }

    // 카테고리 등록(대여/판매)
    @PostMapping("addFirstCategory")
    @ResponseBody
    public List<FirstCategory> addFirstCategory(@RequestBody Map<String, String> categoryName) {
        try{
            String fCategoryName = categoryName.get("categoryName");
            Integer fCode = Integer.valueOf(categoryName.get("code"));

            // 같은 이름의 카테고리가 있는지 확인
            logger.info("같은 이름의 카테고리가 있는지 먼저 확인", fCategoryName);
            int resultRowCount = mngService.findFirstCategoryByName(fCode, fCategoryName);

            if (resultRowCount > 0) {
                throw new CustomRestfulException("이미 존재하는 카테고리입니다", HttpStatus.BAD_REQUEST);

            }

            int result = mngService.addFirstCategory(fCode, fCategoryName);
            if(result != 1){
                throw new CustomRestfulException("카테고리 등록을 실패했습니다.", HttpStatus.BAD_REQUEST);
            }

            return mngService.getFirstCategories(fCode);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    // 대여용
    // 1차 카테고리 삭제
    @GetMapping("/delete-first-category-by-id/{fId}")
    public List<FirstCategory> deleteFirstCategory(@PathVariable int fId) throws CustomRestfullException {
//        if(fId == null){
//            return
//        }
        // 해당 카테고리의 하위 항목이 있는지 확인
        List<SecondCategory> secondCategories = mngService.findSecondCategoryByFirstCategoryId(Integer.toString(fId));

        try{
            if (!secondCategories.isEmpty()) {
                throw new CustomRestfullException("하위 카테고리가 존재합니다", HttpStatus.BAD_REQUEST);
            }
            // 해당 카테고리에 등록된 물품이 있는지 확인
            int resultRows = mngService.findProductCountByFirstCategoryId(fId);
            if (resultRows > 0) {
                throw new CustomRestfullException("해당 카테고리에 등록된 물품이 있습니다", HttpStatus.BAD_REQUEST);
            }
            int result = mngService.deleteFirstCategoryById(fId);
            if(result != 1){
                throw new CustomRestfullException("카테고리 삭제에 실패했습니다.", HttpStatus.BAD_REQUEST);
            }
            return mngService.getFirstCategories(1);
        }catch (Exception e){
            e.printStackTrace();
            return null;

        }

    }


    /**
     * 대여용 카테고리
    * */
    @PostMapping("addSecondCategory")
    @ResponseBody
    public List<SecondCategory> addSecondCategory(@RequestBody Map<String, String> postData) {
        try {
            System.out.println("--왜 여기로 안와?--");
            logger.info("왜 여기로 안오지?");

            String sCategoryName = postData.get("categoryName");
            String fCategory = postData.get("selectedFirstCategory");

            // 같은 이름의 카테고리가 있는지 확인
            logger.info("같은 이름의 카테고리가 있는지 먼저 확인", sCategoryName);
            int resultRowCount = mngService.findSecondCategoryByName(fCategory, sCategoryName);


            if (resultRowCount > 0) {
                throw new CustomRestfulException("이미 존재하는 카테고리입니다", HttpStatus.BAD_REQUEST);
            }

            int result = mngService.addSecondCategory(fCategory, sCategoryName);
            if(result != 1){
                throw new CustomRestfulException("카테고리 생성에 실패했습니다.", HttpStatus.BAD_REQUEST);
            }

            return mngService.findSecondCategoryByFirstCategoryId(fCategory);

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }

    //    List<FirstCategory>
    @GetMapping("/delete-second-category-by-id/{sId}")
    public void deleteSecondCategoryById(@PathVariable int sId) {
        try {
            System.out.println("--- 2차 카테고리 삭제할거야 ---" + sId);
            // 해당 카테고리가 존재하는지 확인
            SecondCategory secondCategory = mngService.findFirstCategoryIdBySecondCategoryId(sId);

            // 해당 카테고리에 등록된 상품이 있는지 확인
            int resultRows = mngService.findProductBySecondCategoryId(sId);

            if (resultRows > 0) {
                throw new CustomRestfulException("해당 카테고리에 등록된 상품이 있습니다.", HttpStatus.BAD_REQUEST);
            }

            System.out.println("--- 찾았따!!! ---" + secondCategory);

            int result = mngService.deleteSecondCategoryById(secondCategory.getId());
            if(result != 1){
                throw new CustomRestfulException("삭제하지 못했습니다.", HttpStatus.BAD_REQUEST);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 대여
    @GetMapping("/first-category-all")
    public List<FirstCategory> findFirstCategoryAll() {
        logger.info("===============================");
        return mngService.getFirstCategories(1);
    }

    // 상품 후기 관리 페이지
    @GetMapping("/review")
    public String productReview(Model model, PageVO pageVO,
                                @RequestParam(value = "nowPage", required = false) String nowPage,
                                @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
                                @RequestParam(value = "keyword", required = false) String keyword) {

        System.out.println("=============================================");
        System.out.println(pageVO.toString());

        int total = mngService.countReviewList(keyword);
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "5";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "5";
        }

        pageVO = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        model.addAttribute("paging", pageVO);

        model.addAttribute("keyword", keyword);

        List<Review> reviewList;

        // 후기 조회
        // 검색어가 있는 경우
        if (keyword != null && !keyword.isEmpty()) {
            System.out.println("==================111111111111111===========================");
            // 검색어를 이용해 검색 쿼리 수행
            reviewList = mngService.findAllReviewWithPaginationAndKeyword(pageVO, keyword);
            System.out.println("=========================2222222222222222====================" + reviewList);
        } else {
            // 검색어가 없을 때
            reviewList = mngService.findAllReviewWithPagination(pageVO);
        }

        model.addAttribute("reviewList", reviewList);

        return "/mng/product/review";

    }

    @GetMapping("review/{pId}/detail")
    public String productReviewDetail(Model model, @PathVariable Integer pId) {
        try {
            Review review = mngService.findProductReviewById(pId);
            if (review == null) {
                throw new CustomRestfulException("없는 후기입니다", HttpStatus.BAD_REQUEST);
            }
            System.out.println("1512345343484531423dsadasdasdasdsads" + review.toString());
            model.addAttribute(review);

            return "mng/product/reviewDetail";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
