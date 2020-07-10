package cn.yuanfeisy.flash.bean.dictmap;

import cn.yuanfeisy.flash.bean.dictmap.base.AbstractDictMap;


public class NoticeMap extends AbstractDictMap {

    @Override
    public void init() {
        put("title", "标题");
        put("content", "内容");
    }

    @Override
    protected void initBeWrapped() {
    }
}
