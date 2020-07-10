package cn.yuanfeisy.flash.service.system;

import cn.yuanfeisy.flash.bean.entity.system.Cfg;
import cn.yuanfeisy.flash.cache.ConfigCache;
import cn.yuanfeisy.flash.dao.system.CfgRepository;
import cn.yuanfeisy.flash.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional
public class CfgService  extends BaseService<Cfg,Long,CfgRepository> {
    @Autowired
    private ConfigCache configCache;

    public Cfg saveOrUpdate(Cfg cfg) {
        if(cfg.getId()==null){
            insert(cfg);
        }else{
            update(cfg);
        }
        configCache.cache();
        return cfg;
    }
    @Override
    public void delete(Long id) {
        super.delete(id);
        configCache.cache();
    }

}
