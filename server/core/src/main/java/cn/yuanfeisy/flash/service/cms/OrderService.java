package cn.yuanfeisy.flash.service.cms;

import cn.yuanfeisy.flash.bean.entity.cms.Order;
import cn.yuanfeisy.flash.dao.cms.OrderRepository;
import cn.yuanfeisy.flash.service.BaseService;
import org.springframework.stereotype.Service;

@Service
public class OrderService extends BaseService<Order,Long,OrderRepository> {
}
