<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link rel="stylesheet" href="/resources/css/question.css">

<style>
  h1.Header_title__2oXkX span {
    font-size: 15px;
    font-weight: 400;
    color: #7c7d80;
  }

  span.ListItem_new__FQ3iR img {
    width: auto;
    height: 15px;
  }

  .community_container__bXvMW {
    margin-top: 100px;
  }

  .CommunityContentShow {
    padding-bottom: 0 !important;
  }
  .GeneralLayout_content__3FS7b{
    min-height: auto;
  }

  .CommunityContentShow__q--header{
      padding-top: 5.3rem;
      padding-bottom: 0rem;
  }
    .CommunityEachBody__bodyWrapper{
        padding-top: 0.5rem;
        margin-left: 10px;
        margin-right: 10px;
    }
    .CommunityQuestionHead__title--text{
        margin-left: 10px;
    }
  .ButtonInteractive_container__NfRis {
      width: 150px;
      position: relative;
      display: flex;
      align-items: center;
      justify-content: center;
      border: none;
      border-radius: 1.1rem;
      box-shadow: 0 .8rem 1.6rem 0 rgba(143, 0, 255, .13);
      background-image: linear-gradient(309deg, #710ad2, #8e43e6);
      color: #fff;
      padding: 1.6rem 6.2rem 1.1rem
  }

  .ButtonInteractive_container__NfRis.ButtonInteractive_withIcon__ECQZi {
      padding: 1.6rem 5.2rem 1.1rem 4.7rem
  }
  .bt_wrap2{
      margin-left: 50px;
  }

  .bt_wrap3{
      margin-left: 50px;
  }

  .boardContentView {
      display: block;
      width: 100%;
      height: 300px;
      padding: 15px;
      box-sizing: border-box;
      resize: none;
      border-radius: 0.4rem;
      border: 0.1rem solid #c5c7d0;
      outline-color: #6222CC;
  }
  /*내용작성 스크롤바 Css*/
  .boardContentView::-webkit-scrollbar {
      width: 10px;
  }
  .boardContentView::-webkit-scrollbar-thumb {
      background-color: #7436d7;
      border-radius: 10px;
  }
  .boardContentView::-webkit-scrollbar-track {
      background-color: grey;
      border-radius: 10px;
      box-shadow: inset 0px 0px 5px white;
  }
    .CommunityEachBody question{
        padding-top: 15px;
    }

    .CommunityQuestionHead__createdTime{
        margin-left: 10px;
    }
</style>


<div class="container-xxl py-5">
    <div class="community_container__bXvMW">
        <div class="GeneralLayout_content__3FS7b">
            <div class="CommunityContentShow">
                <div class="CommunityContentShow__q CommunityContentShow__box">
                    <div class="CommunityQuestionHead CommunityContentShow__q--header">

                        <div class="CommunityQuestionHead__header">
                            <div class="CommunityQuestionHead__header--text">
                                <strong class="boardTitle">제목</strong>
                                <div class="CommunityQuestionHead__title">
                                    <span class="CommunityQuestionHead__title--text CommunityQuestionHead__title--noLink" data-cy="threads-title">
                                        ${readFaqBean.subject}
                                    </span>
                                </div>
                                <div class="CommunityQuestionHead__createdTime">${readFaqBean.writeDay}</div>
                                <div class="CommunityQuestionHead__watch CR__hidden--S">
                                    <div class="QuestionWatch_container__lDJlT" data-cy="question-watch">
                                        <button class="QuestionWatch_button__WWFbH" type="button"
                                                data-cy="question-watch-button">
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="CommunityQuestionHead__profile CR__hidden--S">
                                <div class="UserAvatarWrapper">
                                    <div class="UserAvatar stone">
                                        <div class="UserAvatar__level">
                                            <img alt="profile" src="https://d1ckd324hatig8.cloudfront.net/empty-user.png" class="UserAvatar__level__img">
                                        </div>
                                        <span class="UserAvatar__name">${readFaqBean.name}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="CommunityEachBody question">
                        <div class="BookmarkBtn BookmarkBtn--unchecked "></div>
                        <strong class="boardContent">내용</strong>
                        <div class="CommunityEachBody__bodyWrapper question">
                            <div class="CommunityEachBody__content question">
                                <div class="Viewer_container__odwvV">
                                    <div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                        <div class="toastui-editor-contents" style="overflow-wrap: break-word;">
                                            <div data-nodeid="1">
                                                <textarea class="boardContentView" id="content" name="content" readonly="readonly">${readFaqBean.content}</textarea>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="CommunityEachBody__commentContainer">
                            <div class="CommunityCommentTemplate">
                                <div class="bt_wrap">

                                    <div class="bt_wrap1" style="float: left">
                                        <a href="faq" class="ButtonInteractive_container__NfRis ButtonInteractive_withIcon__ECQZi" style="padding: 1.2rem 2.7rem 0.8rem 2.2rem;">
                                            <span class="Header_buttonText__zPcGR">문의글 보기</span>
                                        </a>
                                    </div>
                                    <c:if test="${user.id == readFaqBean.userId}">
                                        <div class="bt_wrap2" style="float: left">
                                            <a href="modify?userId=${readFaqBean.userId}&boardId=${readFaqBean.boardId}" class="ButtonInteractive_container__NfRis ButtonInteractive_withIcon__ECQZi" style="padding: 1.2rem 2.7rem 0.8rem 2.2rem;">
                                                <span class="Header_buttonText__zPcGR">수정하기</span>
                                            </a>
                                        </div>
                                        <div class="bt_wrap3" style="float: right">
                                            <a href="inquiryDelete?boardId=${readFaqBean.boardId}" class="ButtonInteractive_container__NfRis ButtonInteractive_withIcon__ECQZi" style="padding: 1.2rem 2.7rem 0.8rem 2.2rem;">
                                                <span class="Header_buttonText__zPcGR">삭제하기</span>

                                            </a>
                                        </div>

                                    </c:if>
                                </div>
                                <button class="CommunityCommentTemplate__ctrlBtn">
                                    <%--                                    <span style="color: rgb(169, 171, 183);">댓글 없음</span>--%>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
