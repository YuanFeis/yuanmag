package cn.yuanfeisy.flash.service.system;

import cn.yuanfeisy.flash.bean.entity.system.OperationLog;
import cn.yuanfeisy.flash.dao.system.OperationLogRepository;
import cn.yuanfeisy.flash.service.BaseService;
import org.springframework.stereotype.Service;


@Service
public class OperationLogService extends BaseService<OperationLog,Long,OperationLogRepository> {

}
