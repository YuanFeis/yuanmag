package cn.yuanfeisy.flash.api.controller.cms;

import cn.yuanfeisy.flash.api.controller.BaseController;
import cn.yuanfeisy.flash.bean.constant.factory.PageFactory;
import cn.yuanfeisy.flash.bean.entity.system.FileInfo;
import cn.yuanfeisy.flash.bean.enumeration.Permission;
import cn.yuanfeisy.flash.bean.vo.front.Rets;
import cn.yuanfeisy.flash.bean.vo.query.SearchFilter;
import cn.yuanfeisy.flash.service.system.FileService;
import cn.yuanfeisy.flash.utils.StringUtil;
import cn.yuanfeisy.flash.utils.factory.Page;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/fileMgr")
public class FileMgrController extends BaseController {

    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @RequiresPermissions(value = {Permission.FILE})
    public Object list(@RequestParam(required = false) String originalFileName
    ) {
        Page<FileInfo> page = new PageFactory<FileInfo>().defaultPage();
        if (StringUtil.isNotEmpty(originalFileName)) {
            page.addFilter(SearchFilter.build("originalFileName", SearchFilter.Operator.LIKE, originalFileName));
        }
        page = fileService.queryPage(page);
        return Rets.success(page);
    }
}
