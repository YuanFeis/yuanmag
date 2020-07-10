package cn.yuanfeisy.flash.api.config;

import cn.yuanfeisy.flash.security.JwtUtil;
import cn.yuanfeisy.flash.utils.Constants;
import cn.yuanfeisy.flash.utils.HttpUtil;
import cn.yuanfeisy.flash.utils.StringUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;

import java.util.Optional;


@Configuration
public class UserIDAuditorConfig implements AuditorAware<Long> {
    @Override
    public Optional<Long> getCurrentAuditor() {
        try {
            String token = HttpUtil.getRequest().getHeader("Authorization");
            if (StringUtil.isNotEmpty(token)) {
                return Optional.of(JwtUtil.getUserId(token));
            }
        }catch (Exception e){

            return Optional.of(Constants.SYSTEM_USER_ID);
        }

        return Optional.of(Constants.SYSTEM_USER_ID);
    }
}
