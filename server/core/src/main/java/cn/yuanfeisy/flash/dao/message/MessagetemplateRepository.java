package cn.yuanfeisy.flash.dao.message;


import cn.yuanfeisy.flash.bean.entity.message.MessageTemplate;
import cn.yuanfeisy.flash.dao.BaseRepository;

import java.util.List;


public interface MessagetemplateRepository extends BaseRepository<MessageTemplate,Long> {
    MessageTemplate findByCode(String code);

    List<MessageTemplate> findByIdMessageSender(Long idMessageSender);
}

