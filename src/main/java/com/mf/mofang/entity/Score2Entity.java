package com.mf.mofang.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;

import lombok.Data;

/**
 *
 *
 * @author pt
 * @email pt@gmail.com
 * @date 2021-01-05 12:36:54
 */
@Data
public class Score2Entity {


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
