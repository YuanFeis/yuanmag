package cn.yuanfeisy.flash.bean.dictmap;

import cn.yuanfeisy.flash.bean.dictmap.base.AbstractDictMap;


public class DictMap extends AbstractDictMap {

    @Override
    public void init() {
        put("dictId","字典名称");
        put("dictName","字典名称");
        put("dictValues","字典内容");
    }

    @Override
    protected void initBeWrapped() {

    }
}
