
function login(){
	
	var userName = document.getElementById("userName").value;
	var password = document.getElementById("password").value;
	
	$.ajax({
		type: "POST",
		url: path+"/user/json",
		data:{userName:userName,password:password},
		dataType :"json",
		success:function(data){
			if(data.success){
				//alert(data.password+data.username);//正常取到返回的数据
				window.location.href=path+"/user/toMain";
				
			}else{
				alert(data.info);	
			}
		},	
		error:function(XMLHttpRequest, textStatus, errorThrown){
			alert(errorThrown);
		}
	});
}
