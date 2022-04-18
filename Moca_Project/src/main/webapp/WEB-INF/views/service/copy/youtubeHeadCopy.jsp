<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link href="/resources/css/copy.jae.css" rel="stylesheet">

<style>
    #brandName {
        margin: 0px;
        position: relative;
        width: 582px;
        height: 52px;
        border: 2px solid #f5402f;
        -webkit-border-radius: 2px;
        border-radius: 2px;
        padding-left: 10px;
    }

    .btn_submit {
        position: absolute;
        /*top: 0;*/
        /*right: 0;*/
        /*bottom: 0;*/
        margin-left: -7px;
        /*margin-bottom: 30px;*/
        /*margin-top: -7.6px;*/
        width: 66px;
        height: 52px;
        /*background-color: #19ce60;*/
        border-radius: 0 2px 2px 0;
        cursor: pointer;
    }
    .copy_body{
        width: 100%;
    }
    #search_btn{
        width: auto;
        padding-left: 20px;
    }
</style>

<div class="container-xxl py-5">
    <div class="GeneralLayout_content__3FS7b">
        <div class="Catalog__containers">
            <div class="Catalog__wrapper">
                <jsp:include page="/WEB-INF/layout/sidebar.jsp">
                    <jsp:param name="pageName" value="sidebar"/>
                </jsp:include>

                <div class="copy_body">
                    <div class="copy_container">
                        <div class="copy_title">유튜브에서 제목 카피 트랜드 둘러보기</div>
                        <div id="search" class="search_area" style="margin-top: 5px">
                            <form action="/service/copy/youTubeCopyProcess" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <fieldset>
                                    <div class="green_window">
                                        <input id="brandName" name="brandName" type="text" title="검색어 입력"
                                               maxlength="255" class="input_text" tabindex="1" accesskey="s"
                                               style="ime-mode:active;" autocomplete="off" placeholder="검색어를 입력해 주세요."
                                               onclick="document.getElementById('fbm').value=1;" value=""
                                               data-atcmp-element="">
                                        <input id="search_btn" type="image" src="/resources/img/1590430652red-youtube-logo-png-xl.png" class="btn_submit" alt="검색"/>
                                    </div>

                                </fieldset>
                            </form>
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


<%--                <div class="copy_body">--%>
<%--                    <div class="copy_container">--%>
<%--                        <div class="copy_title">유튜브 트렌드 타이틀</div>--%>
<%--                        <div class="copy_content">--%>
<%--                            <form action="/service/copy/youTubeCopyProcess" method="post">--%>
<%--                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
<%--                                <div class="copy_user-details">--%>
<%--                                    <div class="copy_input-box">--%>
<%--                                        <span class="copy_details">회사 / 제품 / 서비스명</span>--%>
<%--                                        <input type="text" name="brandName" id="brandName" placeholder="입력하세요" required>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="copy_button">--%>
<%--                                    <input type="submit" id="" value="카피 만들기">--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
