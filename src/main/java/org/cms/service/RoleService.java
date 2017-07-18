package org.cms.service;

import org.cms.dao.BaseDao;
import org.cms.entity.Role;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by a on 2017/7/18.
 */
@Service
public class RoleService {

    @Resource
    private BaseDao<Role> roleBaseDao;

    public List<Role> listRolesByUserId(Integer uid) {
        return roleBaseDao.list("select ur.Role from UserRole ur where ur.User.id = ?", uid);
    }


}
