package cn.yuanfeisy.flash.service.system;

import cn.yuanfeisy.flash.bean.constant.cache.Cache;
import cn.yuanfeisy.flash.bean.constant.cache.CacheKey;
import cn.yuanfeisy.flash.bean.entity.system.FileInfo;
import cn.yuanfeisy.flash.bean.enumeration.ConfigKeyEnum;
import cn.yuanfeisy.flash.cache.ConfigCache;
import cn.yuanfeisy.flash.cache.TokenCache;
import cn.yuanfeisy.flash.dao.system.FileInfoRepository;
import cn.yuanfeisy.flash.security.JwtUtil;
import cn.yuanfeisy.flash.service.BaseService;
import cn.yuanfeisy.flash.utils.XlsUtils;
import org.jxls.common.Context;
import org.jxls.expression.JexlExpressionEvaluator;
import org.jxls.transform.Transformer;
import org.jxls.util.JxlsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
public class FileService extends BaseService<FileInfo,Long,FileInfoRepository> {
    @Autowired
    private ConfigCache configCache;
    @Autowired
    private FileInfoRepository fileInfoRepository;
    @Autowired
    private TokenCache tokenCache;


    public FileInfo upload(MultipartFile multipartFile){
        String uuid = UUID.randomUUID().toString();
        String realFileName =   uuid +"."+ multipartFile.getOriginalFilename().split("\\.")[1];
        try {

            File file = new File(configCache.get(ConfigKeyEnum.SYSTEM_FILE_UPLOAD_PATH.getValue()) + File.separator+realFileName);
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            multipartFile.transferTo(file);
            return save(multipartFile.getOriginalFilename(),file);
        } catch (Exception e) {
            e.printStackTrace();
             return null;
        }
    }


    public FileInfo createExcel(String template, String fileName, Map<String, Object> data){
        FileOutputStream outputStream = null;
        File file = new File(configCache.get(ConfigKeyEnum.SYSTEM_FILE_UPLOAD_PATH.getValue()) + File.separator+UUID.randomUUID().toString()+".xlsx");
        try {


            outputStream =new FileOutputStream(file);

            JxlsHelper jxlsHelper = JxlsHelper.getInstance();
            String templateFile = getClass().getClassLoader().getResource(template).getPath();
            InputStream is = new BufferedInputStream(new FileInputStream(templateFile));

            Transformer transformer = jxlsHelper.createTransformer(is, outputStream);
            Context context = new Context();
            for (Map.Entry<String, Object> entry : data.entrySet()) {
                context.putVar(entry.getKey(), entry.getValue());
            }

            JexlExpressionEvaluator evaluator = (JexlExpressionEvaluator) transformer.getTransformationConfig().getExpressionEvaluator();
            Map<String, Object> funcs = new HashMap<String, Object>(4);
            funcs.put("utils", new XlsUtils());
            evaluator.getJexlEngine().setFunctions(funcs);
            jxlsHelper.processTemplate(context, transformer);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                outputStream.flush();
                outputStream.close();
            } catch (Exception e) {
            e.printStackTrace();
            }

        }
        return save(fileName,file);
    }

    public FileInfo save(String originalFileName,File file){
        try {
            FileInfo fileInfo = new FileInfo();
            fileInfo.setCreateTime(new Date());
            fileInfo.setCreateBy(JwtUtil.getUserId());
            fileInfo.setOriginalFileName(originalFileName);
            fileInfo.setRealFileName(file.getName());
            fileInfoRepository.save(fileInfo);
            return fileInfo;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    @Cacheable(value = Cache.APPLICATION, key = "'" + CacheKey.FILE_INFO + "'+#id")
    public FileInfo get(Long id){
        FileInfo fileInfo = fileInfoRepository.getOne(id);
        fileInfo.setAblatePath(configCache.get(ConfigKeyEnum.SYSTEM_FILE_UPLOAD_PATH.getValue()) + File.separator+fileInfo.getRealFileName());
        return fileInfo;
    }
}
