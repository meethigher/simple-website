<%--
  Created by IntelliJ IDEA.
  User: kitchen
  Date: 2020/6/14
  Time: 7:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜单</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        #index, #query, #update, #delete, #insert {
            display: none;
        }

        .current {

        }

    </style>
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
                <a class="navbar-brand" href="//meethigher.top/">陈传诚的增删改查</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-6">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#index">首页</a></li>
                    <li><a href="#query">查询</a></li>
                    <li><a href="#insert">增加</a></li>
                    <li><a href="#delete">删除</a></li>
                    <li><a href="#update">修改</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<%--大型版心--%>
<div class="jumbotron">
    <div class="container point">
        <div class="current" id="index"><h1>首页</h1>
            <p>这是陈传诚的作业，采用开源的bootstrap框架搭建的，插入和删除功能采用异步加载数据。奥利给！</p>
            <p><a class="btn btn-primary btn-lg" href="//meethigher.top/" role="button">主页</a></p>
            <h3 id="醒世格言"><a href="#醒世格言" class="headerlink" title="醒世格言"></a>醒世格言</h3>
            <p>如果你觉得你的祖国不好<br>你就去建设它</p>
            <p>如果你觉得政府不好<br>你就去考公务员去做官</p>
            <p>如果你觉得人民没素质<br>就从你开始做一个高素质的公民</p>
            <p>如果你觉得同胞愚昧无知<br>就从你开始学习并改变身边的人</p>
            <p>而不是一昧的谩骂，抱怨，逃离</p>
            <p>横眉冷对千夫指<br>俯首甘为孺子牛</p>
            <p>你所站立的地方<br>正是你的中国</p>
            <p>你怎么样<br>中国便怎么样</p>
            <p>你是什么<br>中国便是什么</p>
            <p>你若光明<br>中国便不黑暗</p>
            <p>愿中国青年都摆脱冷气<br>只是向上走<br>不必听自暴自弃者流的话</p>
            <p>能做事的做事<br>能发声的发声</p>
            <p> ——鲁迅</p></div>
        <div id="query">
            <h1>查询</h1>
            <form class="navbar-form navbar-left" role="search" method="post" action="servlet">
                <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="查询订单，请输入您的姓名">
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
        </div>
        <div id="update">
            <h1>修改</h1>
            <form class="navbar-form navbar-left" role="search" method="post" action="servlet">
                <div class="form-group">
                    <input type="number" class="form-control" name="id" placeholder="修改订单，请输入订单号">
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
        </div>
        <div id="delete"><h1>删除</h1>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="number" id="d-id" class="form-control" placeholder="删除订单，请输入订单号">
                </div>
                <button id="btn-delete" type="button" class="btn btn-default">提交</button>
            </form>
        </div>
        <div id="insert"><h1>增加</h1>
            <form class="navbar-form navbar-left" role="search">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">姓名</span>
                    <input type="text" id="i-name" name="name" class="form-control" placeholder="订单姓名" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon2">价格</span>
                    <input type="number" id="i-salesprice" name="salesprice" class="form-control" placeholder="订单价格" aria-describedby="basic-addon1">
                </div>
                <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-primary active">
                        <input type="radio" name="delivery" id="option1" value="0">在线支付
                    </label>
                    <label class="btn btn-primary">
                        <input type="radio" name="delivery" id="option2" value="1">货到付款
                    </label>
                </div>
                <button id="btn-insert" type="button" class="btn btn-default">提交</button>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/gh/meethigher/cdn@12/js/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/meethigher/cdn@11/js/layer/layer.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    $(function () {
        let $lis = $(".navbar-nav>li");
        let $contentDiv = $(".point>div");
        $(".current").css("display", "block");
        /*点击导航栏的逻辑*/
        $lis.on("click", function () {
            //移除所有的样式，给点击的添加样式
            $lis.each(function (i, e) {
                $(e).removeClass("active");
            });
            $(this).addClass("active");
            //显示指定的内容
            let tag = $(this).children("a").attr("href");
            $contentDiv.each(function (i, e) {
                $(e).css("display", "none");
            });
            $(tag).css("display", "block");
        });
    });

    $(function (){
        function myAjax(url,data){
            let index=layer.load(1);
            let result="";
            $.ajax({
                url:url,
                async:false,
                type:"post",
                data:data,
                success:function (data) {
                    result=data;
                },
                error:function (error){
                    result=error;
                },
                complete:function (){
                    layer.close(index);
                }
            });
            return result;
        }
        //删除按钮
        $("#btn-delete").on("click",function (){
            let id=$("#d-id").val();
            let data="id="+id;
            let result=myAjax("deleteServlet",data);
            if("success"==result){
                layer.msg("删除成功");
            }else{
                layer.msg("删除失败");
            }
        });
        //添加按钮
        $("#btn-insert").on("click",function (){
            let $name=$("#i-name");
            let $salesprice=$("#i-salesprice");
            // let $delivery=$("input[name='radio']:checked");
            let $delivery=$("label[class='btn btn-primary active']");
            let data="name="+$name.val()+"&salesprice="+$salesprice.val()+"&delivery="+$delivery.children("input").val();
            let result=myAjax("insertServlet",data);
            if("success"==result){
                layer.msg("添加成功");
            }else{
                layer.msg("添加失败");
            }
        });

    });
</script>
</body>
</html>
