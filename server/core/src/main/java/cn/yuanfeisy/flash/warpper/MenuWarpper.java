package cn.yuanfeisy.flash.warpper;

import cn.yuanfeisy.flash.bean.vo.node.IsMenu;
import cn.yuanfeisy.flash.service.system.impl.ConstantFactory;

import java.util.List;
import java.util.Map;


public class MenuWarpper extends BaseControllerWarpper {

    public MenuWarpper(List<Map<String, Object>> list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
        map.put("statusName", ConstantFactory.me().getMenuStatusName((Integer) map.get("status")));
        map.put("isMenuName", IsMenu.valueOf((Integer) map.get("ismenu")));
    }

}
