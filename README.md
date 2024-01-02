<h1>Kinder Lend 👶</h1>

<h3>이 프로젝트는 Annotation 기반 Spring MVC 패턴으로 웹 애플리케이션을 구현하였습니다.</h3>
<br>

<div align="center"> 
  <img src="src/main/resources/static/images/Logo.png" width=300>
  <p><strong>Kinder Lend는 안전한 중고 유아 용품 대여를 통해 부모들에게 편안하고 경제적인 대안을 제공하며, <br> 지속 가능한 소비 문화를 선도합니다.</strong></p>  
</div>
<br>




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
        <li>[관리자] 결제 관리 페이지 HTML, CSS 작업, 데이터 바인딩, 페이징 기능 구현</li>
        <li>[관리자] 물품 관리 페이지 HTML, CRUD 기능, 검색 및 페이징 기능 구현</li>
        <li>[관리자] 1, 2차 카테고리 관리 HTML, CRD 기능 구현</li>
        <li>[관리자] 후기 관리 HTML, 조회 및 삭제, 검색 및 페이징 기능 구현</li>
        <li>[관리자] 1:1 문의 HTML, RUD 기능, 조회 및 삭제, 검색 및 페이징 기능 구현</li>
        <li>[관리자] FAQ HTML, CRUD 기능, 검색 및 페이징 기능 구현</li>
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
    <li>[관리자] 회원 RUD ,HTML, CSS ,데이터바인딩 , 페이징 작업</li>
    <li>[관리자] 신청관리  RUD,HTML, ,데이터바인딩 , 페이징  CSS작업</li>
    <li>[관리자] 공지사항 CRUD,HTML, ,데이터바인딩 , 페이징  CSS작업</li>
    <li>[관리자] 대시보드,HTML, CSS  ,데이터바인딩</li>
    <li>[관리자] 모든 컨트롤러 예외처리</li>
    <li>[관리자] 모든 스크립트 문법 mng.js로 옮김</li>
    <li>[관리자] 모든 css 문법 mng.css로 옮김</li>
    <li>[사용자] 렌트 리스트 HTML CSS작업</li>
    <li>[사용자] 렌트 리스트 조회 기능구현</li>
    <li>[사용자] 헤더 정리</li>
    <li>[사용자] 소셜로그인 clientkey secretkey 변수화</li>
    <li>[사용자] 회원정보 수정 HTML , CSS ,데이터바인딩 작업</li>
    <li>[사용자] 문의내역 리스트  HTML , CSS ,데이터바인딩 작업</li>
    <li>[사용자] footer CSS 작업</li>
    <li>[사용자] 헤더 코드테이블 작업</li>
    
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
    <li>API 명세서 작성</li>
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
- **수익모델** : 저희는 중고 제품을 구매하고 판매하거나 대여하는 공유 경제 기반의 서비스입니다. <br> 이를 위해 제품의 대여 서비스 이용료와 구매한 가격에 일정한 마진을 부과하여 이를 판매하는 마진 기반의 수익 모델을 채택하고 있습니다. <br> 이를 통해 소비자들은 저렴한 가격에 제품을 얻을 수 있고, 동시에 공유 경제의 원칙에 따라 중고 제품을 효율적으로 활용하며, 우리는 제품의 추가 가치를 창출하여 수익을 얻고 있습니다.
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
    
- **화면 구성** 💻
  
  `* 사용자 *`
  
<div align="center"> 
  
