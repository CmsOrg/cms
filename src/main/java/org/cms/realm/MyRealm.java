package org.cms.realm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.cms.dao.BaseDao;
import org.cms.entity.MyException;
import org.cms.entity.User;
import org.cms.service.UserService;

import javax.annotation.Resource;

/**
 * Created by a on 2017/7/18.
 */
public class MyRealm extends AuthorizingRealm {
    @Resource
    private UserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String principal = (String) authenticationToken.getPrincipal();
        String credentials = String.valueOf((char[]) authenticationToken.getCredentials());
        User user = userService.loadByUsername(principal);
        if (user == null) {
            throw new MyException("用户名不存在");
        }if(!user.getPassword().equals(new SimpleHash("md5", credentials,principal).toHex())){
            throw new MyException("用户密码不正确");
        }
        SecurityUtils.getSubject().getSession().setAttribute("user",user);
        SimpleAuthenticationInfo ai = new SimpleAuthenticationInfo(principal, credentials, getName());
        return ai;
    }

}
