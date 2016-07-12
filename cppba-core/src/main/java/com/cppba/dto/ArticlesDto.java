package com.cppba.dto;

import com.cppba.entity.Articles;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 * velocity模板生成 cppba-codeTemplate
 */
public class ArticlesDto extends BaseDto{
    private Articles articles;
    private String likeName;

    public Articles getArticles() {
        return articles;
    }

    public void setArticles(Articles articles) {
        this.articles = articles;
    }

    public String getLikeName() {
        return likeName;
    }

    public void setLikeName(String likeName) {
        this.likeName = likeName;
    }
}