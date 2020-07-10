package cn.yuanfeisy.flash.dao.system;


import cn.yuanfeisy.flash.bean.entity.system.User;
import cn.yuanfeisy.flash.dao.BaseRepository;


public interface UserRepository extends BaseRepository<User,Long> {
    User findByAccount(String account);

    User findByAccountAndStatusNot(String account, Integer status);
}
