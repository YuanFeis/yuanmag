package cn.yuanfeisy.flash.dao.message;


import cn.yuanfeisy.flash.bean.entity.message.Message;
import cn.yuanfeisy.flash.dao.BaseRepository;

import java.util.ArrayList;


public interface MessageRepository extends BaseRepository<Message,Long> {
    void deleteAllByIdIn(ArrayList<String> list);
}

