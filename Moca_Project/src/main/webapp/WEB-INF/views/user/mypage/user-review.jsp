<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/faq.css">

<script language="javascript" type="text/javascript">
    <!--
    function openWin(){
        window.open("/user/review/newpage", "리뷰 작성", "width=500, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=no" );
    }

    $(document).ready(function (){
        $.ajaxSetup({
            contentType : 'application/x-www-form-urlencoded; charset=utf-8', //한글깨짐 방지
            success:function(result){
                location.href = "/user/review";
            },
            error:function(jqXHR){
                alert("일시적인 오류입니다.")
                location.href = "/user/review";
            }
        }); //$.ajaxSetup
        $('.delete').click(function (){
            $.ajax({
                type:"post",
                url:"/user/review/trans?reviewId=" + $(this).val()
            });
            alert("삭제 완료")
        });

        $('.update').click(function (){
            var reviewId = '#' + $(this).val()
            $.ajax({
                type:"post",
                url:"/user/review/trans?content=" + $(reviewId).val() + "&reviewId=" + $(this).val()
            });
            alert("수정 완료")
        });
    });

    //-->
</script>

<style>
    p {
        text-align: right;
    }
    .board_wrap {
        margin: 50px;
    }
    textarea {
        display: inline;
        /*background-color: white;*/
        /*color: #666666;*/
        /*!*padding: 15px;*!*/
        /*border-radius: 5px;*/
        border: 2px solid #eeeeee;
        /*outline: #0a539c;*/
        /*font-family: 'Noto Sans KR', sans-serif;*/
        /*font-weight: 500;*/
        /*font-size: 16px;*/
        /*line-height: 1.4;*/
        /*width: 50%;*/
        /*resize: none;*/
        /*transition: all 0.2s;*/
    }
    textarea {
        width: 60%;
        text-align: left;
    }

    textarea {
        text-align: center;
    }

    .objDiv {
        /*height:250px;*/
        display: table-cell;
        vertical-align: middle;

    }

</style>
<!-- Service Start -->
<div class="container-xxl py-5">
    <div class="GeneralLayout_content__3FS7b">
        <div class="Catalog__containers">
            <div class="Catalog__wrapper">
                <jsp:include page="/WEB-INF/views/user/mypage/my_sidebar_mycopy.jsp">
                    <jsp:param name="pageName" value="sidebar"/>
                </jsp:include>
                <div class="board_wrap">
                    <div class="board_title">
                        <strong>나의 리뷰</strong>
                        <p><a href="javascript:openWin()">리뷰 작성하기 -></a></p>
                    </div>
                    <div class="board_list_wrap">
                        <div class="board_list">
                            <div class="top">
                                <div class="num objDiv">번호</div>
                                <div class="title objDiv">리뷰 내용<h5>(클릭하여 내용 수정 후 "수정" 버튼을 눌러주세요)</h5></div>
                                <div class="date objDiv">작성일</div>
                                <div class="date objDiv"></div>
                                <%--<div class="count">조회</div>--%>
                            </div>
                            <c:forEach var='obj' items="${reviewList}">
                                <div>
                                    <div class="num boardId objDiv">${ obj.reviewId }</div>
                                    <div class="title subject objDiv" style="text-align: center"><textarea id="${obj.reviewId}" onkeydown="resize(this)" onkeyup="resize(this)">${ obj.content }</textarea></div>
                                    <div class="date writeDay objDiv">${ obj.writeDate }</div>
                                    <div class="date writeDay objDiv"></div>
                                    <div class="date writeDay objDiv">
                                        <button class="delete" value="${obj.reviewId}">삭제</button>
                                        &nbsp;
                                        <button class="update" value="${obj.reviewId}">수정</button>
                                    </div>

                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <p></p>
                    <div class="board_title">

                        <strong>나의 게시글</strong>
                        <p><a href="/cs/faq">게시판으로 이동 -></a></p>
                    </div>
                    <div class="board_list_wrap">
                        <div class="board_list">
                            <div class="top">
                                <div class="num">번호</div>
                                <div class="title">제목</div>
                                <div class="date">작성일</div>
                                <%--<div class="count">조회</div>--%>
                            </div>
                            <c:forEach var='obj' items="${csList}">
                                <div>
                                    <div class="num boardId">${ obj.boardId }</div>
                                    <div class="title subject" style="text-align: center"><a href="/cs/view?boardId=${obj.boardId}&userId=${obj.userId}">${ obj.subject}</a></div>
                                    <div class="date writeDay">${ obj.writeDay }</div>
                                        <%--<div class="count readCount">${ obj.readCount }</div>--%>
                                </div>
                            </c:forEach>

                        </div>


                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- Service End -->

