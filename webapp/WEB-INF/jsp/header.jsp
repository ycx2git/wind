<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="main.java.com.wind.pojo.UserInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
   String path = request.getContextPath();
   
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  
  UserInfo userInfo = (UserInfo)request.getAttribute("userInfo");
 
  String name = userInfo.getUsername();
  
%>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/showUser.css"/>
<link href="<%=path %>/js/bootstrap-3.3.5/docs/assets/css/bootstrap.css" rel="stylesheet">
<link href="<%=path %>/js/bootstrap-3.3.5/docs/assets/css/example-fluid-layout.css" rel="stylesheet">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="<%=path %>/js/bootstrap-3.3.5/dist/css/bootstrap.min.css">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="<%=path %>/js/bootstrap-3.3.5/dist/css/bootstrap-theme.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="../js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="<%=path %>/js/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap-table/1.11.0/bootstrap-table.js"></script>
<link href="//cdn.bootcss.com/bootstrap-table/1.11.0/bootstrap-table.min.css" rel="stylesheet">
<script src="//cdn.bootcss.com/bootstrap-table/1.11.0/bootstrap-table.min.js"></script>
<link href="//cdn.bootcss.com/bootstrap-table/1.11.0/bootstrap-table.css" rel="stylesheet">
<script src="//cdn.bootcss.com/bootstrap-table/1.11.0/locale/bootstrap-table-zh-CN.js"></script>
<script src="//cdn.bootcss.com/toastr.js/latest/js/toastr.js"></script>
<link href="//cdn.bootcss.com/toastr.js/latest/css/toastr.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/toastr.js/latest/css/toastr.css" rel="stylesheet">
</head>
<body>
<%-- <div class="container">
   <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" 
         data-target="#example-navbar-collapse">
         <span class="sr-only">切换导航</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><%=name%>的website</a>
   </div>
   <div class="collapse navbar-collapse" id="example-navbar-collapse">
      <ul class="nav navbar-nav">
         <li class="active"><a href="<%=path %>/user/toMain">首页</a></li>
         <li class="active"><a href="<%= path %>/user/showUser">个人主页</a></li>
        <!--  <li><a href="#">时间轴</a></li>
          <li><a href="#">照片墙</a></li> -->
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                             系统管理<b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
               <li><a href="<%= path %>/user/userManager">用户管理</a></li>
               <li><a href="#">菜单管理</a></li>
               <li><a href="#">角色管理</a></li>
            </ul>
         </li>
      </ul>
   </div>
</div> --%>
<div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="nav-collapse">
            <ul class="nav">
              <li class="active"><a href="<%=path %>/user/toMain">首页</a></li>
              <li><a href="<%= path %>/user/userManager">用户管理</a></li>
              <li><a href="<%= path %>/user/showUser">个人主页</a></li>
            </ul>
            <p class="navbar-text pull-right">Logged in as <a href="<%= path%>/user/login">username</a></p>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    <%-- <script src="<%=path %>/js/bootstrap-3.3.5/docs/assets/js/jquery.js"></script> --%>
    <%-- <script src="<%=path %>/js/bootstrap-3.3.5/docs/assets/js/bootstrap-transition.js"></script> --%>
    <script src="<%=path %>/js/bootstrap-3.3.5/docs/assets/js/bootstrap-alert.js"></script>
    <%-- <script src="<%=path %>/js/bootstrap-3.3.5/docs/assets/js/bootstrap-modal.js"></script> --%>
    <script src="<%=path %>/js/bootstrap-3.3.5/docs/assets/js/bootstrap-dropdown.js"></script>
    <script src="<%=path %>/js/bootstrap-3.3.5/docs/assets/js/bootstrap-scrollspy.js"></script>
    <script src="<%=path %>/js/bootstrap-3.3.5/docs/assets/js/bootstrap-tab.js"></script>
    <%-- <script src="<%=path %>/js/bootstrap-3.3.5/docs/assets/js/bootstrap-tooltip.js"></script> --%>
    <script src="<%=path %>/js/bootstrap-3.3.5/docs/assets/js/bootstrap-popover.js"></script>
    <script src="<%=path %>/js/bootstrap-3.3.5/docs/assets/js/bootstrap-button.js"></script>
    <script src="<%=path %>/js/bootstrap-3.3.5/docs/assets/js/bootstrap-collapse.js"></script>
    <script src="<%=path %>/js/bootstrap-3.3.5/docs/assets/js/bootstrap-carousel.js"></script>
    <script src="<%=path %>/js/bootstrap-3.3.5/docs/assets/js/bootstrap-typeahead.js"></script>
</body>
</html>