package com.wq.service.impl;

import com.wq.entity.Article;
import com.wq.mapper.ArticleMapper;
import com.wq.service.ArticleService;
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
        String nowDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());//系统当前时间
        for (Map<String, Object> allArticleMap : allArticle) {//日期处理
            String createTime = allArticleMap.get("createTime") + "";
            int createYear = Integer.parseInt(createTime.substring(0, 4));//创建年
            int nowYear = Integer.parseInt(nowDate.substring(0, 4));//当前年
            int createMonth = Integer.parseInt(createTime.substring(5, 7));//创建年
            int nowMonth = Integer.parseInt(nowDate.substring(5, 7));//当前年
            int createDay = Integer.parseInt(createTime.substring(8, 10));//创建日
            int nowDay = Integer.parseInt(nowDate.substring(8, 10));//当前日
            int createHour = Integer.parseInt(createTime.substring(11, 13));//创建小时
            int nowHour = Integer.parseInt(nowDate.substring(11, 13));//当前小时
            int createMinute = Integer.parseInt(createTime.substring(14, 16));//创建分
            int nowMinute = Integer.parseInt(nowDate.substring(14, 16));//当前分

            if (nowYear - createYear < 1) {
                allArticleMap.put("createTime", createTime.substring(5));
                if (nowMonth - createMonth == 0) {
                    if (nowDay == createDay) {
                        allArticleMap.put("createTime", "今天 " + createTime.substring(11));
                        if (nowHour - createHour < 1) {
                            if (nowMinute - createMinute < 1) {
                                allArticleMap.put("createTime", "刚刚");
                            }
                        } else if (nowHour - createHour <= 10) {
                            allArticleMap.put("createTime", (nowHour - createHour) + "小时前");
                        }
                    } else if (nowDay - createDay == 1) {
                        allArticleMap.put("createTime", "昨天 " + createTime.substring(11));
                    } else if (nowDay - createDay == 2) {
                        allArticleMap.put("createTime", "前天 " + createTime.substring(11));
                    }
                }
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
        //article.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        article.setCreateTime(new Date());
        article.setUserKey("admin");//暂时写死
        return articleMapper.insert(article);
    }
}
