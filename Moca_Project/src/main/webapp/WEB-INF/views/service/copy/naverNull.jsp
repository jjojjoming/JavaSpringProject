<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .position-relative {
        display: none;
    }

    .container-fluid {
        display: none;
    }
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    swal('유효하지 않는 키워드입니다.', '해당 키워드는 현재 네이버 광고에 사용되지 않고 있습니다.', 'error').then(function(){
        location.href = "/service/copy/naver";
    })

</script>


