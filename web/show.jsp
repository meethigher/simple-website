<%--
  Created by IntelliJ IDEA.
  User: kitchen
  Date: 2020/6/14
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>结果</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<%--导航栏--%>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-6" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">陈传诚的增删改查</a>
            </div>
        </div>
    </div>
</nav>
<%--大型版心--%>
<div class="jumbotron">
    <div class="container">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">查询结果</div>

            <!-- Table -->
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <th>订单编号</th>
                    <th>订单客户</th>
                    <th>售价</th>
                    <td>付款方式</td>
                </tr>
                <c:forEach var="item" items="${sessionScope.orderList }">
                    <tr>
                        <td><c:out value="${item.id }"></c:out></td>
                        <td><c:out value="${item.name }"></c:out></td>
                        <td><c:out value="${item.saleprice }"></c:out></td>
                        <td><c:out value="${item.delivery==0?\"在线支付\":\"货到付款\" }"></c:out></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/gh/meethigher/cdn@12/js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
