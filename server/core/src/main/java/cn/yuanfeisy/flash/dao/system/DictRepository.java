
package cn.yuanfeisy.flash.dao.system;


import cn.yuanfeisy.flash.bean.entity.system.Dict;
import cn.yuanfeisy.flash.dao.BaseRepository;

import java.util.List;

public interface DictRepository  extends BaseRepository<Dict,Long> {
    List<Dict> findByPid(Long pid);
    List<Dict> findByNameAndPid(String name,Long pid);

    List<Dict> findByNameLike(String name);
}
