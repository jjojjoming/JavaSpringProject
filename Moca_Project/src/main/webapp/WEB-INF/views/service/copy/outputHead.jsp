<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="preconnect" href="https://fonts.gstatic.com"> <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
<style>


    /*.copyresult_section{*/
    /*    display: flex;*/
    /*    align-items: center;*/
    /*    justify-content: center;*/
    /*    min-height: 100vh;*/
    /*    background: linear-gradient(#4671EA, #AC34E7);*/
    /*}*/
    /*::selection{*/
    /*    color: #fff;*/
    /*    background: #4671EA;*/
    /*}*/
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
        text-align: center;
    }
    .wrapper textarea{
        display: block;
        margin-left: 30%;
        margin-right: 0px;
        margin-top: 20px;
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
        width: 50%;
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
        background-color: #eeeeee;
        border-color: #333333;
    }

    /*textarea:is(:focus, :valid){*/
    /*    padding: 14px;*/
    /*    border: 2px solid #4671EA;*/
    /*}*/
    textarea::-webkit-scrollbar{
        width: 0px;
    }

</style>

<div class="copyresult_section">
<div class="wrapper">
    <h2>모카가 만든 헤드카피</h2>
    <c:forEach var="obj" items="${headcopyList }">
      <textarea class="output_textarea">${obj.sentence}</textarea>

    </c:forEach>
</div>
</div>

<%--<script>--%>
<%--    autosize(document.querySelectorAll('textarea'));--%>
<%--</script>--%>
