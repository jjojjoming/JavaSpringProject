<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    .wrapper{
        width: 1000px;
        background: #fff;
        border-radius: 5px;
        padding: 25px 25px 30px;
        box-shadow: 8px 8px 10px rgba(0,0,0,0.06);
    }
    .wrapper h2{
        color: #f70e23;
        font-size: 28px;
        text-align: left;
    }
    .wrapper input{
        display: inline;
        background-color: white;
        color: #666666;
        padding: 15px;
        border-radius: 5px;
        border: 2px solid transparent;
        outline: #0a539c;
        font-family: 'Noto Sans KR', sans-serif;
        font-weight: 500;
        font-size: 16px;
        line-height: 1.4;
        width: 80%;
        height: 59px;
        max-height: 330px;
        resize: none;
        transition: all 0.2s;
    }

    .output_textarea:hover{
        cursor:pointer;
        background-color: #eeeeee;
    }

    .output_textarea:focus{
        cursor:text;
        color: black;
        background-color: #ffe5fa;
        border-color: #f1306c;
    }

    .like{
        color: #00000030;
        font-size: 2em;
    }

    .heart .fa-heart{
        color: #f44336;
    }

    .heart{
        animation: heart 0.5s linear;
    }

    .love_btn i:hover{
        cursor: pointer;
    }

    /*input:focus {outline:2px solid #d50000;}*/

</style>

<div class="container-xxl py-5">
    <div class="GeneralLayout_content__3FS7b">
        <div class="Catalog__containers">
            <div class="Catalog__wrapper">
                <jsp:include page="/WEB-INF/layout/sidebar.jsp">
                    <jsp:param name="pageName" value="sidebar"/>
                </jsp:include>


                <div class="wrapper">
                    <h2>유튜브에서 제목 카피 트랜드 둘러보기</h2>
                    <br>
                    <c:forEach var="obj" items="${ youtube }" varStatus="status">
                        <div class="output_head">
                            <input id="${status.index}" class="output_textarea" value="${obj}" />
                            <button class="like" value="${status.index}">
                                <i class="fas fa-heart" aria-hidden="true"></i>
                            </button>
                        </div>
                    </c:forEach>
                </div>

            </div>
        </div>
    </div>
</div>

<%--<script>--%>

<%--    $(function () {--%>

<%--        let choiceSentence1 = document.getElementById('choice_sentence1');--%>


<%--        choiceSentence1.addEventListener('click', function () {--%>

<%--            choiceSentence1.style.border = "solid 1px #899acd";--%>

<%--        });--%>

<%--        choiceSentence1.addEventListener('focusout', function () {--%>

<%--            choiceSentence1.style.background = "none";--%>

<%--        });--%>
<%--    });--%>



<%--</script>--%>

<script src="/resources/js/notice.js"/></script>
<script>
    $.ajaxSetup({
        contentType : 'application/x-www-form-urlencoded; charset=utf-8', //한글깨짐 방지
        success:function(result){
            alert(result);
        },
        error:function(jqXHR){
            alert("jqXHR status code:"+jqXHR.status+" message:"+jqXHR.responseText);
        }
    }); //$.ajaxSetup

    $(document).ready(function (){
      $("#youtube").addClass("selected");

        $('.like').click(function (){
          $(this).toggleClass("heart");
          var indexId = '#' + $(this).val()
          $.ajax({
            url:"/service/copy/naver/like",
            type:"post",
            data:{"sentence":$(indexId).val().toString(), "type_id":10, "user_id":${user.id}}
          });
        });
    })
</script>



