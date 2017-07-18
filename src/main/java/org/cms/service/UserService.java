package org.cms.service;

import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.cms.dao.BaseDao;
import org.cms.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

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


}
