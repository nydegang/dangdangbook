package com.oraclewdp.ddbookmarket.biz;

import com.oraclewdp.ddbookmarket.model.Admin;

public interface AdminBiz {
    /**
     * 根据用户名和密码查找用户
     * @param admin
     * @return
     */
    boolean findByNameAndPwd(Admin admin);
}
