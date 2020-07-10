package cn.yuanfeisy.flash.service.system;


import cn.yuanfeisy.flash.bean.entity.system.LoginLog;
import cn.yuanfeisy.flash.dao.system.LoginLogRepository;
import cn.yuanfeisy.flash.service.BaseService;
import org.springframework.stereotype.Service;


@Service
public class LoginLogService extends BaseService<LoginLog,Long,LoginLogRepository> {

}
