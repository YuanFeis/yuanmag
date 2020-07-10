package cn.yuanfeisy.flash.api.controller.system;

import cn.yuanfeisy.flash.api.controller.BaseController;
import cn.yuanfeisy.flash.bean.constant.factory.PageFactory;
import cn.yuanfeisy.flash.bean.entity.system.LoginLog;
import cn.yuanfeisy.flash.bean.enumeration.Permission;
import cn.yuanfeisy.flash.bean.vo.front.Rets;
import cn.yuanfeisy.flash.bean.vo.query.SearchFilter;
import cn.yuanfeisy.flash.service.system.LoginLogService;
import cn.yuanfeisy.flash.utils.BeanUtil;
import cn.yuanfeisy.flash.utils.DateUtil;
import cn.yuanfeisy.flash.utils.factory.Page;
import cn.yuanfeisy.flash.warpper.LogWarpper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("/loginLog")
public class LoginLogController extends BaseController {
    @Autowired
    private LoginLogService loginlogService;
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @RequiresPermissions(value = {Permission.LOGIN_LOG})
    public Object list(@RequestParam(required = false) String beginTime,
                       @RequestParam(required = false) String endTime,
                       @RequestParam(required = false) String logName) {
        Page<LoginLog> page = new PageFactory<LoginLog>().defaultPage();
        page.addFilter("createTime", SearchFilter.Operator.GTE, DateUtil.parseDate(beginTime));
        page.addFilter("createTime", SearchFilter.Operator.LTE, DateUtil.parseDate(endTime));
        page.addFilter( "logname", SearchFilter.Operator.LIKE, logName);
        Page pageResult = loginlogService.queryPage(page);
        pageResult.setRecords((List<LoginLog>) new LogWarpper(BeanUtil.objectsToMaps(pageResult.getRecords())).warp());
        return Rets.success(pageResult);

    }



    @RequestMapping(method = RequestMethod.DELETE)
    @RequiresPermissions(value = {Permission.LOGIN_LOG_CLEAR})
    public Object clear() {
        loginlogService.clear();
        return Rets.success();
    }
}
