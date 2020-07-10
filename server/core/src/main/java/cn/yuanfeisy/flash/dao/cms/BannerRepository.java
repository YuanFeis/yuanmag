
package cn.yuanfeisy.flash.dao.cms;

import cn.yuanfeisy.flash.bean.entity.cms.Banner;
import cn.yuanfeisy.flash.dao.BaseRepository;

import java.util.List;

public interface BannerRepository extends BaseRepository<Banner,Long> {

    List<Banner> findAllByType(String type);
}
