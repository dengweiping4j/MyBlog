package com.wq.service;

import com.wq.entity.Article;
import com.wq.entity.ArticleExpand;

import java.util.List;
import java.util.Map;

/**
 * Created by dengweiping on 2019/5/19.
 */
public interface ArticleService {
    List<Map<String, Object>> findAllArticle(Map<String, Object> map);

    String findArticleTotal();

    int addArticle(Article article);

    int upHand(ArticleExpand articleExpand);
}
