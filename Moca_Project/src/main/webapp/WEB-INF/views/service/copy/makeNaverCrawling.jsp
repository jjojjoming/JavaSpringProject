<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--<link rel="stylesheet" href="https://pm.pstatic.net/dist/css/nmain.20220317.css">--%>
<%--<link rel="stylesheet" href="https://ssl.pstatic.net/sstatic/search/pc/css/sp_autocomplete_210318.css">--%>
<%--<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?1">--%>
<%--<link rel="apple-touch-icon" sizes="114x114" href="https://s.pstatic.net/static/www/u/2014/0328/mma_204243574.png">--%>
<%--<link rel="apple-touch-icon" href="https://s.pstatic.net/static/www/u/2014/0328/mma_20432863.png">--%>
<link href="/resources/css/copy.jae.css" rel="stylesheet">

<style>
    #query {
        margin: 0px;
        position: relative;
        width: 582px;
        height: 52px;
        border: 2px solid #19ce60;
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
        margin-bottom: 30px;
        margin-top: -7.6px;
        width: 66px;
        height: 66px;
        /*background-color: #19ce60;*/
        border-radius: 0 2px 2px 0;
        cursor: pointer;
    }
    .copy_body{
        width: 100%;
    }

</style>
<div class="copy_body">
    <div class="copy_container">
        <div class="copy_title">네이버에서 광고 카피 트랜드 둘러보기</div>
        <div id="search" class="search_area" style="margin-top: 5px">
            <form id="sform" name="sform" action="/service/copy/naver/result" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <fieldset>
                    <div class="green_window">
                        <input id="query" name="query" type="text" title="검색어 입력" maxlength="255" class="input_text"
                               tabindex="1" accesskey="s" style="ime-mode:active;" autocomplete="off"
                               placeholder="검색어를 입력해 주세요." onclick="document.getElementById('fbm').value=1;" value=""
                               data-atcmp-element="">
                        <input id="search_btn" type="image" src="/resources/img/naver-icon-style.png" class="btn_submit" alt="검색"/>
                    </div>

                </fieldset>
            </form>
            <!-- 자동완성레이어 -->

        </div>
    </div>
</div>