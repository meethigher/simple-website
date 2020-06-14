<%--
  Created by IntelliJ IDEA.
  User: kitchen
  Date: 2020/6/14
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新</title>
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

            <form class="navbar-form navbar-left" role="search" method="post" action="updateServlet">
                <%--                <div class="input-group" style="display:none">--%>
                <%--                    <span class="input-group-addon" id="basic-addon0">订单编号</span>--%>
                <%--                    <input type="text" name="id" class="form-control" placeholder="订单编号" aria-describedby="basic-addon1" value="${sessionScope.order.id}">--%>
                <%--                </div>--%>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">姓名</span>
                    <input type="text" id="i-name" name="name" class="form-control" placeholder="订单姓名"
                           aria-describedby="basic-addon1" value="${sessionScope.order.name}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon2">价格</span>
                    <input type="number" id="i-salesprice" name="salesprice" class="form-control" placeholder="订单价格"
                           aria-describedby="basic-addon1" value="${sessionScope.order.saleprice}">
                </div>
                <div class="btn-group" data-toggle="buttons">
                    <input type="radio" name="delivery" id="option1"
                           value="0" ${sessionScope.order.delivery==0?"checked":""}>在线支付
                    <input type="radio" name="delivery" id="option2"
                           value="1" ${sessionScope.order.delivery==1?"checked":""}>货到付款
                </div>
                <button type="submit" class="btn btn-default">修改</button>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/gh/meethigher/cdn@12/js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
