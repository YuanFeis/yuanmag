package cn.yuanfeisy.flash.bean.core;

import cn.yuanfeisy.flash.bean.dictmap.base.AbstractDictMap;
import cn.yuanfeisy.flash.bean.dictmap.SystemDict;

import java.lang.annotation.*;


@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
public @interface BussinessLog {


    String value() default "";


    String key() default "id";


    Class<? extends AbstractDictMap> dict() default SystemDict.class;
}
