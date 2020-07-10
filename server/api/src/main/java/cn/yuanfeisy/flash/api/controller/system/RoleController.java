package cn.yuanfeisy.flash.api.controller.system;

import cn.yuanfeisy.flash.api.controller.BaseController;
import cn.yuanfeisy.flash.bean.constant.Const;
import cn.yuanfeisy.flash.bean.core.BussinessLog;
import cn.yuanfeisy.flash.bean.dictmap.RoleDict;
import cn.yuanfeisy.flash.bean.entity.system.Role;
import cn.yuanfeisy.flash.bean.entity.system.User;
import cn.yuanfeisy.flash.bean.enumeration.BizExceptionEnum;
import cn.yuanfeisy.flash.bean.enumeration.Permission;
import cn.yuanfeisy.flash.bean.exception.ApplicationException;
import cn.yuanfeisy.flash.bean.vo.front.Rets;
import cn.yuanfeisy.flash.bean.vo.node.Node;
import cn.yuanfeisy.flash.bean.vo.node.ZTreeNode;
import cn.yuanfeisy.flash.bean.vo.query.SearchFilter;
import cn.yuanfeisy.flash.service.system.LogObjectHolder;
import cn.yuanfeisy.flash.service.system.RoleService;
import cn.yuanfeisy.flash.service.system.UserService;
import cn.yuanfeisy.flash.service.system.impl.ConstantFactory;
import cn.yuanfeisy.flash.utils.*;
import cn.yuanfeisy.flash.warpper.RoleWarpper;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/role")
public class RoleController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(RoleController.class);

    @Autowired
    private RoleService roleService;
    @Autowired
    private UserService userService;
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @RequiresPermissions(value = {Permission.ROLE})
    public Object list(String name){
        List roles = null;
        if(Strings.isNullOrEmpty(name)) {
            roles =  roleService.queryAll();
        }else{
            roles = roleService.findByName(name);
        }
        return Rets.success(new RoleWarpper(BeanUtil.objectsToMaps(roles)).warp());
    }

    @RequestMapping(method = RequestMethod.POST)
    @BussinessLog(value = "编辑角色", key = "name", dict = RoleDict.class)
    @RequiresPermissions(value = {Permission.ROLE_EDIT})
    public Object save(@Valid Role role){
        if(role.getId()==null) {
            roleService.insert(role);
        }else{
            roleService.update(role);
        }
        return Rets.success();
    }
    @RequestMapping(method = RequestMethod.DELETE)
    @BussinessLog(value = "删除角色", key = "roleId", dict = RoleDict.class)
    @RequiresPermissions(value = {Permission.ROLE_DEL})
    public Object remove(@RequestParam Long roleId){
        logger.info("id:{}",roleId);
        if (roleId==null) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        if(roleId.intValue()<2){
            return Rets.failure("不能删除初始角色");
        }
        List<User> userList = userService.queryAll(SearchFilter.build("roleid", SearchFilter.Operator.EQ,String.valueOf(roleId)));
        if(!userList.isEmpty()){
            return Rets.failure("有用户使用该角色，禁止删除");
        }

        if(roleId.intValue() ==Const.ADMIN_ROLE_ID){
            return Rets.failure("禁止删除超级管理员角色");
        }

        LogObjectHolder.me().set(ConstantFactory.me().getSingleRoleName(roleId));
        roleService.delRoleById(roleId);
        return Rets.success();
    }

    @RequestMapping(value = "/savePermisson",method = RequestMethod.POST)
    @BussinessLog(value = "配置角色权限", key = "roleId", dict = RoleDict.class)
    @RequiresPermissions(value = {Permission.ROLE_EDIT})
    public Object setAuthority(Long roleId, String
            permissions) {
        if (BeanUtil.isOneEmpty(roleId)) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        roleService.setAuthority(roleId, permissions);
        return Rets.success();
    }



    @RequestMapping(value = "/roleTreeListByIdUser", method = RequestMethod.GET)
    @RequiresPermissions(value = {Permission.ROLE})
    public Object roleTreeListByIdUser(Long idUser) {
        User user = userService.get(idUser);
        String roleIds = user.getRoleid();
        List<ZTreeNode> roleTreeList = null;
        if (StringUtil.isEmpty(roleIds)) {
            roleTreeList = roleService.roleTreeList();
        } else {
            Long[] roleArray = Convert.toLongArray(",", roleIds);
            roleTreeList = roleService.roleTreeListByRoleId(roleArray);

        }
        List<Node> list = roleService.generateRoleTree(roleTreeList);
        List<Long> checkedIds = Lists.newArrayList();
        for (ZTreeNode zTreeNode : roleTreeList) {
            if (zTreeNode.getChecked() != null && zTreeNode.getChecked()) {
                checkedIds.add(zTreeNode.getId());
            }
        }
        return Rets.success(Maps.newHashMap("treeData", list, "checkedIds", checkedIds));
    }
}
