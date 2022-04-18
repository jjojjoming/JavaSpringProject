<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<s:eval var="activeProfile" expression="@environment.getActiveProfiles()" />

<fmt:setLocale value="ko"/>

<!DOCTYPE html>
<html lang="ko">
<head>

    <c:set var="now" value="<%=new java.util.Date()%>" />
    <c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" /></c:set>

    <c:if test="${activeProfile[0] == 'prod'}">
    </c:if>

    <title>모두의 카피 -MOCA</title>
    <link rel="canonical" href="https://www.xxxx.co.kr/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, users-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="description" content="카피라이트">
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <meta property="og:title" content="모두의 카피 - MOCA">
    <meta property="og:description" content="인공지능 카피라이터 - MOCA">
    <meta property="og:image" content="https://d1ckd324hatig8.cloudfront.net/empty-user.png">
    <meta property="og:url" content="https://moca.musstry.co.kr">

    <!-- Favicon -->
    <link href="/resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/global.css" rel="stylesheet">

    <link rel="stylesheet" href="/resources/css/copy.jae.css">

    <%-- core Javascript--%>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>--%>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

   <style>
       .SideMenu{
         position: fixed;
         z-index: 9999;
       }

       .logo {
         /*font-size: 4rem;*/
         background: linear-gradient(to right top, #f5d952, #fda346);
         color: transparent;
         -webkit-background-clip: text;
         font-size: 3.5rem
       ;
       }

       .SideMenu__head--user .top{
         margin: 30px 0;
         display: flex;
         justify-content: space-around;
         color: #979797;;
       }

       .SideMenu__head--user .top i{
         font-size: 2.5rem;
       }

   </style>
    </head>
<body>

<div class="GeneralHeader__wrapper" style=" display: none;">
    <div class="SideMenu isOpen CR__hidden--L">
        <div role="button" tabindex="0" class="SideMenu__background" id="SideMenu__background"></div>
        <div class="SideMenu__container">
            <div class="SideMenu__head">
                <div class="SideMenu__head--user">
                    <div class="top">
                        <security:authorize access="hasRole('ROLE_USER')">
                            <security:authentication var="users" property="principal"/>
                            <a href="/user/info">
                                <i class="fa-solid fa-user-gear"></i>
                            </a>
                        </security:authorize>
                        <button id="close">
                            <i class="fa-solid fa-square-xmark"></i>
                        </button>
                    </div>
                    <div>
                        <a href="/" class="navbar-brand p-0">
                            <h1 class="m-0 logo">MoCa</h1>
                        </a>
                    </div>
                    <div>
                        <security:authorize access="hasRole('ROLE_USER')">
                            <security:authentication var="users" property="principal"/>
                            <p style="color:#979797;">${user.name} 님</p>
                        </security:authorize>
                    </div>
                </div>
            </div>
            <div class="SideMenu__menuWrapper">
                <div class="SideMenu__menuEach">
                    <security:authorize access="isAnonymous()">
                        <div class="SignForm__submitBtnWrapper header">
                            <a href="/login" class="ButtonGeneral SignForm__submitBtn"><span>로그인</span></a>
                            <a href="signup" class="ButtonGeneral SignForm__submitBtn"><span>회원가입</span></a>
                        </div>
                    </security:authorize>
                </div>
                <a class="SideMenu__menuEach" href="/service">시작하기</a>
                <a class="SideMenu__menuEach" href="/team">TEAM</a>
                <security:authorize access="hasRole('ROLE_USER')">
                    <security:authentication var="users" property="principal"/>
                        <a class="SideMenu__menuEach" href="/cs/faq">FAQ</a>
                        <form name="logoutForm" method="post" action="/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button type="submit" class="SideMenu__menuEach">
                                <i class="fa-solid fa-arrow-right-to-bracket"></i>
                                로그아웃
                            </button>
                        </form>
                </security:authorize>
            </div>
        </div>
    </div>
</div>

<div class="container-xxxl bg-white p-0">
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>

    <c:set var="URL" value="${requestScope['javax.servlet.forward.request_uri']}"/>
    <c:choose>
        <c:when test="${URL == '/login' or URL == '/signup' or URL == '/signup/email'}">
            <t:insertAttribute name="body" />
        </c:when>
        <c:otherwise>
            <t:insertAttribute name="header" />
            <t:insertAttribute name="body" />
            <t:insertAttribute name="footer" />
        </c:otherwise>
    </c:choose>
</div>

<script src="/resources/lib/wow/wow.min.js"></script>
<script src="/resources/lib/easing/easing.min.js"></script>
<script src="/resources/lib/waypoints/waypoints.min.js"></script>
<script src="/resources/lib/counterup/counterup.min.js"></script>
<script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/resources/lib/isotope/isotope.pkgd.min.js"></script>
<script src="/resources/lib/lightbox/js/lightbox.min.js"></script>

<!-- Template Javascript -->
<script src="/resources/js/main.js"></script>

<script>

  $(function () {
    $("#sideMenu").on("click", function () {
      $(".GeneralHeader__wrapper").css("display", "block")
    });

    $("#close").on("click", function () {
      $(".GeneralHeader__wrapper").css("display", "none")
    });

    $("#SideMenu__background").on("click", function () {
      $(".GeneralHeader__wrapper").css("display", "none")
    });
  });

</script>
</body>
</html>
