package main.java.com.wind.service;

import java.util.List;
import java.util.Map;

import main.java.com.wind.pojo.UserInfo;

public interface UserService {

	public UserInfo queryUser(String username) throws Exception;
	//插入登录信息
	public void addUserInfo(UserInfo userInfo);
	public List<Map<String,Object>> getUserList() throws Exception; 
	//根据用户名删除用户
	public void deleteUser(UserInfo userInfo) throws Exception;
}
