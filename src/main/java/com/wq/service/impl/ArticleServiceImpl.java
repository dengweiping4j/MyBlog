package com.wq.service.impl;

import com.wq.mapper.ArticleMapper;
import com.wq.service.ArticleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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
}
