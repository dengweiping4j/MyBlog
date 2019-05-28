package com.wq.service.impl;

import com.wq.entity.Article;
import com.wq.entity.ArticleExpand;
import com.wq.mapper.ArticleExpandMapper;
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
    @Resource
    private ArticleExpandMapper articleExpandMapper;

    /*
     * @Description 查询文章列表
     * @param [map]
     * @return java.util.List<java.util.Map<java.lang.String,java.lang.Object>>
     * @throws
     * @author dengweiping
     * @date 2019/5/28 17:46
     */
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

    /*
     * @Description 添加文章
     * @param [article]
     * @return int
     * @throws
     * @author dengweiping
     * @date 2019/5/28 17:46
     */
    @Override
    public int addArticle(Article article) {
        article.setPkid(UUID.randomUUID().toString());
        article.setCreateTime(new Date());
        return articleMapper.insertSelective(article);
    }

    /*
     * @Description 文章点赞功能，第一次点击会向文章扩展表插入一条点赞数据，再次点击时根据文章id和操作人id删除对应点赞数据
     * @param [articleExpand]
     * @return int
     * @throws
     * @author dengweiping
     * @date 2019/5/28 13:57
     */
    @Override
    public int upHand(ArticleExpand articleExpand) {
        if (selectHandUpState(articleExpand) == 1) {//如果已存在，则本次作为取消点赞删除
            return articleExpandMapper.delete(articleExpand);
        }
        articleExpand.setPkid(UUID.randomUUID().toString());
        articleExpand.setCreateTime(new Date());
        return articleExpandMapper.insertActive(articleExpand);
    }

    /*
     * @Description 获取指定用户点赞状态
     * @param [articleExpand]
     * @return int
     * @throws
     * @author dengweiping
     * @date 2019/5/28 17:45
     */
    @Override
    public int selectHandUpState(ArticleExpand articleExpand) {
        Map<String, Object> map = new HashMap<>();
        map.put("articleKey", articleExpand.getArticleKey());
        map.put("userKey", articleExpand.getUserKey());
        return articleExpandMapper.selectUpHand(map) == null ? 0 : 1;
    }

    /*
     * @Description 获取指定文章点赞数
     * @param [articleKey]
     * @return int
     * @throws
     * @author dengweiping
     * @date 2019/5/28 17:45
     */
    @Override
    public int selectHandUpNum(String articleKey) {
        return articleExpandMapper.selectHandUpNum(articleKey);
    }
}
