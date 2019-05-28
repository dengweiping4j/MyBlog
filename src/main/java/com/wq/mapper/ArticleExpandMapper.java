package com.wq.mapper;

import com.wq.entity.ArticleExpand;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository("articleExpandMapper")
public interface ArticleExpandMapper {

    int deleteByPrimaryKey(String pkid);

    int insertActive(ArticleExpand record);

    ArticleExpand selectByPrimaryKey(String pkid);

    int update(ArticleExpand record);

    int delete(ArticleExpand articleExpand);

    ArticleExpand selectUpHand(Map<String, Object> map);

    int insert(ArticleExpand articleExpand);
}