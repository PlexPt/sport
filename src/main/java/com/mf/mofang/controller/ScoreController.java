package com.mf.mofang.controller;

import com.mf.mofang.entity.ScoreEntity;
import com.mf.mofang.service.ScoreService;
import com.mf.mofang.util.PageUtils;
import com.mf.mofang.util.R;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



@RestController
@RequestMapping("pay/score")
public class ScoreController {
    @Autowired
    private ScoreService scoreService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = scoreService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/zonglist")
    public R zonglist(@RequestParam Map<String, Object> params) {
        List<ScoreEntity> list = scoreService.list();
        Map<String, BigDecimal> all = new HashMap<>();

        Map<String, BigDecimal> man = new HashMap<>();
        Map<String, BigDecimal> woman = new HashMap<>();

        if (list != null) {
            for (ScoreEntity entity : list) {
                String key = entity.getXihao();
                BigDecimal score = entity.getScore();
                if (score == null) {
                    score = BigDecimal.ZERO;
                }
                BigDecimal now = all.getOrDefault(key, BigDecimal.ZERO);

                all.put(key, now.add(score));
                if (entity.getXmbh() <= 10) {
                    //男
                    BigDecimal now1 = man.getOrDefault(key, BigDecimal.ZERO);

                    man.put(key, now1.add(score));
                } else {
                    //女
                    BigDecimal now2 = woman.getOrDefault(key, BigDecimal.ZERO);

                    woman.put(key, now2.add(score));
                }
            }
        }

        List<ScoreEntity> result = new ArrayList<>();
        for (String key : all.keySet()) {

            ScoreEntity entity = new ScoreEntity();
            entity.setId(1);
            entity.setXihao(key);
            entity.setAll(all.getOrDefault(key, BigDecimal.ZERO).toPlainString());
            entity.setMan(man.getOrDefault(key, BigDecimal.ZERO).toPlainString());
            entity.setWoman(woman.getOrDefault(key, BigDecimal.ZERO).toPlainString());
            result.add(entity);
        }

        PageUtils page = new PageUtils(result, result.size(), result.size(), 1);
        page.setCurrPage(1);
        page.setTotalCount(all.keySet().size());
        page.setPageSize(all.keySet().size());
        page.setTotalPage(1);
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Integer id) {
        ScoreEntity score = scoreService.getById(id);

        return R.ok().put("score", score);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ScoreEntity score) {
        scoreService.save(score);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody ScoreEntity score) {
        scoreService.updateById(score);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete/{id}")
    public R delete(@PathVariable Integer id) {
        scoreService.removeByIds(Arrays.asList(id));

        return R.ok();
    }

}
