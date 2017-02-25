<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userManager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	 var path = '<%=path%>';
	</script>
	<script src="<%=path%>/js/system/userManager.js"></script>
  </head>
  <body>
  <div class="panel-body" style="padding-bottom:0px;">
     <div class="panel panel-default">
         <div class="panel-heading">查询条件</div>
         <div class="panel-body">
         	<form id="formSearch" class="form-horizontal">
         	 	<div class="form-group" style="margin-top:15px;">
         	 		<label class="control-label col-sm-1" for="txt_search_username">用户名称</label>
         	 		<div class="col-sm-3">
         	 			<input type="text" class="form-control" id="txt_search_username">
         	 		</div>
         	 		<label class="control-lable col-sm-1" for="txt_search_status">状态</label>
         	 		<div class="col-sm-3">
         	 			<input type="text" class="form-control" id="txt_search_departmentname">
         	 		</div>
         	 		<div class="col-sm-3" style="text-align:left;">
         	 			<button type="button" style="margin-left:10px" id="btn_query" class="btn btn-primary">查询</button>
         	 		</div>
         	 	</div>
         	</form>
         </div>     
     </div>
     <div id="toolbar" class="btn-group">
     	<button id="btn_add" type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" title="新增">
     		<span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
     	</button>
     	<button id="btn_edit" type="button" class="btn btn-default" data-toggle="modal" data-target="#editModal" title="修改">
     		<span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>修改
     	</button>
     	<button id="btn_delete" type="button" class="btn btn-default" data-toggle="tooltip" onclick="doDelete()" title="删除">
     		<span class="glyphicon glyphicon-remove" aria-hidden="true"  ></span>删除
     	</button>
     </div>
     <table id="tb_userinfos"></table>
  </div>
  <!-- 新增弹出框 -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" 	aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog" >
  		<div class="modal-content">
  			<div class="modal-header">
  				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
  				<span aria-hidden="true">x</span>
  				</button>
  				<h4 class="modal-title" id="myModalLabel">新增</h4>
  			</div>
  			<div class="modal-body">
  				<div class="form-group">
  					<label for="txt_username">用户名</label>
  					<input type="text" name="txt_username" class="form-control" id="txt_username" placeholder="用户名">
  					<label for="txt_password">密码</label>
  					<input type="text" name="txt_password" class="form-control" id="txt_password" placeholder="密码">
  				</div>
  			</div>
  			<div class="modal-footer">
  				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
  				<button type="button" id="btn_submit" class="btn btn-primary" onclick="doSubmit()">保存</button>
  			</div>
  		</div>
  	</div>
  </div>
   <!-- 编辑弹出框 -->
  <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
  	<div class="modal-dialog" >
  		<div class="modal-content">
  			<div class="modal-header">
  				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
  				<span aria-hidden="true">x</span>
  				</button>
  				<h4 class="modal-title" id="editModalLabel">编辑</h4>
  			</div>
  			<div class="modal-body">
  				<div class="form-group">
  					<label for="edit_username">用户名</label>
  					<input type="text" name="edit_username" class="form-control" id="edit_username" placeholder="用户名">
  					<label for="edit_password">密码</label>
  					<input type="text" name="edit_password" class="form-control" id="edit_password" placeholder="密码">
  				</div>
  			</div>
  			<div class="modal-footer">
  				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
  				<button type="button" id="btn_submit" class="btn btn-primary" onclick="doEditSubmit()">保存</button>
  			</div>
  		</div>
  	</div>
  </div>
  <!-- 提示框 -->
  <div id="ycf-alert" class="modal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h5 class="modal-title"><i class="fa fa-exclamation-circle"></i> [Title]</h5>
					</div>
					<div class="modal-body small">
						<p>[Message]</p>
					</div>
					<div class="modal-footer" >
						<button type="button" class="btn btn-primary ok" data-dismiss="modal">[BtnOk]</button>
						<button type="button" class="btn btn-default cancel" data-dismiss="modal">[BtnCancel]</button>
					</div>
				</div>
			</div>
		</div>
  </body>
</html>
