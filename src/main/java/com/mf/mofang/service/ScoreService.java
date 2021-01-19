package com.mf.mofang.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mf.mofang.entity.ScoreEntity;
import com.mf.mofang.util.PageUtils;

import java.util.Map;


/**
 *
 *
 * @author pt
 * @email pt@gmail.com
 * @date 2021-01-05 12:36:54
 */
public interface ScoreService extends IService<ScoreEntity> {

    PageUtils queryPage(Map<String, Object> params);
    PageUtils queryPage2(Map<String, Object> params);

}

