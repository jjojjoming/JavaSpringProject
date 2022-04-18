<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link rel="stylesheet" href="/resources/css/question.css">
<script src="https://kit.fontawesome.com/12fa0b1450.js" crossorigin="anonymous"></script>
<style>
    /*타이틀 부분*/
    .board_title {
        margin-bottom: 30px;
        margin-left: 5px;
    }

    .board_title strong {
        font-size: 3rem;
        color:#6222CC
    }

    .board_title p {
        margin-top: 5px;
        font-size: 1.4rem;
    }
    h1.Header_title__2oXkX span{
        font-size: 15px;
        font-weight: 400;
        color: #7c7d80;
    }
    span.ListItem_new__FQ3iR img{
        width: auto;
        height: 15px;
    }
   .ListItem_new__FQ3iR .fa-regular{
        color: #f5d952;
    }

    .Pagination_previousButton__Left{
        margin-right: 15px;
    }
    .Pagination_nextButton__Right{
        margin-left: 15px;
    }
   /* .InquaryText{
        font-size: 15px;
    }*/

</style>
<div class="container-xxl py-5">
    <div class="GeneralLayout_content__3FS7b">
        <div class="community_container__bXvMW">
            <div class="GeneralLayout_content__3FS7b">
                <div class="community_content__qACrW">
                    <div class="community_header__AdorW">
                        <div class="Header_container__HGW4p">
                            <div class="board_title">
                                <strong>문의 게시판</strong>
                                <p/>
                                <h3>문의 사항을 남겨주시면 이메일을 통해 순차적으로 답변드리겠습니다.</h3>
                            </div>
                            <div class="Header_buttonWrapper__qedG2">
                                <a href="write" class="ButtonInteractive_container__NfRis ButtonInteractive_withIcon__ECQZi" style="padding: 1.2rem 2.7rem 0.8rem 2.2rem;">
                                    <span class="Header_buttonText__zPcGR">질문하기</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="community_tools__I9vJo">
                        <div class="Tools_container__8l_zD Tools_withFilter___gLvH">
                            <div class="Tools_searchRow__TVWM5">
                                <div class="Tools_searchWrapper__TDK0l">
                                </div>
                            </div>
                            <div class="Tools_filters__OB5Q0">
                            </div>
                        </div>
                    </div>
                    <div class="community_questions__XzDam">
                        <div>
                            <div class="List_questionBox__5hZiu">
                                <c:forEach var='obj' items="${faqs}">
                                    <div class="List_questionWrapper__49Ukv">
                                        <div class="List_question__yvi1N">
                                            <div class="ListItem_container__aU8Hn ListItem_regular__1_GMg ListItem_large__k18OQ">
                                                <div class="ListItem_contents__nde6Z">
                                                    <a role="button" class="ListItem_title__QygUT" tabindex="0" href="view?boardId=${obj.boardId}&userId=${obj.userId}">
                                                        <span class="ListItem_new__FQ3iR">
                                                            <i class="fa-regular fa-clipboard"></i>
                                                            
                                                        </span>
                                                        <span class="ListItem_new__FQ3iR">${ obj.subject}</span>
                                                    </a>
                                                </div>
                                                <div class="ListItem_profile__aJl52">
                                                    <button type="button">
                                                        <div class="Profile_container___j_Y3">
                                                            <p class="Profile_name__3AVi2">${ obj.name }</p>
                                                            <p class="Profile_time__vpz_O">${ obj.writeDay }</p>
                                                        </div>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="community_pagination__V9VQ1">

                        <div class="Pagination_container__SunX5">
                            <c:choose>
                                <c:when test="${page.currentPage <=1}">


                                </c:when>
                                <c:otherwise>

                                    <a class="Pagination_FirstButton__First" href="faq?page=1"><span
                                            class="Pagination_buttonText__First">First</span></a>
                                    <a class="Pagination_previousButton__Left" href="faq?page=${page.currentPage-1}">

                                        <i class="fa-solid fa-angle-left"></i>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            <div class="Pagination_pageWrapper__P796x">
                                <c:forEach var='idx' begin="${ page.min }" end="${ page.max }">
                                    <c:if test="${idx==page.currentPage}">
                                    <a href="/cs/faq?page=${ idx }" class="Pagination_page__T9uPQ Pagination_selected__AWwCP">${ idx }</a>
                                    </c:if>
                                    <c:if test="${idx!=page.currentPage}">
                                    <a href="/cs/faq?page=${ idx }" class="Pagination_page__T9uPQ" >${ idx }</a>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <c:choose>
                                <c:when test="${page.currentPage >= page.pageCnt}">
                                </c:when>
                                <c:otherwise>
                            <a class="Pagination_nextButton__Right" href="faq?page=${page.currentPage+1}">
                                    <i class="fa-solid fa-angle-right"></i>
                            </a>
                                    <a class="Pagination_lastButton__hGkMG" href="faq?page=${page.pageCnt}"><span
                                            class="Pagination_buttonText__KfRX8">Last</span></a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

