<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
  #details[open] {
    background-color: #cdedfd;
    background-image: linear-gradient(
      319deg,
      #cdedfd 0%,
      #ffec82 37%,
      #ffcfd3 100%
    );
  }
</style>
<div class="container-xxl py-5">
    <div class="GeneralLayout_content__3FS7b">
        <div class="Catalog__containers">
            <div class="Catalog__wrapper">
                <jsp:include page="/WEB-INF/layout/sidebar.jsp">
                    <jsp:param name="pageName" value="sidebar"/>
                </jsp:include>
                <jsp:include page="/WEB-INF/views/service/copy/copyLoading.jsp">
                    <jsp:param name="pageName" value="sidebar"/>
                </jsp:include>
            </div>
        </div>
    </div>
</div>
<script>
  function replaceQueryParam(param, newval, search) {
    let regex = new RegExp("([?;&])" + param + "[^&;]*[;&]?");
    let query = search.replace(regex, "$1").replace(/&$/, '');

    return (query.length > 2 ? query + "&" : "?") + (newval ? param + "=" + newval : '');
  }

  function goPage(page) {
    location.href = location.pathname + replaceQueryParam("page", page, window.location.search);
  }

  // setTimeout(function (){
  //     location.href="/service/copy/head/input"
  // },5000)

  setTimeout(function (){
      location.href="/service/copy/sales/input?sales_name=${inputSalescopy.sales_name}&sales_description=${inputSalescopy.sales_description}&sales_category=${inputSalescopy.sales_category}&sales_main_key=${inputSalescopy.sales_main_key}&sales_sub_key1=${inputSalescopy.sales_sub_key1}&sales_sub_key2=${inputSalescopy.sales_sub_key2}"
  },1000)

</script>
<script src="/resources/js/notice.js"/></script>

