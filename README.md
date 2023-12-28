<h1>Kinder Lend 👶</h1>
<div align="center"> 
  <img src="src/main/resources/static/images/Logo.png" width=300>
  <p>Kinder Lend는 안전한 중고 유아 용품 대여를 통해 부모들에게 편안하고 경제적인 대안을 제공하며, <br> 지속 가능한 소비 문화를 선도합니다.</p>
</div>


## 목차
1. [팀 소개](#팀-소개)
2. [프로젝트 소개](#프로젝트-소개)
3. [STACKS](#STACKS)
4. [API 명세서](#API-명세서)
5. [ERD](#ERD)
6. [Directory Tree](#Directory-Tree)
<br>

## 팀 소개
- **개발 기간** 🗓  :  2023-11-28 ~ 2023 12-26
<div>
  <img src="https://github.com/sji8562/KinderLend/assets/94952331/b1386190-b738-4ab9-b67e-024deeb1e6c0" width=800>
</div>
<br>

- **멤버** 🙋‍♀️
<div>
<details>
  <summary>권보미(<a href="https://github.com/aSpring712">@aSpring712</a>) [팀장]</summary>
    <ul>
        <li>노션 일정 관리 적용 및 역할 분배</li>
        <li>[관리자] 로그인/로그아웃 및 로그인 interceptor 처리</li>
        <li>[관리자] 결제 관리 페이지 HTML, CSS 작업, 데이터 바인딩</li>
        <li>[관리자] 물품 관리 페이지 HTML, CRUD 및 검색 기능 구현</li>
        <li>[관리자] 1, 2차 카테고리 관리 HTML, CRD</li>
        <li>[관리자] 후기 관리 HTML, 조회 및 삭제, 검색 기능 구현</li>
        <li>[관리자] 1:1 문의 HTML, RUD</li>
        <li>[관리자] FAQ HTML, CRUD</li>
        <li>[관리자] 이용 수칙, 소독 과정, 회사 소개 CUD 기능 구현</li>
        <li>[사용자] 이용 수칙 페이지, 소독 과정 페이지, 회사 소개 페이지 HTML 및 데이터 바인딩</li>
        <li>[사용자] 메인 페이지</li>
        <li>[사용자] 오시는 길 페이지 일부</li>
        <li>[사용자] footer 작업</li>
        <li>[관리자/사용자단] 페이지 텍스트 에디터(summernote) 적용</li>
        <li>사이트맵, 기능명세서 작성, 간트 차트, 관리자 페이지 프로토타입, 시연영상 제작</li>
        <li>전체 QA</li>
    </ul>
</details>
<details>
  <summary>송재익(<a href="https://github.com/sji8562">@sji8562</a>) [팀원]</summary>
  <ul>
    <li>git 관리</li>
    <li>db 테이블 ERD 관리 db 더미데이터</li>
    <li>프로젝트 초기 셋팅</li>
    <li>물품 썸네일 사진처리</li>
    <li>[관리자] 회원 RUD ,HTML, CSS작업</li>
    <li>[관리자] 신청관리  RUD,HTML, CSS작업</li>
    <li>[관리자] 공지사항 CRUD,HTML, CSS작업</li>
    <li>[관리자] 대시보드,HTML, CSS작업</li>
    <li>[관리자] 모든 컨트롤러 예외처리</li>
    <li>[관리자] 모든 스크립트 문법 mng.js로 옮김</li>
    <li>[관리자] 모든 css 문법 mng.css로 옮김</li>
    <li>[사용자] 렌트 리스트 HTML CSS작업</li>
    <li>[사용자] 렌트 리스트 조회 기능구현</li>
    <li>[사용자] 헤더 정리</li>
    <li>[사용자] 소셜로그인 clientkey secretkey 변수화</li>
  </ul>
</details>
<details>
  <summary>오다정(<a href="https://github.com/DJ0H)">@DJ0H</a>) [팀원]</summary>
  <ul>
    <li>회사 소개 프로토타입, 플로우 차트 작성</li>
    <li>[사용자] 판매 상품 상세페이지 화면 및 기능 구현</li>
    <li>[사용자] 대여 상품 상세페이지 화면 및 기능 구현</li>
    <li>[사용자] 장바구니 화면 및 기능 구현</li>
    <li>[사용자] 위시리스트 화면 및 기능 구현</li>
    <li>[사용자] 결제 화면 및 기능 구현 (카카오페이 api, daum 주소 api, coolsms 문자 전송 api 활용)</li>
    <li>[사용자] 주문 내역 화면 및 기능 구현</li>
    <li>[사용자] 주문 상세 보기 화면 및 기능 구현</li>
    <li>[사용자] 취소(환불) 내역 화면 및 기능 구현</li>
    <li>[사용자] 대여 내역 화면 및 기능 구현</li>
    <li>[사용자] 로그인 화면 구현</li>
    <li>[사용자] review 화면 및 기능 구현</li>
    <li>git README 작성</li>
  </ul>
</details>
<details>
  <summary>전우진(<a href="https://github.com/m40ro">@m40ro</a>) [팀원]</summary>
  <ul>
    <li>[관리자] 상품 질문 페이지 HTML 및 CRUD 기능, 검색 및 페이징 기능 구현</li>
    <li>사용자단 사이트 맵 작성</li>
    <li>PPT 작성 및 발표</li>
  </ul>
</details>
<details>
  <summary>전창용(<a href="https://github.com/wjs1kk">@wjs1kk</a>) [팀원]</summary>
  <ul>
    <li>[사용자] 로그인, 회원가입 기능 구현</li>
    <li>[사용자] 아이디찾기, 비밀번호 찾기 구현, 이메일인증 api, 문자인증 api 활용</li>
    <li>[사용자] 공지사항 HTML 및  CRUD, 페이징 구현</li>
    <li>[사용자] 1:1문의 HTML 및  CRU, 페이징 구현</li>
    <li>[사용자] FAQ HTML 및  CRU, 페이징 구현</li>
    <li>[사용자] 상품문의 HTML 및  CRU, 페이징 구현</li>
    <li>[사용자] 상품 검색 기능 구현</li>
    <li>[사용자] 검색페이지 무한 스크롤 구현</li>
    <li>[사용자] 오시는 길 페이지 일부, 카카오 map api 활용</li>
    <li>[사용자] 마이페이지 일부 HTML</li>
    <li>[사용자] 오시는 길 페이지 일부</li>
    <li>[사용자] 헤더 HTML, CSS</li>
  </ul>
</details>  
</div>


<br>


## 프로젝트 소개
- **이름** : Kinder Lend
- **목적** : Kinder Lend는 당신의 유아 용품의 세계를 특별하게 만들어 드립니다. <br> 안심하고 이용할 수 있는 중고 유아 용품 대여의 선두주자로, Kinder Lend는 철저한 소독 절차를 거친 안전한 상품을 저렴한 가격에 제공합니다. 우리의 핵심 목표는 부모님들에게 경제적인 대안을 제공하면서 동시에 지속 가능한 소비 문화를 선도하는 것입니다. <br> Kinder Lend와 함께라면, 아이들의 성장과 함께하는 즐거움을 놓치지 않으면서도 환경을 생각하는 미래 지향적인 육아 생활을 경험할 수 있습니다.<br>  
- **주요 기능** ✏

  `* 사용자 *`
  + 로그인, 회원가입
  + 중고 구매
  + 대여 신청
  + 마이페이지 (장바구니, 찜목록, 내역, 환불)
  + 고객센터 (공지사항, FAQ, 1:1문의)
  + 회사소개
 
  `* 관리자 *`
  + 회원관리
  + 대시보드
  + 물품 관리 (물품, 배송, 카테고리)
  + 신청 관리
  + 고객센터 관리
  + 결제 관리 (환불, 매출내역)

- **사이트맵** 🗺

  `* 사용자 *`
<div align="center">
    <img src="https://github.com/sji8562/KinderLend/assets/94952331/f447c9fb-d1c4-47c6-b32b-77245d1ddaa3" width=850>
</div>

  `* 관리자 *`
<div align="center">
    <img src="https://github.com/sji8562/KinderLend/assets/94952331/85dc7cd3-21ff-49a1-92ac-ee20b547630f" width=850>
</div>
    
- **화면 구성** 💻 << gif로 바꾸기

  `* 사용자 *`
  
<div align="center"> 
  
|<img src="https://github.com/sji8562/KenderRent/assets/94952331/46368217-01ad-45a7-ae12-36298a394854/" width=400>|<img src="https://github.com/sji8562/KenderRent/assets/94952331/742b0339-691e-4ee1-af4e-c2ae9c6b74d6" width=400>|
|:---:|:---:|
|메인 화면|카테고리|
|<img src=""width=400>|<img src=""width=400>|
|대여하기|구매하기|
|<img src=""width=400>|<img src=""width=400>|
|결제 화면|장바구니|
|<img src=""width=400>|<img src=""width=400>|
|주문 내역|주문 상세|
|<img src=""width=400>|<img src=""width=400>|
|대여 내역|위시리스트|
|<img src=""width=400>|<img src=""width=400>|
|취소(환불) 내역|마이페이지|
|<img src=""width=400>|<img src=""width=400>|
|공지사항|1:1문의|
|<img src=""width=400>|<img src=""width=400>|
|FAQ|상품문의|
|<img src=""width=400>|<img src=""width=400>|
|회사소개|이용안내|
|<img src=""width=400>|<img src=""width=400>|
|소독과정|오시는길|



</div>
<br>

  `* 관리자 *`

<div align="center"> 
  
|<img src="https://github.com/sji8562/KenderRent/assets/94952331/83914283-2415-425b-bb70-4f2e9b61c27b" width=400> |<img src="https://github.com/sji8562/KenderRent/assets/94952331/b1d8df02-cc90-40a3-acb5-64e15c41b35d" width=400>| 
|:---:|:---:|
|메인 화면(대시보드)|회원 관리|
| <img src="https://github.com/sji8562/KenderRent/assets/94952331/35695195-8d69-4fdc-89ba-e37a1ed4a970" width=400> | <img src="https://github.com/sji8562/KenderRent/assets/94952331/b1d8df02-cc90-40a3-acb5-64e15c41b35d" width=400> |
|물품 관리|고객센터 관리|

</div>
<br>

- **시연 영상** 🎬
업로드 예정

<br><br>

## API 명세서

- **회원 관련 API**
  
|기능|Method|Request param|URL|Return Page|
|----|:----:|----|----|----|
|회원 가입|POST|UserSignInFormDto|/user/signUp|회원 가입 후 로그인 페이지|
|로그인|POST|User|/user/signIn|로그인 후 메인 페이지|
|로그아웃|GET||/user/logout|로그아웃 후 메인 페이지|
|아이디 찾기|POST|userName, phoneNumber|/user/findId|아이디 찾기 결과 페이지|
|비밀번호 찾기|GET|email, authCode|/user/findPassword|비밀번호 변경하기 페이지|
|비밀번로 변경|POST|email, password|/user/passwordChange|비밀번호 변경 후 로그인 페이지|
|회원 정보 변경||||

- **상품 관련 API**
  
|기능|Method|Request param|URL|Return Page|
|----|:----:|----|----|----|
|제품 목록|||/product||
|제품 상세(구매)|GET|id|/product/detail/{id}|상세 페이지|
|제품 상세(대여)|GET|id|/product/rent/{id}|상세 페이지|
|구매하기|POST|selectedProducts, selectedOption|/product/order|결제 페이지|
|카카오페이(구매)|POST|pg_token|/product/order/kakao-pay/success|구매 성공 시 주문 내역 페이지|
|카카오페이(취소)|GET|orderIds, selectedOption|/product/order/kakao-pay/fail|구매 취소 시 구매 페이지|
|카카오페이(환불)|POST|orderId|/product/order/kakao-pay/cancel|환불 후 취소 내역 페이지|
|검색|GET|keyword, price1, price2|/product/search|검색|
|검색 결과|GET|keyword|/product/getData|검색 결과 페이지|
|장바구니 추가|POST|productId|/cart/add|추가 후 장바구니 보기 페이지|
|장바구니 보기|GET||/cart|장바구니 목록 페이지|
|장바구니 삭제|POST|id|/cart/delete|삭제 후 장바구니 목록 페이지|



<br>

## STACKS

- **Environment**
<div>
  &emsp;<img src="https://img.shields.io/badge/intellijidea-000000?style=for-the-badge&logo=intellijidea&logoColor=white">
  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
  <img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white"><img src="https://img.shields.io/badge/3.1.6-515151?style=for-the-badge">
  <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"><img src="https://img.shields.io/badge/8.0.31-515151?style=for-the-badge"> 
  <br>
</div>

- **Backend** 
<div>
  &emsp;<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"><img src="https://img.shields.io/badge/17.0.9-515151?style=for-the-badge">  
  <img src="https://img.shields.io/badge/mybatis-281E1F?style=for-the-badge&logo=mybatis&logoColor=white"><img src="https://img.shields.io/badge/3.0.3-515151?style=for-the-badge">
  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"><img src="https://img.shields.io/badge/9.0-515151?style=for-the-badge">
  <img src="https://img.shields.io/badge/lombok-AD3922?style=for-the-badge&logo=lombok&logoColor=white">
  <br>
</div>
<br>

- **Frontend**
<div>
  &emsp;<img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html&logoColor=white">
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css&logoColor=white">
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white">
  <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=Bootstrap&logoColor=white"> 
  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">  
</div>
<br>

- **DataBase**
<div>
  &emsp;<img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"><img src="https://img.shields.io/badge/8.0.31-515151?style=for-the-badge"> 
</div>
<br>

- **BuildTool**
<div>
  &emsp;<img src="https://img.shields.io/badge/Gradle-02303A?style=for-the-badge&logo=Gradle&logoColor=white"><img src="https://img.shields.io/badge/7.1.1-515151?style=for-the-badge">
</div>
<br>

- **Communication**
<div>
  &emsp;<img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white">
  <img src="https://img.shields.io/badge/discord-5662F6?style=for-the-badge&logo=discord&logoColor=white">
</div>
<br>

- **외부 API**
  + 카카오톡 소셜 로그인 API
  + 네이버 소셜 로그인 API
  + 카카오페이 API
  + Kakao 지도 API
  + DAUM 주소 API
  + coolSMS API (문자 전송)
  + Naver Mail API (이메일 인증)
<br>

- **Dependencies**
```java
implementation 'org.springframework.boot:spring-boot-starter-data-jdbc'
implementation 'org.springframework.boot:spring-boot-starter-validation'
implementation 'org.springframework.boot:spring-boot-starter-web'
implementation 'org.springframework.boot:spring-boot-starter-data-jpa'
implementation 'org.springframework.boot:spring-boot-starter-security'
implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:3.0.3'
compileOnly 'org.projectlombok:lombok'
developmentOnly 'org.springframework.boot:spring-boot-devtools'
runtimeOnly 'com.h2database:h2'
runtimeOnly 'com.mysql:mysql-connector-j'
annotationProcessor 'org.projectlombok:lombok'
testImplementation 'org.springframework.boot:spring-boot-starter-test'
testImplementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter-test:3.0.3'
implementation group: 'org.glassfish.web', name: 'jakarta.servlet.jsp.jstl', version: '2.0.0'
implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
implementation 'org.springframework.boot:spring-boot-starter-aop'
implementation 'org.springframework.boot:spring-boot-starter-security:3.1.6'
implementation 'org.springframework.boot:spring-boot-starter-oauth2-client:3.1.6'
implementation 'org.springframework.security:spring-security-taglibs:5.7.2'
implementation group: 'com.auth0', name: 'java-jwt', version: '4.4.0'
implementation 'net.nurigo:sdk:4.3.0'
implementation 'org.springframework.cloud:spring-cloud-starter-aws:2.2.1.RELEASE'
implementation group: 'com.googlecode.json-simple', name: 'json-simple', version: '1.1.1'
implementation 'org.springframework.boot:spring-boot-starter-mail'
implementation group: 'net.nurigo', name: 'sdk', version: '4.3.0'
```
<br>

## ERD

<div align="center">
    <img src="https://github.com/sji8562/KinderLend/assets/94952331/f170c79c-f29a-4eda-aea8-b4e4da156ffe">
</div>
<br>

## Directory Tree

```
📦KinderLend
└─📁main
   ├─📁java
   │  └─📁com
   │      └─📁tenco
   │          └─📁toyproject
   │              ├─📁controller        // 웹 컨트롤러 클래스들이 위치하는 패키지
   │              │  └─📁mng
   │              ├─📁dao               // 데이터 액세스 객체(Data Access Object)가 위치하는 패키지
   │              ├─📁dto               // 데이터 전송 객체(Data Transfer Object)가 위치하는 패키지
   │              │  └─📁response
   │              ├─📁repository        // Spring Data JPA repository 인터페이스와 관련된 패키지
   │              │  ├─📁entity
   │              │  │  └─📁kakaopay
   │              │  └─📁interfaces
   │              │      └─📁mng
   │              │          └─📁board
   │              ├─📁service           // 비즈니스 로직을 처리하는 서비스 클래스들이 위치하는 패키지
   │              │  └─📁mng
   │              │      └─📁board
   │              ├─📁vo                // Value Object 또는 DTO와 비슷한 역할을 하는 객체들이 위치하는 패키지
   │              └─📁_core                        
   │                  ├─📁advice        // AOP(Aspect-Oriented Programming)를 위한 어드바이스(Advice) 클래스들
   │                  ├─📁config        // Spring 설정 클래스들
   │                  ├─📁filter        // Servlet 필터 클래스들
   │                  ├─📁handler       // 예외 처리 핸들러 클래스들
   │                  │  └─📁exception
   │                  └─📁utils         // 유틸리티 클래스들
   ├─📁resources                        // 프로젝트의 리소스들이 위치하는 디렉토리
   │  ├─📁db                            // 데이터베이스 스키마, 초기 데이터 스크립트
   │  ├─📁mapper                        // MyBatis 매퍼 XML 파일들
   │  └─📁static                        // 웹 어플리케이션에서 사용되는 정적 자원들이 위치하는 디렉토리
   │      ├─📁assets                    // 웹 페이지에서 사용되는 외부 자원들
   │      │  ├─📁extra-libs
   │      │  │  └─📁sparkline
   │      │  ├─📁images                             
   │      │  │  └─📁users
   │      │  └─📁libs                               
   │      │      ├─📁bootstrap
   │      │      ├─📁chartist
   │      │      ├─📁chartist-plugin-tooltips
   │      │      ├─📁jquery
   │      │      ├─📁moment
   │      │      └─📁popper.js
   │      ├─📁css                       // CSS 스타일시트 파일들
   │      │  ├─📁icons
   │      │  │  ├─📁material-design-iconic-font
   │      │  │  ├─📁themify-icons
   │      │  │  └─📁weather-icons
   │      │  │      ├─📁css
   │      │  │      ├─📁fonts
   │      │  │      ├─📁less
   │      │  │      └─📁sass
   │      │  └─📁styles
   │      │      └─📁bootstrap4
   │      ├─📁dist
   │      │  ├─📁css
   │      │  │  └─📁icons
   │      │  │      ├─📁material-design-iconic-font
   │      │  │      ├─📁themify-icons
   │      │  │      └─📁weather-icons
   │      │  │          ├─📁css
   │      │  │          ├─📁fonts
   │      │  │          ├─📁less
   │      │  │          └─📁sass
   │      │  └─📁js                                 
   │      │      └─📁pages
   │      │          └─📁dashboards
   │      ├─📁images                    // 이미지 파일들
   │      ├─📁js                        // JavaScript 파일들
   │      ├─📁plugins
   │      │  ├─📁easing
   │      │  ├─📁font-awesome-4.7.0
   │      │  ├─📁Isotope
   │      │  ├─📁jquery-ui-1.12.1.custom
   │      │  ├─📁OwlCarousel2-2.2.1
   │      │  └─📁themify-icons
   │      └─📁scss
   │          ├─📁bootstrap
   │          ├─📁core
   │          │  ├─📁animation
   │          │  ├─📁breadcrumb
   │          │  ├─📁buttons
   │          │  ├─📁extra
   │          │  ├─📁layout
   │          │  ├─📁loader
   │          │  ├─📁scafholdings
   │          │  ├─📁sidebar
   │          │  ├─📁tables
   │          │  ├─📁topbar
   │          │  └─📁wave-effects
   │          ├─📁mixins
   │          ├─📁pages
   │          │  └─📁dashboards
   │          ├─📁theme-colors
   │          └─📁widgets
   └─📁webapp                           // 웹 어플리케이션의 웹 자원들이 위치하는 디렉토리
       └─📁WEB-INF          
           └─📁view                     // JSP 파일들이 위치하는 디렉토리
               ├─📁customer
               ├─📁introduce
               ├─📁layout
               ├─📁mng                              
               │  ├─📁apply
               │  │  ├─📁purchase
               │  │  ├─📁rental
               │  │  └─📁sale
               │  ├─📁board
               │  │  ├─📁faq
               │  │  ├─📁notice
               │  │  ├─📁productqna
               │  │  └─📁qna
               │  ├─📁content
               │  ├─📁layout
               │  ├─📁pay
               │  ├─📁product
               │  └─📁user
               ├─📁mypage
               ├─📁product
               │  └─📁categories
               └─📁user 
```


