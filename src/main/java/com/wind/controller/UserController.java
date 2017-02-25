package main.java.com.wind.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.com.base.BaseController;
import main.java.com.wind.pojo.UserInfo;
import main.java.com.wind.service.UserService;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/user")
public class UserController extends BaseController{

	@Resource
	private UserService userService;
	@RequestMapping("/showUser")
	public String toIndex(HttpServletRequest request,HttpServletResponse response){
		
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo)session.getAttribute("currentUser");//获取到当前登录的用户信息
		request.setAttribute("userInfo", userInfo);//将当前的登录用户信息返回到前台
		System.out.println("正在跳转到个人主页");
		//封装json对象传递到前台
		return "showUser";
	}
	@RequestMapping("/toMain")
	public String toMain(HttpServletRequest request,HttpServletResponse response){
		
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo)session.getAttribute("currentUser");//获取到当前登录的用户信息
		request.setAttribute("userInfo", userInfo);//将当前的登录用户信息返回到前台
		System.out.println("正在跳转到主页");
		//封装json对象传递到前台
		return "main";
	}
	@RequestMapping("/login")
	public String toLogin(HttpServletRequest request,HttpServletResponse response){
		return "login";
	}
	@RequestMapping(value="/json",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> getJson(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String username  = request.getParameter("userName");
		String password = request.getParameter("password");
		//此处需要对前台传递过来的信息进行后台的校验并返回校验的结果,校验通过后将用户名和密码存入session中 
		UserInfo userInfo = new UserInfo();//建立当前登录对象并存入数据库
		userInfo = userService.queryUser(username);
		Map<String,Object> map = new HashMap<String,Object>();//校验通过后直接跳转到首页
		if(userInfo==null){//不存在当前用户
			map.put("failure",Boolean.valueOf(false));
			map.put("info", "该用户不存在");
		}
		else if(!userInfo.getPassword().equals(password)){//用户名和密码不匹配
			map.put("success", Boolean.valueOf(false));
			map.put("info", "用户名和密码不匹配");
		}else{//用户存在并且用户名和密码相匹配
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", userInfo);//将当前用户放入session
			map.put("success",Boolean.valueOf(true));
		}
		return map;
	}
	@RequestMapping(value="/userManager")
	public String toUserManager(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo)session.getAttribute("currentUser");//获取到当前登录的用户信息
		request.setAttribute("userInfo", userInfo);//将当前的登录用户信息返回到前台
		return "userManager";
	}
	@RequestMapping(value="/getUserInfo")
	public void getUserInfo(HttpServletRequest request,HttpServletResponse response) throws Exception{
		List<Map<String,Object>> list  = userService.getUserList();
		doListJsonResponse(list, list.size(), response);
	}
	/**
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/doAddUser")
	public void doAddUser(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserInfo user = new UserInfo();
		user.setPassword(password);
		user.setUsername(username);
		//user.setUuid(1);
		userService.deleteUser(user);//先删除后添加，预防重复值，后期要加校验，用户名不能重复
		userService.addUserInfo(user);
		System.out.println(username);
		doJsonSuccessResponse(response);
	}
	@RequestMapping(value="/doDeleteUser")
	public void doDeleteUser(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String usernames = request.getParameter("usernames");
		List<Map<String,Object>> list = DoJson2String(usernames);
		Map<String,Object> map = new HashMap<String, Object>();
		UserInfo user = new UserInfo();
		for(int i=0;i<list.size();i++){
			map = list.get(i);
			user.setUsername((String)map.get("username"));
			userService.deleteUser(user);
		}
		doJsonSuccessResponse(response);
	}
}
