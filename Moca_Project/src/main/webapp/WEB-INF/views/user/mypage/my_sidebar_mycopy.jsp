<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="Catalog__tab__container">
    <div class="Tabs">
        <div class="Tabs__button">
            <div class="Tabs__button__wrapper">
                <div>
                    <a href="/user/info" type="button" class="TabButton__button theme--PURPLE" id="TabButton__button1">
                        <div class="TabButton__button__circle"></div>
                        <span class="TabButton__button__title">내 정보</span>
                        <span class="TabButton__button__count">>></span></a>
                    </a>
                    <div class="Tabs__button-divider"></div>
                </div>
                <div>
                    <a href="/user/mycopy" type="button" class="TabButton__button theme--PURPLE_BRIGHT" id="TabButton__button2">
                        <div class="TabButton__button__circle"></div>
                        <span class="TabButton__button__title">카피 보관함</span>
                        <span class="TabButton__button__count">>></span></a>
                    <div class="Tabs__button-divider"></div>
                </div>
                <div>
                    <a href="/user/review" type="button" class="TabButton__button theme--PURPLE_BRIGHT" id="TabButton__button3">
                        <div class="TabButton__button__circle"></div>
                        <span class="TabButton__button__title">나의 게시물</span>
                        <span class="TabButton__button__count">>></span></a>
                    <div class="Tabs__button-divider"></div>
                </div>
                <div>
                    <a href="/user/withdrawal" type="button" class="TabButton__button theme--PURPLE_BRIGHT" id="TabButton__button__withdrawal">
                        <div class="TabButton__button__circle"></div>
                        <span class="TabButton__button__title">회원탈퇴</span>
                        <span class="TabButton__button__count">>></span></a>
                    <div class="Tabs__button-divider"></div>
                </div>

            </div>
        </div>
    </div>
</div>
<c:set var="URL" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<input type="hidden" value="${URL}" id="URL">
<script>
    $(document).ready(function() {

        if($('#URL').val() == '/user/info') {
            $('#TabButton__button1').addClass('selected');
        }
        else if($('#URL').val() == '/user/mycopy') {
            $('#TabButton__button2').addClass('selected');
        }
        else if($('#URL').val() == '/user/review') {
            $('#TabButton__button3').addClass('selected');
        }
        else if($('#URL').val() == '/user/withdrawal') {
            $('#TabButton__button__withdrawal').addClass('selected');
        }
        else if($('#URL').val() == '/user/withdrawal/check') {
            $('#TabButton__button__withdrawal').addClass('selected');
        }
        else if($('#URL').val() == '/user/withdrawal/Code') {
            $('#TabButton__button__withdrawal').addClass('selected');
        }
    })
</script>