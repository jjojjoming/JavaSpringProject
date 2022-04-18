<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Below  Url In src="" is Of Font Awesome Kit Create your own Kit and Use that Url below  Or also you can use Link of font Awesome Cdn if you don't want to create a kit and use older version of Font Awesome Icons     -->
<script src="https://kit.fontawesome.com/f6dcf461c1.js" crossorigin="anonymous"></script>

<script>
    const textarea = document.querySelector("textarea");
    textarea.addEventListener("keyup", e =>{
        textarea.style.height = "63px";
        let scHeight = e.target.scrollHeight;
        textarea.style.height = `${scHeight}px`;
    });

    $(window).on("load",function(){
        $(".loader-wrapper").fadeOut("slow")
    });


    function replaceQueryParam(param, newval, search) {
        let regex = new RegExp("([?;&])" + param + "[^&;]*[;&]?");
        let query = search.replace(regex, "$1").replace(/&$/, '');

        return (query.length > 2 ? query + "&" : "?") + (newval ? param + "=" + newval : '');
    }

    function goPage(page) {
        location.href = location.pathname + replaceQueryParam("page", page, window.location.search);
    }

    // function resize(obj) {
    //     obj.style.height = '1px';
    //     obj.style.height = (12 + obj.scrollHeight) + 'px';
    // }
    //  irst Like Button
    var btnvar${obj.headcopyid} = document.getElementById('love_btnh${obj.headcopyid}');

    function Toggle1(){
        if (btnvar${obj.headcopyid}.style.color =="red") {
            btnvar${obj.headcopyid}.style.color = "grey"
        }
        else{
            btnvar${obj.headcopyid}.style.color = "red"
        }
    }

</script>

