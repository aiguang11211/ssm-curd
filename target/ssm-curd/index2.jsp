<%--
  Created by IntelliJ IDEA.
  User: 拉布拉多搭
  Date: 2019/8/20
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>污水信息查询系统</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script src="${APP_PATH }/static/js/jquery-3.3.1.min.js"></script>
    <link href="${APP_PATH }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${APP_PATH }/static/css/signin.css" rel="stylesheet">
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH }/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<%--    <div class="container ">--%>
<%--        <div class="row">--%>
<%--            <div class="col-lg-offset-4 col-lg-4">--%>
<%--                <h1>污水信息查询系统</h1>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <br/>--%>
<%--        <br/>--%>
<%--        <br/>--%>
<%--        <br/>--%>
<%--        <div class="container col-lg-offset-4 col-lg-4 panel panel-default">--%>

<%--        <form  >--%>
<%--            <br/>--%>
<%--            <div class="form-group " id="login_name">--%>

<%--                    <label for="name">用户名</label>--%>
<%--                    <input type="text" class="form-control" name="name" id="name" placeholder="用户名">--%>
<%--                <span id="helpBlock1" class="help-block" ></span>--%>
<%--            </div>--%>
<%--            <div class="form-group" id="login_pwd">--%>
<%--                <label for="pwd">密码</label>--%>
<%--                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="密码">--%>
<%--                <span id="helpBlock2" class="help-block" ></span>--%>
<%--            </div>--%>

<%--        </form>--%>
<%--            <button type="button" class="btn btn-default"  onclick="login()">登录</button>--%>
<%--            <br/><br/>--%>
            <div class="container">

                <form class="form-signin">
                    <h2 class="form-signin-heading">污水信息查询系统</h2>
                    <div class="form-group " id="login_name">
                    <label for="name" class="sr-only">Email address</label>
                    <input type="text" id="name" name="name" class="form-control" placeholder="用户名" required autofocus>
                    <span id="helpBlock1" class="help-block" ></span>
                    </div>
                    <div class="form-group" id="login_pwd">
                    <label for="pwd" class="sr-only">Password</label>
                    <input type="password" id="pwd" name="pwd" class="form-control" placeholder="密码" required>
                    <span id="helpBlock2" class="help-block" ></span>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="remember-me"> Remember me
                        </label>
                    </div>

                    <button class="btn btn-lg btn-primary btn-block" type="button" onclick="login()">登录</button>
                </form>

            </div> <!-- /container -->
            <script type="text/javascript">
                function login() {
                    $("#login_name").removeClass("has-error");
                    $("#login_pwd").removeClass("has-error");
                    $("#helpBlock1").text("");
                    $("#helpBlock2").text("");
                    if($("#name").val()==""){
                        $("#login_name").addClass("has-error");
                        $("#helpBlock1").text("用户名不能为空");
                        return false;
                    }
                    if($("#pwd").val()==""){
                        $("#login_pwd").addClass("has-error");
                        $("#helpBlock2").text("密码不能为空");
                        return false;
                    }
                    $.ajax({
                        url:"${APP_PATH}/login",
                        type:"POST",
                        data:{name:$("#name").val(),pwd:$("#pwd").val()},
                        success:function(result) {

                            if(result.code==200){
                                $("#login_pwd").addClass("has-error");
                                $("#helpBlock2").text("登录失败，用户名或密码错误");
                            }else{
                                window.location.href = "${APP_PATH}/selectInfos";
                            }
                        }
                    })
                }
            </script>


<%--        </div>--%>
<%--    </div>--%>
</body>
</html>
