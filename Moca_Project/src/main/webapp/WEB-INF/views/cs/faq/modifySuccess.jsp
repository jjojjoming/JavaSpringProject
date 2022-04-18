<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    swal('고객님께서 문의하신 사항이 수정되었습니다.', '', 'success').then(function(){//펑션 추가해서 바로 넘어가지 않게 설정
        location.href = "/cs/faq";
    })

</script>


