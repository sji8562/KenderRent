<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>KendeRent</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<div class="container">
  <!-- 로그인 버튼 -->
  <style>
  .custom-link {
    color: black; /* 텍스트 색상을 검은색으로 설정 */
    text-decoration: none; /* 텍스트 밑줄 제거 */
    transition: color 0.3s; /* 색상 변경 시 부드럽게 전환될 수 있도록 설정 */
  }

  .custom-link:hover {
    color: black; /* 호버 상태에서도 색상이 변경되지 않도록 설정 */
  }
</style>
<meta charset="UTF-8">
</head>
<body>
<div class="d-flex justify-content-end mt-2">
  <a href="/" class="custom-link">홈</a>&nbsp; &nbsp;
  <a href="api/user/join" class="custom-link">회원가입</a>&nbsp; &nbsp;
  <a href="api/user/login" class="custom-link">로그인</a>&nbsp; &nbsp;
</div>

  <!-- 네브바 -->
  <nav class="navbar navbar-expand-sm mt-4">
    <div class="container-fluid d-flex justify-content-center">
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse ms-auto">
      <form class="d-flex">
        <input class="form-control me-2" type="text" placeholder="Search">
        <button class="btn btn-primary" type="button" style="margin-right: 10px;">Search</button>
      </form>
    </div>
  </nav>
</div>