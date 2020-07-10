package cn.yuanfeisy.flash.dao.system;


import cn.yuanfeisy.flash.bean.entity.system.OperationLog;
import cn.yuanfeisy.flash.dao.BaseRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;


public interface OperationLogRepository extends BaseRepository<OperationLog,Long> {
    @Modifying
    @Transactional
    @Query(nativeQuery = true,value = "delete from t_sys_operation_log")
    int clear();
}
