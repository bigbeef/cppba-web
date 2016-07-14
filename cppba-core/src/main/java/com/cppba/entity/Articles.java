package com.cppba.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by Administrator on 2016/6/23.
 */
@Entity
@Table(name = "articles", schema = "cppba", catalog = "")
public class Articles implements Serializable {
    private long articleId;
    private Timestamp addTime = new Timestamp(new Date().getTime());
    private Integer deleteStatus = 0;
    private Long userId;
    private Long articleClassId;
    private String title;
    private String abstracts;
    private String content;

    @Id
    @Column(name = "article_id")
    public long getArticleId() {
        return articleId;
    }

    public void setArticleId(long articleId) {
        this.articleId = articleId;
    }

    @Basic
    @Column(name = "add_time")
    public Timestamp getAddTime() {
        return addTime;
    }

    public void setAddTime(Timestamp addTime) {
        this.addTime = addTime;
    }

    @Basic
    @Column(name = "delete_status")
    public Integer getDeleteStatus() {
        return deleteStatus;
    }

    public void setDeleteStatus(Integer deleteStatus) {
        this.deleteStatus = deleteStatus;
    }

    @Basic
    @Column(name = "user_id")
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "article_class_id")
    public Long getArticleClassId() {
        return articleClassId;
    }

    public void setArticleClassId(Long articleClassId) {
        this.articleClassId = articleClassId;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "abstracts")
    public String getAbstracts() {
        return abstracts;
    }

    public void setAbstracts(String abstracts) {
        this.abstracts = abstracts;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Articles articles = (Articles) o;

        if (articleId != articles.articleId) return false;
        if (addTime != null ? !addTime.equals(articles.addTime) : articles.addTime != null) return false;
        if (deleteStatus != null ? !deleteStatus.equals(articles.deleteStatus) : articles.deleteStatus != null)
            return false;
        if (userId != null ? !userId.equals(articles.userId) : articles.userId != null) return false;
        if (articleClassId != null ? !articleClassId.equals(articles.articleClassId) : articles.articleClassId != null)
            return false;
        if (title != null ? !title.equals(articles.title) : articles.title != null) return false;
        if (abstracts != null ? !abstracts.equals(articles.abstracts) : articles.abstracts != null) return false;
        if (content != null ? !content.equals(articles.content) : articles.content != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (articleId ^ (articleId >>> 32));
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (deleteStatus != null ? deleteStatus.hashCode() : 0);
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (articleClassId != null ? articleClassId.hashCode() : 0);
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (abstracts != null ? abstracts.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        return result;
    }
}
