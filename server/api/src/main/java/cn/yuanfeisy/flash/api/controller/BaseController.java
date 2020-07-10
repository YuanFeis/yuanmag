package cn.yuanfeisy.flash.api.controller;


import cn.yuanfeisy.flash.api.utils.ApiConstants;
import cn.yuanfeisy.flash.security.JwtUtil;
import cn.yuanfeisy.flash.utils.HttpUtil;
import cn.yuanfeisy.flash.utils.StringUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLDecoder;


public class BaseController {
    private static Logger logger = LoggerFactory.getLogger(BaseController.class);


    public Long getIdUser(HttpServletRequest request) {
        String token = request.getHeader("Authorization");

        Long idUser = JwtUtil.getUserId(token);
        if (idUser == null) {
            throw new RuntimeException("用户不存在");
        }
        return idUser;
    }


    public String getToken(HttpServletRequest request) {
        return request.getHeader("Authorization");
    }

    public String getToken() {
        return HttpUtil.getRequest().getHeader("Authorization");
    }


    public String getRealIp(HttpServletRequest req) {
        String ip = req.getHeader("x-forwarded-for");

        if (ip == null || ip.length() == 0 || ApiConstants.IP_UNKNOW.equalsIgnoreCase(ip)) {
            ip = req.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || ApiConstants.IP_UNKNOW.equalsIgnoreCase(ip)) {
            ip = req.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || ApiConstants.IP_UNKNOW.equalsIgnoreCase(ip)) {
            ip = req.getRemoteAddr();
        }
        if (ip == null || ip.length() == 0 || ApiConstants.IPV6_LOCALHOST.equals(ip)) {
            ip =ApiConstants.IPV4_LOCALHOST;
        }
        return ip;
    }


    public String getjsonReq() {
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(HttpUtil.getRequest().getInputStream()));
            String line = null;
            StringBuilder sb = new StringBuilder();
            while ((line = br.readLine()) != null) {
                sb.append(line);

            }
            br.close();
            if (sb.length() < 1) {
                return "";
            }
            String reqBody = URLDecoder.decode(sb.toString(), "UTF-8");
            reqBody = reqBody.substring(reqBody.indexOf("{"));
            return reqBody;

        } catch (IOException e) {

            logger.error("获取json参数错误！{}", e.getMessage());

            return "";

        }

    }

    public <T> T getFromJson(Class<T> klass) {
        String jsonStr = getjsonReq();
        if (StringUtil.isEmpty(jsonStr)) {
            return null;
        }
        JSONObject json = JSONObject.parseObject(jsonStr);
        return JSON.toJavaObject(json, klass);
    }


}
