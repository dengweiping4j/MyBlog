package com.wq.service.impl;

import com.wq.entity.Article;
import com.wq.mapper.ArticleMapper;
import com.wq.service.ArticleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by dengweiping on 2019/5/19.
 */
@Service("articleService")
public class ArticleServiceImpl implements ArticleService {
    @Resource
    private ArticleMapper articleMapper;

    @Override
    public List<Map<String, Object>> findAllArticle(Map<String, Object> map) {
        return articleMapper.findAllArticle(map);
    }

    @Override
    public String findArticleTotal() {
        return articleMapper.findArticleTotal();
    }

    @Override
    public int addArticle(Article article) {
        article.setPkid(UUID.randomUUID().toString());
        //article.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        article.setCreateTime(new Date());
        article.setUserKey("admin");//暂时写死
        return articleMapper.insert(article);
    }
}
