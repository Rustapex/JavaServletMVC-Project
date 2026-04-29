<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 40px;
    }
    .content-wrap {
        max-width: 560px;
    }
    dl {
        display: grid;
        grid-template-columns: 120px 1fr;
        gap: 10px;
    }
    dt {
        font-weight: bold;
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
    <div class="content-wrap">
        <h1>마이페이지</h1>

        <p class="error">${errorMsg}</p>

        <dl>
            <dt>아이디</dt>
            <dd>${member.userId}</dd>
            <dt>이름</dt>
            <dd>${member.name}</dd>
            <dt>이메일</dt>
            <dd>${member.email}</dd>
            <dt>권한</dt>
            <dd>${member.role}</dd>
            <dt>가입일</dt>
            <dd>${member.createdAt}</dd>
        </dl>

        <h2>회원정보 수정</h2>
        <form action="${pageContext.request.contextPath}/member/update.do" method="post">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" value="${member.name}" required>

            <label for="email">이메일</label>
            <input type="email" id="email" name="email" value="${member.email}" required>

            <button type="submit">수정하기</button>
        </form>

        <p>
            <a href="${pageContext.request.contextPath}/main.do">메인으로</a>
            |
            <a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
        </p>
    </div>
</body>
</html>
