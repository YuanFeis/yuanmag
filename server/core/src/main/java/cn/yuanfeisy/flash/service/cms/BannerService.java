package cn.yuanfeisy.flash.service.cms;

import cn.yuanfeisy.flash.bean.entity.cms.Banner;
import cn.yuanfeisy.flash.bean.enumeration.cms.BannerTypeEnum;
import cn.yuanfeisy.flash.bean.vo.offcialsite.BannerVo;
import cn.yuanfeisy.flash.dao.cms.BannerRepository;
import cn.yuanfeisy.flash.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BannerService extends BaseService<Banner,Long,BannerRepository> {
    @Autowired
    private BannerRepository bannerRepository;


    public BannerVo queryIndexBanner(){
    return queryBanner(BannerTypeEnum.INDEX.getValue());
    }

    public BannerVo queryBanner(String type){
        BannerVo banner = new BannerVo();
        List<cn.yuanfeisy.flash.bean.entity.cms.Banner> bannerList = bannerRepository.findAllByType(type);
        banner.setIndex(0);
        banner.setList(bannerList);
        return  banner;
    }
}
