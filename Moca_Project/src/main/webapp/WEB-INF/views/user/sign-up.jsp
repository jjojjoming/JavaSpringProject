<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link rel="stylesheet" href="/resources/css/sign-up-css.css">
<link rel="stylesheet" href="/resources/css/signup-email.css">

<div class="SignUpContainer">
    <div class="SignUpHeader_container__gdFGp">
        <a href="/">
        <h1 class="m-0 sign-up">MoCa</h1>
        <p class="SignUpHeader_message__eOoP7">
            이미 회원이신가요?
            <a class="SignUpHeader_link__BIkIU" href="/login">로그인 하기</a>
        </p>
        </a>
    </div>
    <div class="SignUpContent">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <a href="#" onclick="kakaoLogin()" class="SignUpContent__squareBtn" rel="noreferrer">
        <img alt="kakao icon" src="/resources/img/kakao.png"><span>카카오로 가입하기</span></a>
        <button class="SignUpContent__squareBtn" onclick="location.href='/signup/email'">
            <img alt="mail icon" src="/resources/img/email.png"><span>이메일로 가입하기</span>
        </button>
    </div>
</div>

<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="/resources/js/sns/kakao-login.js"></script>


