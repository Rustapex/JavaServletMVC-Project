<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 40px;
    }
    .form-wrap {
        max-width: 420px;
    }
    label {
        display: block;
        margin-top: 14px;
    }
    input {
        box-sizing: border-box;
        width: 100%;
        padding: 10px;
        margin-top: 6px;
    }
    button {
        margin-top: 18px;
        padding: 10px 16px;
    }
    .error {
        color: #c62828;
        margin-top: 12px;
    }
</style>
</head>
<body>
    <div class="form-wrap">
        <h1>로그인</h1>

        <p class="error">${errorMsg}</p>

        <form action="${pageContext.request.contextPath}/login.do" method="post">
            <label for="userId">아이디</label>
            <input type="text" id="userId" name="userId" required>

            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">로그인</button>
        </form>

        <p>
            <a href="${pageContext.request.contextPath}/join.do">회원가입</a>
        </p>
    </div>
</body>
</html>
