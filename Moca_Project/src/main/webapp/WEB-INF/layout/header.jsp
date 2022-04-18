<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
  $(function () {
    let token = $("input[name='_csrf']").val();
    let header = "X-CSRF-TOKEN";

    $(document).ajaxSend(function (e, xhr, options) {
      xhr.setRequestHeader(header, token);
    });

    $.ajaxSetup({
      error: function (xhr, status, err) {
        if (xhr.status == 401) {
//          alert("인증실패(401)");
          alert("잘못된 접근입니다. 로그인 페이지로 이동합니다.");
          location.href = "/login";
        } else if (xhr.status == 403) {
          //          alert("세션만료(403)");
          alert("잘못된 접근입니다. 로그인 페이지로 이동합니다.");
          location.href = "/login";
        }
      }
    });
  });

  let agent = navigator.userAgent.toLowerCase();
  if ((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
    // ie일 경우
    if (window.location.pathname !== "/notSupported") {
      alert("인터넷 익스플로러는 지원하지 않습니다.")
      location.href = "/notSupported"
    }
  }
</script>

<style>
  .SignForm__submitBtnWrapper.header {
    display: flex;
    width: 250px;
  }

  .SignForm__submitBtnWrapper.header a {
    margin-top: 0;
    margin-left: 5px;
    margin-right: 5px;
    padding-top: 5px;
    padding-bottom: 5px;
    width: 120px;
    box-shadow: 0 8px 16px -7px rgb(255 186 111 / 84%);
    background-image: linear-gradient(276deg,#ddce4f, #f38934);
  }

  .SignForm__submitBtnWrapper.header a:before {
    background-image: linear-gradient(273deg, #f5d952, #fda346);
  }

  .SignForm__submitBtnWrapper.header a span {
    font-size: 13px;
  }

  .dropdown-menu i{
    margin-right: 15px;
    font-size: 20px;
    background: linear-gradient(to right top, #f5d952, #fda346);
    color: transparent;
    -webkit-background-clip: text;
  }

  nav.navbar div.div-header{
    display: flex;
    width: 100%;
    max-width: 1250px;
    align-items: center;
    margin: auto;
  }

  .navbar-toggle-div{
    width: 100%;
    display: flex;
    justify-content: right;
  }
  .navbar-toggle-div .navbar-toggler{
    padding: 10px;
    font-size: 1.5rem;
  }
  #navbarCollapse{
    width: 100%;
  }
</style>

<!-- Navbar & Hero Start -->
<div class="position-relative p-0">
    <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0 sticky-top shadow-sm">
        <div class="div-header">
            <div style="display: flex">
                <a href="/" class="navbar-brand p-0">
                    <h1 class="m-0">MoCa</h1>
                </a>
            </div>
            <div class="navbar-toggle-div">
                <button id="sideMenu" class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav mx-auto py-0">
                    <a href="/team" class="nav-item nav-link">TEAM</a>
                    <a href="/service" class="nav-item nav-link">시작하기</a>
                    <!--// 로그인 후 //-->
                    <security:authorize access="hasRole('ROLE_USER')">
                        <security:authentication var="users" property="principal"/>
                        <div class="nav-item dropdown">
                            <c:if test="${empty user.name}">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">${user.email}님</a>
                            </c:if>
                            <c:if test="${not empty user.name}">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">${user.name}님</a>
                            </c:if>
                        
                            <div class="dropdown-menu m-0">
                                <a href="/user/info" class="dropdown-item">
                                    <i class="fa-solid fa-user-astronaut"></i>마이페이지</a>
                                <a href="/cs/faq" class="dropdown-item">
                                <script src="https://kit.fontawesome.com/12fa0b1450.js" crossorigin="anonymous"></script>
                                &nbsp;<i class="fa-solid fa-question"></i>문의 게시판</a>


                                <form name="logoutForm" method="post" action="/logout">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="dropdown-item"><i class="fa-solid fa-arrow-right-to-bracket"></i>로그아웃</button>
                                </form>
                            </div>
                        </div>
                    </security:authorize>

                </div>
                <security:authorize access="isAnonymous()">
                    <div class="SignForm__submitBtnWrapper header">
                        <a href="/login" class="ButtonGeneral SignForm__submitBtn"><span>로그인</span></a>
                        <a href="signup" class="ButtonGeneral SignForm__submitBtn"><span>회원가입</span></a>
                    </div>
                </security:authorize>
            </div>
        </div>
    </nav>
</div>