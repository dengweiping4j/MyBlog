package com.wq.mapper;

import com.wq.entity.Article;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("articleMapper")
public interface ArticleMapper {

    int deleteByPrimaryKey(String pkid);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(String pkid);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);

    List<Map<String,Object>> findAllArticle(Map<String, Object> map);

    String findArticleTotal();
}