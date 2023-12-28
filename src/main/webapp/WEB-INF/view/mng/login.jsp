<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 로그인</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .mng--login--container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .mng--login--div {
            text-align: center;
            width: 400px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 40px 20px;
        }

        .mng--login--input--form {
            margin-top: 20px;
        }

        .mng--float--left{
            float: left;
        }

        .mng--login--image {
            width: -webkit-fill-available;
        }
    </style>
</head>
<body>

<div class="mng--login--container">
    <div class="mng--login--div">
        <img class="mng--login--image" src="/images/Logo.png" />
        <form class="mng--login--input--form" action="/mng/sign-in" method="post">
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="username" class="mng--float--left">아이디</label> <%-- 영어, 숫자만 입력 가능하도록 처리 --%>
                    <input type="text" class="form-control" id="username" name="username"
                           placeholder="아이디를 입력하세요" required
                           oninput="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');"
                           <%--value="admin"--%>
                    >
                </div>
                <div class="form-group col-md-12">
                    <label for="password" class="mng--float--left">비밀번호</label> <%-- 영어, 숫자, 특수문자만 입력 가능하도록 처리 --%>
                    <input type="password" class="form-control" id="password" name="password"
                           placeholder="비밀번호를 입력하세요" required
                           oninput="this.value=this.value.replace(/[^a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]/g,'');"
                           <%--value="1234"--%>
                    >
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block">관리자 로그인</button>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>