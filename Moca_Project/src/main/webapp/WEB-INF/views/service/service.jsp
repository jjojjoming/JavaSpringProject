<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="container-xxl py-5">
    <div class="GeneralLayout_content__3FS7b">
        <div class="Catalog__containers">
            <div class="Catalog__wrapper">
                <jsp:include page="/WEB-INF/layout/sidebar.jsp">
                    <jsp:param name="pageName" value="sidebar"/>
                </jsp:include>
                <jsp:include page="/WEB-INF/views/service/copy/viewall.jsp">
                    <jsp:param name="pageName" value="sidebar"/>
                </jsp:include>

            </div>
        </div>
    </div>
</div>