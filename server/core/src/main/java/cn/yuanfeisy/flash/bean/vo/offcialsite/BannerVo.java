package cn.yuanfeisy.flash.bean.vo.offcialsite;

import lombok.Data;

import java.util.List;

@Data
public class BannerVo {
    private Integer index = 0;
    private List<cn.yuanfeisy.flash.bean.entity.cms.Banner> list;

}
