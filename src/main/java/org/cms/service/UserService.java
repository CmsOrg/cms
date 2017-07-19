package org.cms.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.cms.dao.BaseDao;
import org.cms.entity.User;
import org.springframework.stereotype.Service;

/**
 * Created by a on 2017/7/18.
 */

@Service
public class UserService {

	@Resource
	private BaseDao<User> userBaseDao;

	public User loadByUsername(String username) {
		return (User) userBaseDao.queryObject("from User where username = ?", username);
	}

	public User regist(User u) {
		String passwrod = new SimpleHash("md5", u.getPassword(), u.getUsername()).toHex();
		u.setPassword(passwrod);
		u.setCreateDate(new Date());
		return userBaseDao.add(u);
	}

	public List<User> list() {
		return userBaseDao.list("from User");
	}

}
