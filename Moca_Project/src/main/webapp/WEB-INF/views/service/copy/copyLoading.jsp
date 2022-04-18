<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
/*    .loading_area{
        position: fixed;
        left:0;
        top: 0;
        right: 0;
        bottom: 0;
        z-index: 1000;
        background: #000000;
    }*/

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


<div class="loading_area">
    <span class="loader">모카가 카피를 생각중이에요.. .</span>
    <span class="load_anim1"></span>
    <span class="load_anim2"></span>
</div>

<%--
<script>
/*    setTimeout(function (){
        location.href="/copy/head/input?brand_name=${inputHeadcopy.brand_name}&brand_description=${inputHeadcopy.brand_description}&brand_category=${inputHeadcopy.brand_category}&brand_main_key=${inputHeadcopy.brand_main_key}&brand_sub_key1=${inputHeadcopy.brand_sub_key1}&brand_sub_key2=${inputHeadcopy.brand_sub_key2}"
    },5000)*/
    /*?brand_name=${inputHeadcopy.brand_name}&brand_description=${inputHeadcopy.brand_description}&brand_category=${inputHeadcopy.brand_category}&brand_main_key=${inputHeadcopy.brand_main_key}&brand_sub_key1=${inputHeadcopy.brand_sub_key1}&brand_sub_key2=${inputHeadcopy.brand_sub_key2}*/
location.href="/copy/head/input"

/*    setTimeout(function (){
        location.href="/copy/head/input?brand_name="+${inputHeadcopy.brand_name}
            +"&brand_description="+${inputHeadcopy.brand_description}+"&brand_main_key="+${}
    },5000)*/

</script>
--%>
