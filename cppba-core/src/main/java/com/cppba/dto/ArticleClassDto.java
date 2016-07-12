package com.cppba.dto;

import com.cppba.entity.ArticleClass;

/**
 * 开发者
 * nickName:大黄蜂
 * email:245655812@qq.com
 * github:https://github.com/bigbeef
 */
public class ArticleClassDto extends BaseDto {
    private ArticleClass articleClass;
    private String likeName;

    public ArticleClass getArticleClass() {
        return articleClass;
    }

    public void setArticleClass(ArticleClass articleClass) {
        this.articleClass = articleClass;
    }

    public String getLikeName() {
        return likeName;
    }

    public void setLikeName(String likeName) {
        this.likeName = likeName;
    }
}
