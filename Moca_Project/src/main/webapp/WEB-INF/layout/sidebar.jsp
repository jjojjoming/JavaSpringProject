<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="Catalog__tab__container">
    <div class="Tabs">
        <div class="Tabs__button">
            <div class="Tabs__button__wrapper">
                <div>
                    <a href="/service" type="button" class="TabButton__button theme--PURPLE">
                        <div class="TabButton__button__circle"></div>
                        <span class="TabButton__button__title">모카 서비스</span>
<%--                        <span class="TabButton__button__count">6</span>--%>
                    </a>
                    <div class="Tabs__button-divider"></div>
                </div>
                <div>
                    <a id="head" href="/service/copy/head" type="button" class="TabButton__button theme--PURPLE_BRIGHT">
                        <div class="TabButton__button__circle"></div>
                        <span class="TabButton__button__title">헤드카피</span>
<%--                        <span class="TabButton__button__count"> >> </span>--%>
                    </a>
                    <div class="Tabs__button-divider"></div>
                </div>
                <div>
                    <a id="sales" href="/service/copy/sales" type="button" class="TabButton__button theme--PURPLE_BRIGHT">
                        <div class="TabButton__button__circle"></div>
                        <span class="TabButton__button__title">세일즈카피</span>
<%--                        <span class="TabButton__button__count"> >> </span>--%>
                    </a>
                    <div class="Tabs__button-divider"></div>
                </div>
                <div>
                    <a id="naver" href="/service/copy/naver" type="button" class="TabButton__button theme--NAVER">
                        <div class="TabButton__button__circle"></div>
                        <span class="TabButton__button__title">네이버 광고 카피</span>
                    </a>
                    <div class="Tabs__button-divider"></div>
                </div>
                <div>
                    <a id="youtube" href="/service/copy/youtubeHeadCopy" type="button" class="TabButton__button theme--YOUTUBE">
                        <div class="TabButton__button__circle"></div>
                        <span class="TabButton__button__title">유튜브 카피</span>
                    </a>
                    <div class="Tabs__button-divider"></div>
                </div>
                <div>
                    <a href="/service/copy/sorry" type="button" class="TabButton__button theme--INSTAGRAM">
                        <div class="TabButton__button__circle"></div>
                        <span class="TabButton__button__title">인스타그램 카피</span>
                    </a>
                    <div class="Tabs__button-divider"></div>
                </div>
                <div>
                    <a href="/service/copy/sorry-face" type="button" class="TabButton__button theme--BLUE">
                        <div class="TabButton__button__circle"></div>
                        <span class="TabButton__button__title">페이스북 카피</span>
                    </a>
                    <div class="Tabs__button-divider"></div>
                </div>
                <div>
                    <a href="/service/copy/payment" type="button" class="TabButton__button theme--YELLOW">
                        <div class="TabButton__button__circle"></div>
                        <span class="TabButton__button__title">멤버십</span>
                    </a>
                    <div class="Tabs__button-divider"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
  $(function () {
    "use strict";
    $(".floating-labels .form-control").on("focus blur", function (i) {
      $(this).parents(".form-group").toggleClass("focused", "focus" === i.type || this.value.length > 0)
    }).trigger("blur"), $(function () {
      for (let i = window.location, e = $("a.TabButton__button").filter(function () {
        return this.href == i
      }).addClass("selected").parent().addClass("active"); e.is("div");) e = e.parent().addClass("in").parent().addClass("active")
    });
  });
</script>
