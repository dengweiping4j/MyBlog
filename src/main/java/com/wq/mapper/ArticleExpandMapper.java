package com.wq.mapper;

import com.wq.entity.ArticleExpand;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository("articleExpandMapper")
public interface ArticleExpandMapper {

    int deleteByPrimaryKey(String pkid);

    int insert(ArticleExpand record);

    int insertSelective(ArticleExpand record);

    ArticleExpand selectByPrimaryKey(String pkid);

    int updateByPrimaryKeySelective(ArticleExpand record);

    int updateByPrimaryKey(ArticleExpand record);

    int delete(ArticleExpand articleExpand);

    ArticleExpand selectUpHand(Map<String, Object> map);
}