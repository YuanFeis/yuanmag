package cn.yuanfeisy.flash.bean.core;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
public @interface Permission {
    String[] value() default {};
}
