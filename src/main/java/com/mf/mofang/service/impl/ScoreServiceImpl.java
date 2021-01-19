package com.mf.mofang.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mf.mofang.dao.ScoreDao;
import com.mf.mofang.entity.ScoreEntity;
import com.mf.mofang.service.ScoreService;
import com.mf.mofang.util.PageUtils;
import com.mf.mofang.util.Query;


@Service("scoreService")
public class ScoreServiceImpl extends ServiceImpl<ScoreDao, ScoreEntity> implements ScoreService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ScoreEntity> page = this.page(
                new Query<ScoreEntity>().getPage(params),
                new QueryWrapper<ScoreEntity>()
        );

        return new PageUtils(page);
    }
    @Override
    public PageUtils queryPage2(Map<String, Object> params) {
        IPage<ScoreEntity> page = this.page(
                new Query<ScoreEntity>().getPage(params),
                new QueryWrapper<ScoreEntity>()
        );


        return new PageUtils(page);
    }

}
