<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
    .position-relative {
        display: none;
    }

    .container-fluid {
        display: none;
    }
</style>
<script>
    swal('로그인이 필요한 서비스입니다.', '', 'info').then(function(){
        location.href = "/login";
    })
    // alert('로그인이 필요한 서비스입니다.')
    // location.href = "/login"
</script>
