package com.wq.service.impl;

import com.wq.entity.Article;
import com.wq.mapper.ArticleMapper;
import com.wq.service.ArticleService;
import com.wq.util.DateUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by dengweiping on 2019/5/19.
 */
@Service("articleService")
public class ArticleServiceImpl implements ArticleService {
    @Resource
    private ArticleMapper articleMapper;

    @Override
    public List<Map<String, Object>> findAllArticle(Map<String, Object> map) {
        List<Map<String, Object>> allArticle = articleMapper.findAllArticle(map);
        List<Map<String, Object>> newAllArticle = new ArrayList<>();
        for (Map<String, Object> allArticleMap : allArticle) {
            String result = DateUtil.DateHandel(allArticleMap.get("createTime") + "");//日期处理
            if (result != null) {
                allArticleMap.put("createTime", result);
            }
            newAllArticle.add(allArticleMap);
        }
        return newAllArticle;
    }

    @Override
    public String findArticleTotal() {
        return articleMapper.findArticleTotal();
    }

    @Override
    public int addArticle(Article article) {
        article.setPkid(UUID.randomUUID().toString());
        article.setCreateTime(new Date());
        return articleMapper.insertSelective(article);
    }
}
