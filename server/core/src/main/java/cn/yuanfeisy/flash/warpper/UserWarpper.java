package cn.yuanfeisy.flash.warpper;

import cn.yuanfeisy.flash.service.system.impl.ConstantFactory;
import cn.yuanfeisy.flash.utils.StringUtil;

import java.util.List;
import java.util.Map;


public class UserWarpper extends BaseControllerWarpper {

    public UserWarpper(List<Map<String, Object>> list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
        map.put("sexName", ConstantFactory.me().getSexName((Integer) map.get("sex")));
        if(StringUtil.isNotNullOrEmpty(map.get("roleid"))) {
            map.put("roleName", ConstantFactory.me().getRoleName((String) map.get("roleid")));
        }
        if(StringUtil.isNotNullOrEmpty(map.get("deptid"))) {
            map.put("deptName", ConstantFactory.me().getDeptName((Long) map.get("deptid")));
        }
        map.put("statusName", ConstantFactory.me().getStatusName((Integer) map.get("status")));

    }

}
