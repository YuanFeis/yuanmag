package cn.yuanfeisy.flash.utils;

import cn.yuanfeisy.flash.bean.dictmap.base.AbstractDictMap;
import cn.yuanfeisy.flash.core.factory.DictFieldWarpperFactory;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.beans.BeanUtils;
import org.springframework.cglib.beans.BeanMap;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;
import java.util.Map;


public class BeanUtil {

    public static final String SEPARATOR = ";;;";

    public static <T> Map<String, Object> beanToMap(T bean) {
        Map<String, Object> map = Maps.newHashMap();
        if (bean != null) {
            BeanMap beanMap = BeanMap.create(bean);
            for (Object key : beanMap.keySet()) {
                map.put(key+"", beanMap.get(key));
            }
        }
        return map;
    }


    public static <T> T mapToBean(Map<String, Object> map,T bean) {
        BeanMap beanMap = BeanMap.create(bean);
        beanMap.putAll(map);
        return bean;
    }


    public static <T> List<Map<String, Object>> objectsToMaps(List<T> objList) {
        List<Map<String, Object>> list = Lists.newArrayList();
        if (objList != null && objList.size() > 0) {
            Map<String, Object> map = null;
            T bean = null;
            for (int i = 0,size = objList.size(); i < size; i++) {
                bean = objList.get(i);
                map = beanToMap(bean);
                list.add(map);
            }
        }
        return list;
    }


    public static <T> List<T> mapsToObjects(List<Map<String, Object>> maps,Class<T> clazz) throws InstantiationException, IllegalAccessException {
        List<T> list = Lists.newArrayList();
        if (maps != null && maps.size() > 0) {
            Map<String, Object> map = null;
            T bean = null;
            for (int i = 0,size = maps.size(); i < size; i++) {
                map = maps.get(i);
                bean = clazz.newInstance();
                mapToBean(map, bean);
                list.add(bean);
            }
        }
        return list;
    }

    public static <T> List<T> objectToObjects(List<Object> objectList,Class<T> clazz) throws InstantiationException, IllegalAccessException {
        List<T> list = Lists.newArrayList();
        if (objectList != null && objectList.size() > 0) {
            Object source = null;
            T bean = null;
            for (int i = 0,size = objectList.size(); i < size; i++) {
                source = objectList.get(i);
                bean = clazz.newInstance();
                BeanUtils.copyProperties(source,bean);
                list.add(bean);
            }
        }
        return list;
    }





    public static String contrastObj(Class dictClass, String key, Object pojo1, Map<String, String> pojo2) throws IllegalAccessException, InstantiationException {
        AbstractDictMap dictMap = (AbstractDictMap) dictClass.newInstance();
        String str = parseMutiKey(dictMap, key, pojo2) + SEPARATOR;
        try {
            Class clazz = pojo1.getClass();
            Field[] fields = pojo1.getClass().getDeclaredFields();
            int i = 1;
            for (Field field : fields) {
                if ("serialVersionUID".equals(field.getName())) {
                    continue;
                }
                PropertyDescriptor pd = new PropertyDescriptor(field.getName(), clazz);
                Method getMethod = pd.getReadMethod();
                Object o1 = getMethod.invoke(pojo1);
                Object o2 = pojo2.get(StringUtil.firstCharToLowerCase(getMethod.getName().substring(3)));
                if (o1 == null || o2 == null) {
                    continue;
                }
                if (o1 instanceof Date) {
                    o1 = DateUtil.getDay((Date) o1);
                } else if (o1 instanceof Integer) {
                    o2 = Integer.parseInt(o2.toString());
                }
                if (!o1.toString().equals(o2.toString())) {
                    if (i != 1) {
                        str += SEPARATOR;
                    }
                    String fieldName = dictMap.get(field.getName());
                    String fieldWarpperMethodName = dictMap.getFieldWarpperMethodName(field.getName());
                    if (fieldWarpperMethodName != null) {
                        Object o1Warpper = DictFieldWarpperFactory.createFieldWarpper(o1, fieldWarpperMethodName);
                        Object o2Warpper = DictFieldWarpperFactory.createFieldWarpper(o2, fieldWarpperMethodName);
                        str += "字段名称:" + fieldName + ",旧值:" + o1Warpper + ",新值:" + o2Warpper;
                    } else {
                        str += "字段名称:" + fieldName + ",旧值:" + o1 + ",新值:" + o2;
                    }
                    i++;
                }
            }
        } catch (Exception e) {
        }
        return str;
    }


    public static String parseMutiKey(AbstractDictMap dictMap, String key, Map<String, String> requests) {
        StringBuilder sb = new StringBuilder();
        if (key.indexOf(",") != -1) {
            String[] keys = key.split(",");
            for (String item : keys) {
                String fieldWarpperMethodName = dictMap.getFieldWarpperMethodName(item);
                String value = requests.get(item);
                if (fieldWarpperMethodName != null) {
                    Object valueWarpper = DictFieldWarpperFactory.createFieldWarpper(value, fieldWarpperMethodName);
                    sb.append(dictMap.get(item) + "=" + valueWarpper + ",");
                } else {
                    sb.append(dictMap.get(item) + "=" + value + ",");
                }
            }
            return StringUtil.removeSuffix(sb.toString(), ",");
        } else {
            String fieldWarpperMethodName = dictMap.getFieldWarpperMethodName(key);
            String value = requests.get(key);
            if (fieldWarpperMethodName != null) {
                Object valueWarpper = DictFieldWarpperFactory.createFieldWarpper(value, fieldWarpperMethodName);
                sb.append(dictMap.get(key) + "=" + valueWarpper);
            } else {
                sb.append(dictMap.get(key) + "=" + value);
            }
            return sb.toString();
        }
    }


    public static boolean isOneEmpty(Object... os) {
        for (Object o : os) {
            if (StringUtil.isNullOrEmpty(o)) {
                return true;
            }
        }
        return false;
    }

}
