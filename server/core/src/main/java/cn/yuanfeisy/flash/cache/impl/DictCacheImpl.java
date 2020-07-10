package cn.yuanfeisy.flash.cache.impl;

import cn.yuanfeisy.flash.bean.constant.cache.CacheKey;
import cn.yuanfeisy.flash.bean.entity.system.Dict;
import cn.yuanfeisy.flash.cache.CacheDao;
import cn.yuanfeisy.flash.cache.DictCache;
import cn.yuanfeisy.flash.dao.system.DictRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;


@Component
public class DictCacheImpl implements DictCache {
    @Autowired
    private DictRepository dictRepository;
    @Autowired
    private CacheDao cacheDao;

    @Override
    public List<Dict> getDictsByPname(String dictName) {
        return (List<Dict>) cacheDao.hget(EhcacheDao.CONSTANT,CacheKey.DICT+dictName,List.class);
    }

    @Override
    public String getDict(Long dictId) {
        return (String) get(CacheKey.DICT_NAME+String.valueOf(dictId));
    }

    @Override
    public void cache() {
    List<Dict> list = dictRepository.findByPid(0L);
    for(Dict dict:list){
        List<Dict> children  = dictRepository.findByPid(dict.getId());
        if(children.isEmpty()) {
           continue;
        }
        set(String.valueOf(dict.getId()), children);
        set(dict.getName(), children);
        for(Dict child:children){
            set(CacheKey.DICT_NAME+String.valueOf(child.getId()),child.getName());
        }

    }

    }

    @Override
    public Object get(String key) {
        return cacheDao.hget(EhcacheDao.CONSTANT,CacheKey.DICT+key);
    }

    @Override
    public void set(String key, Object val) {
        cacheDao.hset(EhcacheDao.CONSTANT,CacheKey.DICT+key,val);

    }
}
