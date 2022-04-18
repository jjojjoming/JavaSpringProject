<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/faq.css">

<style>
    .position-relative {
        display: none;
    }

    .container-fluid {
        display: none;
    }
    #kakao-talk-channel-chat-button {
        display: none;
    }
    .btn-secondary {
        display: none;
    }
    p {
        text-align: right;
    }
    .board_wrap {
        margin: 50px;
    }

    textarea {
        display: block;
        width: 100%;
        height: 300px;
        padding: 15px;
        box-sizing: border-box;
        border: 0;
        resize: vertical;
    }

    textarea {
        display: inline;
        border: 2px solid #000000;
        height: 200px;
        width: 60%;
        text-align: center;
        margin: 30px;

    }

    .top {
        /*height:250px;*/
        /*display: table-cell;*/
        /*vertical-align: middle;*/
        display: flex;
        justify-content: center;

    }

    .UserAccountProfileContainerPassword__footer {
        text-align: center;
        margin: 10px;
        margin-bottom: 10px;
    }

    .board_list {
        text-align: center;
    }
</style>

<script>
    function closeWin(){
        if(!$('#content').val()) {
            alert("값을 입력해 주세요.")
            return;
        }
        opener.window.location = "/user/review/write?content=" + $('#content').val();
        close();



    }
    function cancelClose(){
        opener.window.location = "/user/review"
        close();

    }


</script>

<div class="board_list_wrap">
    <div class="board_list">
        <div class="top">
            <div class="objDiv">소중한 리뷰 감사합니다!</div>
        </div>
        <textarea id="content"></textarea>
    </div>
    <div class="UserAccountProfileContainerPassword__footer">
        <button onclick="javascript:closeWin()" class="UserAccountProfileContainerPassword__button">
            <span>완료</span>
        </button>
        <button onclick="javascript:cancelClose()" class="UserAccountProfileContainerPassword__button">
            <span>취소</span>
        </button>
    </div>
    <div>&nbsp;</div>

</div>
