package cn.yuanfeisy.flash.service.task;


import cn.yuanfeisy.flash.bean.entity.system.TaskLog;
import cn.yuanfeisy.flash.dao.system.TaskLogRepository;
import cn.yuanfeisy.flash.service.BaseService;
import org.springframework.stereotype.Service;


@Service
public class TaskLogService extends BaseService<TaskLog,Long,TaskLogRepository> {
}
