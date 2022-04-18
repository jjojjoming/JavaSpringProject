<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Below Url In src="" is Of Font Awesome Kit Create your own Kit and Use that Url below Or also you can use Link of font Awesome Cdn if you don't want to create a kit and use older version of Font Awesome Icons -->
<script src="https://kit.fontawesome.com/f6dcf461c1.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<style>
    .wrapper{
        width: 1000px;
        background: #fff;
        border-radius: 5px;
        padding: 25px 25px 30px;
        box-shadow: 8px 8px 10px rgba(0,0,0,0.06);
    }
    .wrapper h2{
        color: #4671EA;
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
        /*background-color: #EDB4FF;*/
        border-color: #19ce60;
    }
    .wrapper h2 {
        color: #19ce60;
    }

    .wrapper h3 {
        color: #19ce60;
        opacity: 80%;
        margin-top: 10px;
        /*margin-left: 10px;*/
        margin-bottom: 3px;
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

</style>


<div class="container-xxl py-5">
    <div class="GeneralLayout_content__3FS7b">
        <div class="Catalog__containers">
            <div class="Catalog__wrapper">
                <jsp:include page="/WEB-INF/layout/sidebar.jsp">
                    <jsp:param name="pageName" value="sidebar"/>
                </jsp:include>

                <div class="wrapper">
                    <h2>네이버에서 현재 광고 중인 카피 문구를 가져와 봤어요!</h2>
                    <h3>자유롭게 수정해서 사용해보세요!</h3>
                    <c:forEach var="obj" items="${ naverList }" varStatus="status">
                        <div class="output_head">
                            <input id="${status.index}" class="output_textarea" value="${obj.text()}" />
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
  });

  $(document).ready(function (){
    $("#naver").addClass("selected");
    $('.like').click(function (){
      $(this).toggleClass("heart");
      var indexId = '#' + $(this).val()
      $.ajax({
        url:"/service/copy/naver/like",
        type:"post",
        data:{"sentence":$(indexId).val().toString(), "type_id":9, "user_id":${user.id}}
      });
    });
  })
</script>







