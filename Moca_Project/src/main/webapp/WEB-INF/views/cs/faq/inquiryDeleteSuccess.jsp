<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    /*허더, 푸터, 카카오아이콘, 위로가기 아이콘 디스플레이 죽이기*/
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
</style>
<script>
    swal('문의하신 내용이 삭제되었습니다.', '', 'success').then(function(){
        location.href = "/cs/faq";
    })

</script>
