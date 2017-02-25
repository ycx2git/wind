<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人主页</title>
<%
 // UserInfo userInfo = (UserInfo)request.getAttribute("userInfo");//获取当前登录的用户信息
 
  //String name = userInfo.getUsername();

  String password = userInfo.getPassword();
  
  String sessionId = userInfo.getSessionid();
  
%>
</head>
<body>
<form class="form-horizontal" role="form">	
   <div class="page-header">
    <h1>杨成孝</h1>
    </div>
    <div class="form-group">
      <div>
         <img src="../images/timgsmall.jpg" class ="img-thumbnail">
      </div>
      <label for="name">图片说明</label>
      <textarea rows="3" cols="5" class="form-control">
      </textarea>
      <div id ="myButoon" class="bs-example" align="left">
        <button type="button" class="btn btn_primary" >提交</button>
      </div>
    </div>
</form>


</body>
</html>