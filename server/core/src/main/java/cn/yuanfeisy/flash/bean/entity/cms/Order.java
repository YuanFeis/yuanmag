package cn.yuanfeisy.flash.bean.entity.cms;

import cn.yuanfeisy.flash.bean.entity.BaseEntity;
import lombok.Data;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.validation.constraints.NotBlank;

@Entity(name="t_cms_order")
@Data
@Table(appliesTo = "t_cms_order",comment = "订单信息")
@EntityListeners(AuditingEntityListener.class)
public class Order extends BaseEntity {
    @Column(columnDefinition = "VARCHAR(64) COMMENT '客户ID'")
    @NotBlank(message = "名称不能为空")
    private String userID;
    @Column(columnDefinition = "VARCHAR(64) COMMENT '联系电话'")
    @NotBlank(message = "手机号不能为空")
    private String mobile;
    @Column(columnDefinition = "VARCHAR(128) COMMENT '备注'")
    private String remark;
    @Column(columnDefinition = "TEXT COMMENT '菜单'")
    @NotBlank(message = "菜单不能为空")
    private String content;
    @Column(columnDefinition = "VARCHAR(64) COMMENT '状态'")
    @NotBlank(message = "状态不能为空")
    private String status;
}
