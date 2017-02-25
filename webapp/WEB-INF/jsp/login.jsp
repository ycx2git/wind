<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>this is login jsp</title>
<%
String path = request.getContextPath();
%>
<%@include file="../jsp/public.jsp" %>
</head>
<script type="text/javascript" src="../js/system/login.js" ></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript">
var path = '<%=path%>';
</script>
<style type="text/css">
.login-form {
max-width:330px;
padding:15px;
margin:0 auto;
}
input{
margin-bottom:3px;
}
</style>
<body>
<div style="padding:100px 100px 10px">
<form class="login-form" role="form">
<div class="input-group">
   <span class="input-group-addon">用户名</span>
   <input type="text" class="form-control" id="userName" value="ycx">
</div>
<br>
<div class="input-group">
   <span class="input-group-addon">密码&nbsp&nbsp&nbsp&nbsp</span>
   <input type="password" class="form-control" id="password" value="123">
</div>
<br>
<div>
<button class="btn btn-lg btn-primary btn-block" data-loading-text="Loading..." type="button" onclick="login()">登录</button>
</div>
</form>
</div>
<!-- <table>
<tr>
<td>用户名:<input type="text" id="userName"/></td>
</tr>
<tr>
<td>密码:<input type="password" id="password"/></td>
</tr>
<tr>
<td><input  type="button" id="loginBut" value="登录" onclick="login()"/></td>
</tr>
</table> -->
</body>
</html>