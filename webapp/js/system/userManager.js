/*function initTable(){
	//先销毁表格
	 $('userTable').bootstrapTable('destory');
	 //初始化表格，动态从服务器加载数据
	 $('userTable').bootstrapTable({
		 method :'post',//使用get请求从服务器加载数据
		 url:path+'/user/getUserInfo',
		 striped:true,//表格显示条纹 
		 pagination:true,//启动分页
		 pageSize:1,//每页显示的记录数
		 pageNumber:1,//当前第几页
		 pageList:[5,10,15,20,25],//记录数可选列表
		 search:false,//是否启用查询
		 showColumns:true,//显示下拉框勾选要显示的列
		 showRefresh:true,//显示刷新按钮
		 sidePagination:"server",//表示服务端请求
		 //设置为undefined可以获取pageNumber,pageSize,searchText,sortName,sortOrder
		 //设置为limit可以获取limit,offset,search,sort,order
		 queryParamsType:'undefined',
		 queryParams:function queryParams(params){
			 var params ={
					 pageNumber:params.pageNumber,
					 pageSize:params.pageSize,
					 orderNum:$('#orderNum').val()
			 };
			 return params;
		 },
		 onLoadSuccess:function(){
			 layer.msg("加载成功");
		 },
		 onLoadError:function(){
			 layer.msg("加载失败",{time:1500,icon:2});
		 }
		 
		 
	 }
			 
	 );
}

$(document).ready(function(){
	initTable();
	$('#search').bind('click',initTable);
});*/

$(function () {

    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();

    //2.初始化Button的点击事件
    var oButtonInit = new ButtonInit();
    oButtonInit.Init();

});


var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_userinfos').bootstrapTable({
            url: path+'/user/getUserInfo',         //请求后台的URL（*）
            dataType:'json',
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 450,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "username",                     //每一行的唯一标识，一般为主键列
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [{
                checkbox: true
            }, {
                field: 'username',
                title: '用户名称'
            },{
            	field:'password',
            	title:'用户密码'
            }
              ]
        });
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.pageSize,   //页面大小
            offset: params.pageNumber,  //页码
            username: $("#txt_search_username").val(),
            status: $("#txt_search_status").val()
        };
        return temp;
    };
    return oTableInit;
};


var ButtonInit = function () {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
    };
    return oInit;
};
function doSubmit(){
	var username = $('#txt_username').val();
	var password = $('#txt_password').val();
	$.ajax({
		type:'post',
		url:path+'/user/doAddUser',
		data:{username:username,password:password},
		success:function(data,status){
			var json = $.parseJSON(data);
			if(json.success){
				$('#myModal').modal('hide');
				$('#tb_userinfos').bootstrapTable('refresh');
			}
		},
		error:function(data,status){
			
		},
		complete:function(){}
	});
}
function doDelete(){
	
	var arraySelection = $('#tb_userinfos').bootstrapTable('getSelections');
	if(arraySelection.length<=0){
		toastr.info('请选择有效数据');
		return;
	};
	Modal.confirm({
		msg:'是否删除?'
	}).on(function(e){
		if(e){
			$.ajax({
				type:'post',
				url:path+'/user/doDeleteUser',
				data:{usernames:JSON.stringify(arraySelection)},
				success:function(data,status){
					var json = $.parseJSON(data);
					if(json.success){
						$('#tb_userinfos').bootstrapTable('refresh');
					}
				},
				error:function(data,status){
					
				},
				complete:function(){
					
				}
				
			});
		}
	});
}

$(function () {
	window.Modal = function () {
		var reg = new RegExp("\\[([^\\[\\]]*?)\\]", 'igm');
		var alr = $("#ycf-alert");
		var ahtml = alr.html();

		//关闭时恢复 modal html 原样，供下次调用时 replace 用
		//var _init = function () {
		//	alr.on("hidden.bs.modal", function (e) {
		//		$(this).html(ahtml);
		//	});
		//}();

		/* html 复原不在 _init() 里面做了，重复调用时会有问题，直接在 _alert/_confirm 里面做 */


		var _alert = function (options) {
			alr.html(ahtml);	// 复原
			alr.find('.ok').removeClass('btn-success').addClass('btn-primary');
			alr.find('.cancel').hide();
			_dialog(options);

			return {
				on: function (callback) {
					if (callback && callback instanceof Function) {
						alr.find('.ok').click(function () { callback(true) });
					}
				}
			};
		};

		var _confirm = function (options) {
			alr.html(ahtml); // 复原
			alr.find('.ok').removeClass('btn-primary').addClass('btn-success');
			alr.find('.cancel').show();
			_dialog(options);

			return {
				on: function (callback) {
					if (callback && callback instanceof Function) {
						alr.find('.ok').click(function () { callback(true) });
						alr.find('.cancel').click(function () { callback(false) });
					}
				}
			};
		};

		var _dialog = function (options) {
			var ops = {
				msg: "提示内容",
				title: "操作提示",
				btnok: "确定",
				btncl: "取消"
			};

			$.extend(ops, options);

			console.log(alr);

			var html = alr.html().replace(reg, function (node, key) {
				return {
					Title: ops.title,
					Message: ops.msg,
					BtnOk: ops.btnok,
					BtnCancel: ops.btncl
				}[key];
			});
			
			alr.html(html);
			alr.modal({
				width: 500,
				backdrop: 'static'
			});
		}

		return {
			alert: _alert,
			confirm: _confirm
		}

	}();
});
//当modal显示后自动填充数据，shown是在css加载完成后调用，show是在css加载完成前调用 
$(function(){
	$('#editModal').on('shown.bs.modal',function(){
		var arry = $('#tb_userinfos').bootstrapTable('getSelections');
		//alert(arry[0]['username']);
		$('#edit_username').val(arry[0]['username']);
		$('#edit_password').val(arry[0]['password']);
	})
});
function doEditSubmit(){
	var username = $('#edit_username').val();
	var password = $('#edit_password').val();
	$.ajax({
		type:'post',
		url:path+'/user/doAddUser',
		data:{username:username,password:password},
		success:function(data,status){
			var json = $.parseJSON(data);
			if(json.success){
				$('#editModal').modal('hide');
				$('#tb_userinfos').bootstrapTable('refresh');
			}
		},
		error:function(data,status){
			
		},
		complete:function(){}
	});
}