<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://kit.fontawesome.com/f6dcf461c1.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
    button {
        position: center;
        border: .12rem solid #8400ff;
        border-radius: 5px;
        padding: 0.4rem 1.5rem 0.4rem;
        font-size: 1.5rem;
        color: #8400ff;
        white-space: nowrap;
        -webkit-transition: .2s ease-in;
        transition: .2s ease-in

    }
    button:hover {
        background-color: #8400ff;
        color: #fff
    }
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
    .naver h2{
        color: #19ce60;
    }
    .youtube h2{
        color: #f70e23;
    }


    /*.output_head{*/
    /*    margin-left: 30%;*/
    /*    margin-right: 0;*/
    /*    margin-top: 20px;*/

    /*}*/

    .wrapper textarea{
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
</style>
<!-- Service Start -->
<div class="container-xxl py-5">
    <div class="GeneralLayout_content__3FS7b">
        <div class="Catalog__containers">
            <div class="Catalog__wrapper">
                <jsp:include page="/WEB-INF/views/user/mypage/my_sidebar_mycopy.jsp">
                    <jsp:param name="pageName" value="sidebar"/>
                </jsp:include>
                <div class="UserAccountContainerTemplate__content">
                    <div class="wrapper">
                        <h2>HeadCopy</h2>
                        <c:forEach var="obj" items="${ headHistory }">
                            <div class="output_head">
                                <textarea id="${obj.historyId}" class="output_textarea" onkeydown="resize(this)" onkeyup="resize(this)">${obj.sentence}</textarea>
                                <button class="delete" value="${obj.historyId}">삭제</button>
                                &nbsp;
                                <button class="update" value="${obj.historyId}">수정</button>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="wrapper">
                        <h2>SalesCopy</h2>
                        <c:forEach var="obj" items="${ salesHistory }">
                            <div class="output_head">
                                <textarea id="${obj.historyId}" class="output_textarea" onkeydown="resize(this)" onkeyup="resize(this)">${obj.sentence}</textarea>
                                <button class="delete" value="${obj.historyId}">삭제</button>
                                &nbsp;
                                <button class="update" value="${obj.historyId}">수정</button>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="wrapper naver">
                        <h2>NaverCopy</h2>
                        <c:forEach var="obj" items="${ naverHistory }">
                            <div class="output_head">
                                <textarea id="${obj.historyId}" class="output_textarea" onkeydown="resize(this)" onkeyup="resize(this)">${obj.sentence}</textarea>
                                <button class="delete" value="${obj.historyId}">삭제</button>
                                &nbsp;
                                <button class="update" value="${obj.historyId}">수정</button>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="wrapper youtube">
                        <h2>YoutubeCopy</h2>
                        <c:forEach var="obj" items="${ youtubeHistory }">
                            <div class="output_head">
                                <textarea id="${obj.historyId}" class="output_textarea" onkeydown="resize(this)" onkeyup="resize(this)">${obj.sentence}</textarea>
                                <button class="delete" value="${obj.historyId}">삭제</button>
                                &nbsp;
                                <button class="update" value="${obj.historyId}">수정</button>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->

<script>
    $(document).ready(function (){
        $.ajaxSetup({
            contentType : 'application/x-www-form-urlencoded; charset=utf-8', //한글깨짐 방지
            success:function(result){
                location.href = "/user/mycopy";
            },
            error:function(jqXHR){
                alert("일시적인 오류입니다.")
                location.href = "/user/mycopy";
            }
        }); //$.ajaxSetup

        $('.delete').click(function (){
            $.ajax({
                type:"post",
                url:"/user/mycopy/trans?historyId=" + $(this).val(),
                data:{"historyId":$(this).val()}

            });
            alert("삭제 완료")
        });

        $('.update').click(function (){
            var historyId = '#' + $(this).val()
            $.ajax({
                type:"post",
                url:"/user/mycopy/trans",
                data:{"sentence":$(historyId).val().toString(), "historyId":$(this).val()}
            });
            alert("수정 완료")
        });
    });

</script>
