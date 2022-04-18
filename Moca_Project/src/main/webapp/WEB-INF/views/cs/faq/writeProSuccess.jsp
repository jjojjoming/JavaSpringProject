<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
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
        swal( '문의하신 내용은 메일로 답변드리겠습니다 ', '소중한 문의글 감사합니다.^^', 'success').then(function(){
            location.href = "/cs/faq";
        })


</script>
