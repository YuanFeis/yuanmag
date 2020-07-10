
package cn.yuanfeisy.flash.dao.cms;

import cn.yuanfeisy.flash.bean.entity.cms.Dish;
import cn.yuanfeisy.flash.dao.BaseRepository;

import java.util.List;

public interface DishRepository extends BaseRepository<Dish,Long> {

    List<Dish> findAllByIdChannel(Long idChannel);
}
