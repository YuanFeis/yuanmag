package cn.yuanfeisy.flash.bean.dictmap;

import cn.yuanfeisy.flash.bean.dictmap.base.AbstractDictMap;


public class TaskDict extends AbstractDictMap {

    @Override
    public void init() {
        put("taskId","任务id");
        put("name","任务名称");
    }

    @Override
    protected void initBeWrapped() {

    }
}
