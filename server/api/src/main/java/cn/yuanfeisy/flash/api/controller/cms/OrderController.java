package cn.yuanfeisy.flash.api.controller.cms;

import cn.yuanfeisy.flash.api.controller.BaseController;
import cn.yuanfeisy.flash.bean.constant.factory.PageFactory;

import cn.yuanfeisy.flash.bean.entity.cms.Order;
import cn.yuanfeisy.flash.bean.enumeration.Permission;
import cn.yuanfeisy.flash.bean.vo.front.Rets;
import cn.yuanfeisy.flash.service.cms.OrderService;
import cn.yuanfeisy.flash.utils.DateUtil;
import cn.yuanfeisy.flash.utils.factory.Page;
import com.alibaba.fastjson.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;


@RestController
@RequestMapping("/order")
public class OrderController extends BaseController {
    @Autowired
    private OrderService orderService;
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @RequiresPermissions(value = {Permission.ORDER})
    public Object list(@RequestParam(required = false) String userID,
                       @RequestParam(required = false) String mobile,
                       @RequestParam(required = false) String startDate,
                       @RequestParam(required = false) String endDate,
                       @RequestParam(required = false) Integer status

    ) {
        Page<Order> page = new PageFactory<Order>().defaultPage();
        page.addFilter("createTime", cn.yuanfeisy.flash.bean.vo.query.SearchFilter.Operator.GTE, DateUtil.parse(startDate,"yyyyMMddHHmmss"));
        page.addFilter("createTime", cn.yuanfeisy.flash.bean.vo.query.SearchFilter.Operator.LTE, DateUtil.parse(endDate,"yyyyMMddHHmmss"));
        page.addFilter("userID", cn.yuanfeisy.flash.bean.vo.query.SearchFilter.Operator.EQ,userID);
        page.addFilter("mobile", cn.yuanfeisy.flash.bean.vo.query.SearchFilter.Operator.EQ,mobile);
        page.addFilter("status", cn.yuanfeisy.flash.bean.vo.query.SearchFilter.Operator.EQ,status);

        page = orderService.queryPage(page);
        return Rets.success(page);
    }


//    @RequestMapping(value = "/add/{userID}/{mobile}/{status}/{remark}/{content}",method = RequestMethod.GET)
////    @RequiresPermissions(value = {Permission.ORDER})
//    public Object add(
////                        @RequestParam(required = false) String userID,
////                       @RequestParam(required = false) String mobile,
////                       @RequestParam(required = false) String startDate,
////                       @RequestParam(required = false) String endDate,
////                       @RequestParam(required = false) String status,
////                        @RequestParam(required = false) String remark
//            @PathVariable String userID,
//            @PathVariable String mobile,
//            @PathVariable String status,
//            @PathVariable String remark,
//            @PathVariable String content
//
//    ) {
//        Order order= new Order();
//        order.setUserID(userID) ;
//        order.setMobile(mobile) ;
//        order.setStatus(status) ;
//        order.setRemark(remark) ;
//        order.setContent(content) ;
//        orderService.insert(order);
//         return "seccess";
//    }


    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//    @RequiresPermissions(value = {Permission.ORDER})
    public Object add(
    ) {
        Order order= getFromJson(Order.class);
        String s = order.getContent();
        String s1 = s.replaceAll("number","amount");
//        System.out.println(s1);
        order.setContent(s1);
        orderService.insert(order);
        return Rets.success();
    }
}
