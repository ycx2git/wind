package main.java.com.wind.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import main.java.com.wind.dao.UserDao;
import main.java.com.wind.pojo.UserInfo;
import main.java.com.wind.service.UserService;

import org.springframework.stereotype.Service;


@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;

	public void addUserInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		try {
			this.userDao.addUserInfo(userInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public UserInfo queryUser(String username) throws Exception {
		// TODO Auto-generated method stub
		return this.userDao.queryUser(username);
	}


	public List<Map<String, Object>> getUserList() throws Exception {
		// TODO Auto-generated method stub
		return this.userDao.getUserList();
	}


	public void deleteUser(UserInfo userInfo) throws Exception {
		// TODO Auto-generated method stub
		this.userDao.deleteUser(userInfo);
	}

	
	

}
