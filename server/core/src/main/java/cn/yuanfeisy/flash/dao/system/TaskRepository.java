
package cn.yuanfeisy.flash.dao.system;


import cn.yuanfeisy.flash.bean.entity.system.Task;
import cn.yuanfeisy.flash.dao.BaseRepository;

import java.util.List;

public interface TaskRepository extends BaseRepository<Task,Long> {

    long countByNameLike(String name);

    List<Task> findByNameLike(String name);
    List<Task> findAllByDisabled(boolean disable);
}
