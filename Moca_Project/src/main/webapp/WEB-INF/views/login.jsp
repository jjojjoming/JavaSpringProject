<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link type="text/css" rel="stylesheet" href="/resources/css/login.css"/>

<%-- 로그인 영역 --%>
<div class="SignForm SignIn__form" style="justify-content: center">
    <div class="SignForm__top">
        <div class="SignIn__header">
            <a href="/" class="navbar-brand p-0">
                <h1 class="m-0 login-logo">MoCa</h1>
            </a>
            <p>회원이 아니신가요?
                <a href="/signup">회원가입 하기</a>
            </p>
        </div>
    </div>

    <div class="SignForm__middle">
        <form name="loginPageForm" action="/loginProcess" method="post" autocomplete="off" onsubmit="return">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <p class="titleText">이메일</p>
            <div class="InteractiveInput ">
                <input type="email" name="email"  placeholder="이메일을 입력해 주세요." required>
                <p class="message message-"></p>
            </div>

            <p class="titleText">비밀번호</p>
            <div class="InteractiveInput ">
                <input type="password" name="password" placeholder="비밀번호를 입력해 주세요." autocomplete="current-password" required>
                <p class="message message-"></p>
            </div>
            <c:if test="${withdrawal}">
                <p style="color: red">
                    <strong>탈퇴한 회원입니다. 사용할 수 없는 계정입니다.</strong>
                </p>
            </c:if>
            <c:if test="${error}">
                <p style="color: red"><strong>아이디(email)</strong> 혹은 <strong>패스워드</strong>가 올바르지 않습니다.</p>
            </c:if>
            <div class="SignForm__submitBtnWrapper">
                <button type="submit" class="ButtonGeneral SignForm__submitBtn ButtonGeneral__orange"><span>로그인 하기</span>
                </button>
            </div>
        </form>


        <div class="SignForm__oauthWrapper">
            <span style="margin: 0">SNS 간편 로그인</span>
            <a href="#" onclick="kakaoLogin()" class="SignForm__oauthCircle SignForm__oauthCircle--kakao">
                <div class="SignForm__oauth SignForm__oauth--kakao"></div>
            </a>
        </div>
    </div>


    <div class="SignForm__bottom">
        <button id="findPassword2" type="button" class="findPassword" data-toggle="modal" data-target="#findPasswordModal">비밀번호 찾기</button>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="findPasswordModal" tabindex="-1" role="dialog" aria-labelledby="findPasswordModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="Popup__contentWrapper" id="find-password-modal">
                        <div class="PopupGeneral PopupGeneral__iconPosition--top PopupGeneral__hasTitle ">
                            <%--<img alt="close" src="/resources/img/logo/closeBtn.png" class="PopupGeneral__closeBtn" data-dismiss="modal"/>--%>
                            <button class="PopupGeneral__closeBtn" data-dismiss="modal">
                                <i class="fa-solid fa-circle-xmark"></i>
                            </button>
                            <div class="PopupGeneral__contents">
                                <%--<img alt="popup icon" class="PopupGeneral__contents--iconTop" src="/resources/img/logo/icon__lock.png">--%>
                                <button class="PopupGeneral__contents--iconTop">
                                    <i class="fa-solid fa-unlock-keyhole"></i>
                                </button>
                                <div class="PopupGeneral__contents--title">
                                    <p>
                                    <p class="popupChangePW__title">비밀번호 재설정하기</p>
                                    </p>
                                </div>
                                <div class="PopupGeneral__contents--body"><p class="popupChangePW__description">이메일로 비밀번호 재설정 링크를 보내드려요.</p>
                                    <input id="find-email"autocomplete="off" class="popupChangePW__input" placeholder="가입시 등록한 이메일을 입력해 주세요.">
                                </div>
                            </div>
                            </p>

                            <div class="PopupGeneral__btns">
                                <div class="SignForm__submitBtnWrapper">
                                    <span id="vaildEmail"></span>
                                    <button type="button" id="sendEmail" class="ButtonGeneral SignForm__submitBtn ButtonGeneral__orange"><span>메일로 보내기</span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="/resources/js/sns/kakao-login.js"></script>

<%--비밀번호 찾기--%>
<script type="text/javascript" src="/resources/js/find-password.js"></script>



