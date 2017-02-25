package main.java.com.wind.dao;

import java.util.List;
import java.util.Map;

import main.java.com.wind.pojo.UserInfo;



public interface UserDao {

	//根据用户名查询到用户信息
	public UserInfo queryUser(String username) throws Exception;
    //插入登录信息
	public void addUserInfo(UserInfo userInfo) throws Exception;
	//获取到所有的用户列表
	public List<Map<String,Object>> getUserList() throws Exception; 
	//根据用户名删除用户
	public void deleteUser(UserInfo userInfo) throws Exception;
}
