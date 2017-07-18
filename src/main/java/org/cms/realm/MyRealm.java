package org.cms.realm;

import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.cms.dao.BaseDao;
import org.cms.entity.User;
import org.cms.service.UserService;

/**
 * Created by a on 2017/7/18.
 */
public class MyRealm extends AuthorizingRealm {
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
            throw new UnknownAccountException();
        }
        if (!user.getPassword().equals(credentials)) {
            throw new IncorrectCredentialsException();
        }
        SimpleAuthenticationInfo ai = new SimpleAuthenticationInfo(principal, credentials, getName());
        ai.setCredentialsSalt(ByteSource.Util.bytes(principal)); //盐是用户名+随机数
        return ai;
    }
}
