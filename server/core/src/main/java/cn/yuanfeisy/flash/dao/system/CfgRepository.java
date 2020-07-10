
package cn.yuanfeisy.flash.dao.system;

import cn.yuanfeisy.flash.bean.entity.system.Cfg;
import cn.yuanfeisy.flash.dao.BaseRepository;

public interface CfgRepository extends BaseRepository<Cfg,Long> {

    Cfg findByCfgName(String cfgName);
}
