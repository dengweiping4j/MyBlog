package com.wq.controller;

import com.wq.service.ArticleService;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by dengweiping on 2019/5/19.
 */
@Controller
@RequestMapping("/article")
public class ArticleController {
    @Resource
    private ArticleService articleService;

    /**
     * 获取文章列表
     */
    @RequestMapping(value = "/findAllArticle", method = RequestMethod.POST)
    @ResponseBody
    public JSONArray findAllArticle(String curPage) {
        Map<String, Object> map = new HashMap<>();
        map.put("start", (Integer.parseInt(curPage) - 1) * 3);
        map.put("size", 3);
        List<Map<String, Object>> list = articleService.findAllArticle(map);
        if (list.size() > 0) {
            JSONArray jsonArray = JSONArray.fromObject(list);
            return jsonArray;
        }
        return null;
    }

    /**
     * 获取文章列表总数
     */
    @RequestMapping(value = "/findArticleTotal", method = RequestMethod.POST)
    @ResponseBody
    public JSONArray findArticleTotal() {
        String pageTotal = articleService.findArticleTotal();
        Map<String, Object> map = new HashMap();
        map.put("pageTotal", pageTotal);
        map.put("pageSize", 3);
        map.put("pageNum", Integer.parseInt(pageTotal) / 3 + 1);
        JSONArray jsonArray = JSONArray.fromObject(map);
        return jsonArray;
    }
}