|<img src="https://github.com/sji8562/KenderRent/assets/94952331/46368217-01ad-45a7-ae12-36298a394854/" width=400>|<img src="https://github.com/sji8562/KinderLend/assets/94952331/e279dd9d-3593-40d5-b7cd-2b077873607d" width=400>|
|:---:|:---:|
|메인 화면|로그인|
|<img src="https://github.com/sji8562/KinderLend/assets/94952331/0c0e99ba-caa6-4d81-9abf-1560c922e9bd" width=400>|<img src="https://github.com/sji8562/KinderLend/assets/94952331/f98ecd43-b8e6-471a-a79c-7bbfdaf2391b" width=400>|
|아이디 찾기|비밀번호 찾기|
|<img src="https://github.com/sji8562/KinderLend/assets/94952331/ff6d344a-5257-4134-8e5b-183d26e52b08" width=400>|<img src="https://github.com/sji8562/KinderLend/assets/94952331/ff311784-b759-431f-92ef-b99ce68bce36" width=400>|
|대여하기|구매하기|
|<img src="https://github.com/sji8562/KinderLend/assets/94952331/bfc5da9a-8e49-4819-b00f-1bcf8291549b" width=400>|<img src="https://github.com/sji8562/KinderLend/assets/94952331/8cb2910a-b7fc-4215-b686-0bb500870674" width=400>|
|결제 화면|장바구니|
|<img src="https://github.com/sji8562/KinderLend/assets/94952331/4d0889db-9e52-4d68-9524-57b306de8f1a" width=400>|<img src="https://github.com/sji8562/KinderLend/assets/94952331/e246be60-23ae-4770-b9b8-d6beae166ece" width=400>|
|주문 내역|주문 상세|
|<img src="https://github.com/sji8562/KinderLend/assets/94952331/1f8a7141-f190-450e-904b-f65b9619643c" width=400>|<img src="https://github.com/sji8562/KinderLend/assets/94952331/5474fc30-9d15-4aa7-a125-9cf0c4571a27" width=400>|
|대여 내역|위시리스트|
|<img src="https://github.com/sji8562/KinderLend/assets/94952331/145d3cad-2da6-4ffc-8947-0773f14e5263" width=400>|<img src="https://github.com/sji8562/KinderLend/assets/94952331/a9754af3-30b9-4bb4-a554-53476c50708c" width=400>|
|취소(환불) 내역|마이페이지|
|<img src="https://github.com/sji8562/KinderLend/assets/94952331/0c5239b4-b94d-43c3-b02b-d088232a86f0" width=400>|<img src="https://github.com/sji8562/KinderLend/assets/94952331/fa6e6c26-cafc-4b04-95e4-00ea81ebca49" width=400>|
|공지사항|1:1문의|
|<img src="https://github.com/sji8562/KinderLend/assets/94952331/b5b25a0f-b671-4aef-b031-7be14fd4d759" width=400>|<img src="https://github.com/sji8562/KinderLend/assets/94952331/ece2f29c-1c76-459c-acd1-9200ed9b0800" width=400>|
|FAQ|상품문의|
|<img src="https://github.com/sji8562/KinderLend/assets/94952331/2104a69f-b009-4501-bca8-1942c7a5f9fe" width=400>|<img src="https://github.com/sji8562/KinderLend/assets/94952331/447808b8-b103-4acb-b24b-9c424faea612" width=400>|
|회사소개|이용안내|
|<img src="https://github.com/sji8562/KinderLend/assets/94952331/a9e31511-77db-4b91-a8c4-cf8471e2ef8e" width=400>|<img src="https://github.com/sji8562/KinderLend/assets/94952331/b6538ab4-09ad-4ade-a1de-412249034812" width=400>|
|소독과정|오시는길|



</div>
<br>

  `* 관리자 *`

<div align="center"> 
  
|<img src="https://github.com/sji8562/KenderRent/assets/94952331/83914283-2415-425b-bb70-4f2e9b61c27b" width=400> |<img src="https://github.com/sji8562/KenderRent/assets/94952331/b1d8df02-cc90-40a3-acb5-64e15c41b35d" width=400>| 
|:---:|:---:|
|메인 화면(대시보드)|회원 관리|
| <img src="https://github.com/sji8562/KenderRent/assets/94952331/35695195-8d69-4fdc-89ba-e37a1ed4a970" width=400> | <img src="https://github.com/sji8562/KinderLend/assets/94952331/8d896d0e-7b2c-4550-b42d-c9955eda60e4" width=400> |
|물품 관리|결제 관리|
| <img src="https://github.com/sji8562/KinderLend/assets/94952331/bfa97cf4-38c0-4d44-b13b-7c5a423d6b99" width=400> | <img src="https://github.com/sji8562/KinderLend/assets/94952331/ccfc8cf6-c04a-4838-ae6f-6449dfcf7da7" width=400> |
|회사소개 관리|카테고리 관리|
| <img src="https://github.com/sji8562/KinderLend/assets/94952331/4d8d4ff3-af5e-4ead-823d-0e075ae852b7" width=400> | <img src="https://github.com/sji8562/KinderLend/assets/94952331/faebfe50-b004-4455-a6da-fa2d93e9004b" width=400> |
|대여신청 관리|게시판 관리|

</div>
<br>

- **시연 영상** 🎬

<div align="center">
  