<style>
    .wrapper{
        width: 1000px;
        height: auto;
        background: #fff;
        border-radius: 5px;
        padding: 25px 25px 30px;
        box-shadow: 8px 8px 10px rgba(0,0,0,0.06);
    }
    .wrapper h2{
        color: #8914fc;
        font-size: 28px;
        text-align: center;
    }
    .wrapper h4{
        color: #a058f4;
        text-align: center;
    }

    .output_head{
        margin-left: 30%;
        margin-right: 0;
        margin-top: 20px;

    }

    .wrapper textarea{
        display: inline;
        background-color: white;
        color: #666666;
        padding: 15px;
        border-radius: 5px;
        border: 2px solid transparent;
        outline: #0a539c;
        /*font-family: 'Noto Sans KR', sans-serif;*/
        font-weight: 500;
        font-size: 16px;
        line-height: 1.4;
        width: 70%;
        height: 130px;
        max-height: 330px;
        resize: none;
        transition: all 0.2s;
    }

    .output_textarea:hover{
        cursor:pointer;
        background-color: #EDB4FF;
    }

    .output_textarea:focus{
        cursor:text;
        color: black;
        background-color: #EDB4FF;
        border-color: #333333;
    }

    /*textarea:is(:focus, :valid){*/
    /*    padding: 14px;*/
    /*    border: 2px solid #4671EA;*/
    /*}*/
    textarea::-webkit-scrollbar{
        width: 0px;
    }

    .love_btns{
        height: 59px;
        display: inline;
        vertical-align: middle;
    }

    .love_btn{
        display: inline;
        background: transparent;
        border: none;
        font-size: 20px;
        outline: none;
        color: grey;
    }

    .love_btn i:hover{
        cursor: pointer;
    }

    /*loader css*/

    .loader{
        width: 300px;
        height: 300px;
        line-height: 300px;
        text-align: center;
        position: absolute;
        left: 50%;
        top: 10%;
        margin: 100px 0 0 -100px;
        font-size: 20px;
        color: #000000;
        perspective: 300px;
    }

    .load_anim1, .load_anim2{
        position: absolute;
        width: 300px;
        height: 300px;
        border-radius: 50%;
        border: 5px solid;
        border-left-color: #B200F4;
        border-top-color: #FF00B3;
        border-right-color-color: #FFC643;
        border-bottom-color: #FF874B;
        left: 50%;
        top: 40%;
        margin: -100px 0 0 -100px;
        animation: loadAnim 3s;
        animation-iteration-count: infinite;
    }

    .load_anim2{
        animation: loadAnim2 3s;
        animation-iteration-count: infinite;
    }

    @keyframes loadAnim {
        0%{transform: rotate3d(1,1,1,0deg);}
        100%{transform: rotate3d(1,1,1,360deg);}
    }

    @keyframes loadAnim2 {
        0%{transform: rotate3d(1,1,1,0deg);}
        100%{transform: rotate3d(1,1,1,-360deg);}
    }

    .like{
        color: #00000030;
        font-size: 2em;
    }

    .heart i.fa-heart{
        color: #f44336;
    }

    .heart{
        animation: heart 0.5s linear;
    }

    @keyframes heart {
        0%{
            transform: rotate(0deg) scale(1.7);
        }
        40%{
            transform: rotate(0deg) scale(1);
        }
        41%{
            transform: rotate(360deg) scale(1);
        }
        100%{
            transform: rotate(0deg) scale(1);
        }
    }

    .copy_button{
        height: 45px;
        margin: 35px 0;
        text-align: center;
    }
    .copy_button input{
        height: 100%;
        width: 30%;
        border-radius: 5px;
        border: none;
        color: #fff;
        font-size: 18px;
        font-weight: 500;
        letter-spacing: 1px;
        cursor: pointer;
        transition: all 0.3s ease;
        background: linear-gradient(294deg, #8400ff, #a25df4);
        text-align: center;
    }
    .copy_button input:hover{
        /* transform: scale(0.99); */
        background: linear-gradient(-294deg, #8400ff, #a25df4);
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
                    <h2>모카가 만들어 봤어요!</h2>
                    <h4>클릭하고 직접 수정해서 사용해보세요!</h4>

<%--                    <c:forEach var="combined_copy" items="${combined_copies }">
                        <div class="output_head">
                        <textarea class="output_textarea" onkeydown="resize(this)" onkeyup="resize(this)">${combined_copy}</textarea>
                        <div class="love_btns">
                        <Button onclick="Toggle1()" id="love_btnh" class="love_btn"><i class="fas fa-heart"></i></Button>
                        </div>
                        </div>
                    </c:forEach>--%>

                    <div class="output_head">
                        <textarea class="output_textarea" onkeydown="resize(this)" onkeyup="resize(this)" id="choice_sentence1">${combined_copies[0]}</textarea>
                        <button class="like" id="fun1">
                            <i class="fas fa-heart" aria-hidden="true"></i>
                        </button>
                    </div>

                    <div class="output_head">
                        <textarea class="output_textarea" onkeydown="resize(this)" onkeyup="resize(this)" id="choice_sentence2">${combined_copies[1]}</textarea>
                        <button class="like" id="fun2">
                            <i class="fas fa-heart" aria-hidden="true"></i>
                        </button>
                    </div>

                    <div class="output_head">
                        <textarea class="output_textarea" onkeydown="resize(this)" onkeyup="resize(this)" id="choice_sentence3">${combined_copies[2]}</textarea>
                        <button class="like" id="fun3">
                            <i class="fas fa-heart" aria-hidden="true"></i>
                        </button>
                    </div>


                    <div class="copy_button">
                        <input type="button" value="결과 더보기" onClick="location.href='/service/copy/payment'"/>
                </div>
                </div>

            </div>
        </div>
    </div>
</div>


<script>

    $(document).ready(function (){
        $("#sales").addClass("selected");

        $(".like").click(function (){
            $(this).toggleClass("heart");
        });

        $.ajaxSetup({
            contentType : 'application/x-www-form-urlencoded; charset=utf-8', //한글깨짐 방지
            success:function(result){
                alert(result);
            },
            error:function(jqXHR){
                /* jqXHR : xml http Request */
                alert("jqXHR status code:"+jqXHR.status+" message:"+jqXHR.responseText);
            }
        }); //$.ajaxSetup


        $("#fun1").click(function (){
            //RestFul : Post
            $.ajax({
                type:"post",
                url:"/service/copy/like?sentence="+$("#choice_sentence1").val()+"&type_id=8&user_id="+${user.id}
            }).done(function(){ //.done : success와 동일
                /*alert($("#choice_sentence1").val()+"\n 저장 완료");*/
            }); //.ajax
        });

        $("#fun2").click(function (){
            //RestFul : Post
            $.ajax({
                type:"post",
                url:"/service/copy/like?sentence="+$("#choice_sentence2").val()+"&type_id=8&user_id="+${user.id}
            }).done(function(){ //.done : success와 동일
                /*alert($("#choice_sentence2").val()+"\n 저장 완료");*/
            }); //.ajax
        });

        $("#fun3").click(function (){
            //RestFul : Post
            $.ajax({
                type:"post",
                url:"/service/copy/like?sentence="+$("#choice_sentence3").val()+"&type_id=8&user_id="+${user.id}
            }).done(function(){ //.done : success와 동일
                /*alert($("#choice_sentence3").val()+"\n 저장 완료");*/
            }); //.ajax
        });
    });
</script>


<script src="/resources/js/notice.js"/></script>
