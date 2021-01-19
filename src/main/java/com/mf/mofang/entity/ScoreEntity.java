package com.mf.mofang.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;

import lombok.Data;


@Data
@TableName("score")
public class ScoreEntity {

    /**
     *
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 系号
     */
    private String xihao;
    /**
     * 项目编号
     */
    private Integer xmbh;

	/**
	 * 名次
	 */
	private Integer rank;
    /**
     * 得分
     */
    private BigDecimal score;
    /**
     * 姓名
     */
    private String name;

    @TableField(exist = false)
    private String all;
    @TableField(exist = false)
    private String man;
    @TableField(exist = false)
    private String woman;

}