[![Video Label](http://img.youtube.com/vi/VUfh422nqlQ/0.jpg)](https://youtu.be/VUfh422nqlQ)

</div>

<br><br>

## API 명세서

API 명세서 : https://plume-hardboard-263.notion.site/ffb45515453d49a7b88858de227da757?v=8ee6e86d303747c8a9b70340db28d83f&pvs=4

<details>
  <summary>장바구니 API</summary>
  <img src="https://github.com/sji8562/KinderLend/assets/94952331/a6b842f0-7622-4f78-b75e-a4fab9757971">
</details>
<details>  
  <summary>고객센터 API</summary>
  <img src="https://github.com/sji8562/KinderLend/assets/94952331/78004d14-84fa-40c6-838f-d040273df1d9">
</details>
<details>
  <summary>회사소개 API</summary>
  <img src="https://github.com/sji8562/KinderLend/assets/94952331/754650d9-cf44-4334-b7b3-7d3de3e6b3b3">
</details>
<details>
  <summary>문자 API</summary>
  <img src="https://github.com/sji8562/KinderLend/assets/94952331/ab3af50d-b8dc-4c37-9dd7-6dba34949467">
</details>
<details>
  <summary>마이페이지 API</summary>
  <img src="https://github.com/sji8562/KinderLend/assets/94952331/61d6ffcd-8fdd-447a-b9a8-708b6815abcc">
</details>
<details>
  <summary>상품 API</summary>
  <img src="https://github.com/sji8562/KinderLend/assets/94952331/3838e984-c99a-4efb-971e-4de1b09dc943">
</details>
<details>
<summary>사용자 API</summary>
  <img src="https://github.com/sji8562/KinderLend/assets/94952331/bafc5fcd-eab8-4893-8dff-e4c6b9f388d8">
</details>
<details>
<summary>신청관리 API</summary>
  <img src="https://github.com/sji8562/KinderLend/assets/94952331/1db3fd56-0e1c-495e-a330-7d96fe69c186">
</details>
<details>
<summary>고객센터관리 API</summary>
  <img src="https://github.com/sji8562/KinderLend/assets/94952331/e43d8eca-4b96-4301-8fd9-b2ce324a63cf">
</details>
<details>
<summary>회사소개관리 API</summary>
  <img src="https://github.com/sji8562/KinderLend/assets/94952331/bd1737de-1ea5-47f3-aa0c-5c5b339c42aa">
</details>
<details>
<summary>관리자 API</summary>
  <img src="https://github.com/sji8562/KinderLend/assets/94952331/ae61ff04-3d5f-41c3-8327-b5680d74d0b9">
</details>
<details>
<summary>결제관리 API</summary>
  <img src="https://github.com/sji8562/KinderLend/assets/94952331/faeb812c-633b-419d-bb47-bb80a9292bb6">
</details>







<br>

## STACKS

<details open>
  <summary><strong>Backend</strong></summary>
  <ul>
    <li>SpringBoot: 3.1.6</li>
    <li>Java: 17</li>
    <li>Apache Tomcat: 9.0</li>
  </ul>
</details>
  
[![stackticon](https://firebasestorage.googleapis.com/v0/b/stackticon-81399.appspot.com/o/images%2F1704182842073?alt=media&token=e64d3ee9-b0b5-4242-bf08-d56c5deebe26)](https://github.com/msdio/stackticon)
<br>


<details>
  <summary><strong>Frontend</strong></summary>
  <ul>
    <li>HTML5</li>
    <li>CSS3</li>
    <li>JavaScript</li>
    <li>jQuery</li>
    <li>BootStrap</li>
  </ul>
</details>

[![stackticon](https://firebasestorage.googleapis.com/v0/b/stackticon-81399.appspot.com/o/images%2F1704180563226?alt=media&token=e86c70d3-c393-441a-aa23-e05d2d4b3bd8)](https://github.com/msdio/stackticon)
<br>

<details open>
  <summary><strong>DataBase</strong></summary>
  <ul>
    <li>MySQL: 8.0.31</li>    
  </ul>
</details>

[![stackticon](https://firebasestorage.googleapis.com/v0/b/stackticon-81399.appspot.com/o/images%2F1704180293126?alt=media&token=99aedd38-0935-4373-b2af-6586650cf88f)](https://github.com/msdio/stackticon)
<br>

<details open>
  <summary><strong>BuildTool</strong></summary>
  <ul>
    <li>Gradle: 8.4.0</li>
  </ul>
</details>

[![stackticon](https://firebasestorage.googleapis.com/v0/b/stackticon-81399.appspot.com/o/images%2F1704180470227?alt=media&token=428f7735-33ee-42d9-a000-e6f957b6a486)](https://github.com/msdio/stackticon)
<br>

<details>
  <summary><strong>Communication</strong></summary>
  <ul>
    <li>Notion</li>
    <li>Discord</li>
  </ul>
</details>

[![stackticon](https://firebasestorage.googleapis.com/v0/b/stackticon-81399.appspot.com/o/images%2F1704180504507?alt=media&token=76a14946-e910-44e8-a78c-3bd34be47711)](https://github.com/msdio/stackticon)
<br>


<details open>
  <summary><strong>외부 API</strong></summary>
  <ul>
    <li>카카오톡 소셜 로그인 API</li>
    <li>네이버 소셜 로그인 API</li>
    <li>카카오페이 API</li>
    <li>Kakao 지도 API</li>
    <li>DAUM 주소 API</li>
    <li>coolSMS API (문자 전송)</li>
    <li>Naver Mail API (이메일 인증)</li>
  </ul>
</details>

<br>

<details open>
  <summary><strong>Dependencies</strong></summary>
  <br>
  
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
</details>

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


