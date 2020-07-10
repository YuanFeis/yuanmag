package cn.yuanfeisy.flash.dao.system;


import cn.yuanfeisy.flash.bean.entity.system.Notice;
import cn.yuanfeisy.flash.dao.BaseRepository;

import java.util.List;


public interface NoticeRepository extends BaseRepository<Notice,Long> {
    List<Notice> findByTitleLike(String name);
}
