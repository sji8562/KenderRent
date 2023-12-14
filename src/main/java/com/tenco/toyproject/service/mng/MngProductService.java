package com.tenco.toyproject.service.mng;

import com.tenco.toyproject._core.handler.exception.Exception500;
import com.tenco.toyproject.controller.mng.MngProductController;
import com.tenco.toyproject.dto.MngProductDto;
import com.tenco.toyproject.dto.MngProductUpdateDto;
import com.tenco.toyproject.repository.entity.FirstCategory;
import com.tenco.toyproject.repository.entity.Product;
import com.tenco.toyproject.repository.entity.SecondCategory;
import com.tenco.toyproject.repository.interfaces.mng.MngProductRepository;
import com.tenco.toyproject.vo.PageVO;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
public class MngProductService {

    private static final Logger logger = LoggerFactory.getLogger(MngProductService.class);

    @Autowired
    private MngProductRepository mngRepository;

    // KWON
    // 상품 목록 with pagination
    public List<Product> findProductAll(PageVO pageVo) {
        return mngRepository.findAllProductWithPagination(pageVo);
    }

    // 상품 상세조회
    public Product findProductById(Integer pId) {
        return mngRepository.findProductById(pId);
    }


    // 전체 상품 개수 조회
    public int countProductList() {
        return mngRepository.findProductCount();
    }

    // 상품 삭제
    @Transactional
    public int deleteProduct(Integer id) {
        // 상품 조회
        Product product = mngRepository.findProductById(id);
        System.out.println(product.getStatus()+"해답을 찾아라");
        if(product.getStatus() != 1) {

            throw new Exception500("삭제할 수 없는 상태입니다");
//			throw new CustomRestfulException("삭제할 수 없는 상태입니다.", HttpStatus.BAD_REQUEST);
        }
        int resultSet = mngRepository.deleteByProductId(id);
        System.out.println(resultSet);
        return resultSet;
    }

    // 상품 등록
    @Transactional
    public int createProduct(MngProductDto dto) {

        int firstCategoryId = mngRepository.findFirstCategoryByfId(dto.getSecondCategoryId());
        dto.setFirstCategoryId(firstCategoryId);

        Product product = Product.builder()
                .name(dto.getName())
                .price(dto.getPrice())
                .picUrl(dto.getPicUrl())
                .firstCategoryId(dto.getFirstCategoryId())
				.secondCategoryId(dto.getSecondCategoryId())
                .content(dto.getContent())
                .status(dto.getStatus())
                .grade(dto.getGrade())
                .build();


        int resultRowCount = mngRepository.createProduct(product);

        if(resultRowCount != 1) {
            throw new Exception500("상품 등록 실패");
        }

        return resultRowCount;
    }

    // 카테고리 조회
    public List<FirstCategory> findCategoryAll() {

        List<FirstCategory> allCategory = mngRepository.findFirstCategoryAll();

        return allCategory;
    }

    public List<SecondCategory> findSecondCategoryForRent() {
        List<SecondCategory> sCategory = mngRepository.findSecondCategoryForRent();
        return sCategory;

    }

    @Transactional
    public int updateProduct(MngProductUpdateDto dto) {

        System.out.println("GET FILE" + dto.getFile());
        System.out.println("GET PIC URL" + dto.getPicUrl());

        int firstCategoryId = mngRepository.findFirstCategoryByfId(dto.getSecondCategoryId());
        dto.setFirstCategoryId(firstCategoryId);

        Product originalProduct = findProductById(dto.getId());

        String imgUrl = originalProduct.getPicUrl();

        if(dto.getPicUrl() != null) {
            imgUrl = dto.getPicUrl();
        }

        Product product = Product
                .builder()
                .id(dto.getId())
                .name(dto.getName())
                .price(dto.getPrice())
                .picUrl(imgUrl)
                .firstCategoryId(dto.getFirstCategoryId())
                .secondCategoryId(dto.getSecondCategoryId())
                .content(dto.getContent())
                .status(dto.getStatus())
                .grade(dto.getGrade())
                .build();

        int resultRowCount = mngRepository.updateProduct(product);

        System.out.println(resultRowCount);

        if(resultRowCount != 1) {
            throw new Exception500("상품 수정 실패");
        }

        return resultRowCount;
    }

    public List<FirstCategory> getFirstCategories() {
        List<FirstCategory> firstCategoryList = mngRepository.findFirstCategoryAll();

        return firstCategoryList;
    }

    public List<SecondCategory> findSecondCategoryByFirstCategoryId(String fId) {
        List<SecondCategory> secondCategory = mngRepository.findSecondCategoryForFirstCategory(fId);
        return secondCategory;
    }

    public int findFirstCategoryByName(String fCategoryName) {
        int resultRowCount = mngRepository.findFirstCategoryByName(fCategoryName);

        return resultRowCount;
    }

    public void addFirstCategory(String fCategoryName) {
        mngRepository.createFirstCategory(fCategoryName);
    }

    public void deleteFirstCategoryById(int fId) {
        mngRepository.deleteFirstCategoryById(fId);
    }

    public int findSecondCategoryByName(String fCategory, String sCategoryName) {
        int resultRowCount = mngRepository.findSecondCategoryByName(fCategory, sCategoryName);
        return resultRowCount;
    }

    public void addSecondCategory(String fCategory, String sCategoryName) {
        mngRepository.addSecondCategory(fCategory, sCategoryName);
    }

    public SecondCategory findFirstCategoryIdBySecondCategoryId(int sId) {
        return mngRepository.findFirstCategoryIdBySecondCategoryId(sId);
    }

    public void deleteSecondCategoryById(int sId) {
        mngRepository.deleteSecondCategoryById(sId);
    }

    public int findProductBySecondCategoryId(int sId) {
        return mngRepository.findProductBySecondCategoryId(sId);
    }

    public int findProducCounttByFirstCategoryId(int fId) {
        return mngRepository.findProducCounttByFirstCategoryId(fId);
    }
}
