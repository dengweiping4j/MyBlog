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
     * 获取文章列表Controller
     */
    @RequestMapping(value = "/findAllArticle", method = RequestMethod.POST)
    @ResponseBody
    public JSONArray findAllArticle() {
        Map<String, Object> map = new HashMap<>();
        map.put("start", 0);
        map.put("size", 10);
        List<Map<String, Object>> list = articleService.findAllArticle(map);
        if (list.size() > 0) {
            JSONArray jsonArray = JSONArray.fromObject(list);
            return jsonArray;
        }
        return null;
    }
}
