<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link href="/resources/css/notice.min.css" rel="stylesheet">

<style>
  #details[open] {
    background-color: #cdedfd;
    background-image: linear-gradient(
      319deg,
      #cdedfd 0%,
      #ffec82 37%,
      #ffcfd3 100%
    );
  }
</style>
<div class="container-xxl py-5">
    <div class="GeneralLayout_content__3FS7b">
        <div class="Catalog__containers">
            <div class="Catalog__wrapper">
                <jsp:include page="/WEB-INF/layout/sidebar.jsp">
                    <jsp:param name="pageName" value="sidebar"/>
                </jsp:include>
                <div id="wrap">
                    <div id="contents">
                        <div class="contents_top">
                            <h2 class="contents_tit">공지사항</h2>
                        </div>
                        <div class="pf-main-content pf-notice pf-accordion" id="notice">
                            <div class="pf-body">
                                <div class="tab-content">
                                    <div class="container">
                                        <ol class="pf-accordion-items notice-list">
<%--                                            <details id="details">--%>
<%--                                                <summary>asdsadasd</summary>--%>
<%--                                                <span>asdasdsad</span>--%>
<%--                                            </details>--%>
                                            <c:forEach items="${headerNoticeList}" var="item">
                                                <li class="noti">
                                                    <div class="accordion-title">
                                                        <span class="title">${item.title}</span>
                                                    </div>
                                                    <div class="accordion-cont">${item.content}</div>
                                                </li>
                                            </c:forEach>
                                            <c:forEach items="${noticeList}" var="item">
                                                <li class="normal">
                                                    <div class="accordion-title">
                                                        <span class="title">${item.title}</span>
                                                    </div>
                                                    <div class="accordion-cont">${item.content}</div>
                                                </li>
                                            </c:forEach>
                                        </ol>
                                        <div class="pager-wrap">
                                            <ul class="pager">
                                                <c:if test="${pagerInfo.startPageIndex > pagerInfo.blockPage}">
                                                    <li>
                                                        <a href="javascript:goPage(${pagerInfo.startPageIndex -pagerInfo.blockPage});"><i
                                                                class="fa fa-angle-left" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:if>
                                                <c:forEach begin="${pagerInfo.startPageIndex}"
                                                           end="${pagerInfo.endPageIndex}"
                                                           var="index">
                                                    <li
                                                            <c:if test="${pagerInfo.currentPage == index}">class="active"</c:if>>
                                                        <c:choose>
                                                            <c:when test="${pagerInfo.currentPage == index}">
                                                                <strong>${index}</strong>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="javascript:goPage(${index});">${index}</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                </c:forEach>
                                                <c:if test="${pagerInfo.endPageIndex < pagerInfo.pageTotal}">
                                                    <li><a href="javascript:goPage(${pagerInfo.endPageIndex + 1});"><i
                                                            class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                                                </c:if>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
  function replaceQueryParam(param, newval, search) {
    let regex = new RegExp("([?;&])" + param + "[^&;]*[;&]?");
    let query = search.replace(regex, "$1").replace(/&$/, '');

    return (query.length > 2 ? query + "&" : "?") + (newval ? param + "=" + newval : '');
  }

  function goPage(page) {
    location.href = location.pathname + replaceQueryParam("page", page, window.location.search);
  }
</script>
<script src="/resources/js/notice.js"/></script>

