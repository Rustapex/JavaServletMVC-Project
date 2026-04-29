<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 40px;
    }
    .form-wrap {
        max-width: 460px;
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
    .inline-button {
        margin-top: 8px;
    }
    .error {
        color: #c62828;
        margin-top: 12px;
    }
    .message {
        margin-top: 8px;
    }
</style>
</head>
<body>
    <div class="form-wrap">
        <h1>회원가입</h1>

        <p class="error">${errorMsg}</p>

        <form action="${pageContext.request.contextPath}/join.do" method="post">
            <label for="userId">아이디</label>
            <input type="text" id="userId" name="userId" maxlength="30"
                value="${member.userId}" required>
            <button type="button" class="inline-button" id="idCheckButton">아이디 중복 확인</button>
            <p class="message" id="idCheckMessage"></p>

            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" minlength="4" required>

            <label for="name">이름</label>
            <input type="text" id="name" name="name" value="${member.name}" required>

            <label for="email">이메일</label>
            <input type="email" id="email" name="email" value="${member.email}" required>

            <button type="submit">가입하기</button>
        </form>

        <p>
            <a href="${pageContext.request.contextPath}/login.do">로그인으로 돌아가기</a>
        </p>
    </div>

    <script>
        document.getElementById('idCheckButton').addEventListener('click', function () {
            var userId = document.getElementById('userId').value;
            var message = document.getElementById('idCheckMessage');

            fetch('${pageContext.request.contextPath}/member/idCheck.do?userId='
                    + encodeURIComponent(userId))
                .then(function (response) {
                    return response.json();
                })
                .then(function (data) {
                    message.textContent = data.message;
                    message.style.color = data.available ? '#2e7d32' : '#c62828';
                })
                .catch(function () {
                    message.textContent = '아이디 중복 확인 중 오류가 발생했습니다.';
                    message.style.color = '#c62828';
                });
        });
    </script>
</body>
</html>
