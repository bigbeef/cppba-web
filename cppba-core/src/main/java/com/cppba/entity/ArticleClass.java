package com.cppba.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by Administrator on 2016/6/23.
 */
@Entity
@Table(name = "article_class", schema = "cppba", catalog = "")
public class ArticleClass implements Serializable {
    private long articleClassId;
    private Timestamp addTime = new Timestamp(new Date().getTime());
    private Integer deleteStatus = 0;
    private Long userId;
    private String name;
    private Integer sortId;

    @Id
    @Column(name = "article_class_id")
    public long getArticleClassId() {
        return articleClassId;
    }

    public void setArticleClassId(long articleClassId) {
        this.articleClassId = articleClassId;
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
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "sort_id")
    public Integer getSortId() {
        return sortId;
    }

    public void setSortId(Integer sortId) {
        this.sortId = sortId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ArticleClass that = (ArticleClass) o;

        if (articleClassId != that.articleClassId) return false;
        if (addTime != null ? !addTime.equals(that.addTime) : that.addTime != null) return false;
        if (deleteStatus != null ? !deleteStatus.equals(that.deleteStatus) : that.deleteStatus != null) return false;
        if (userId != null ? !userId.equals(that.userId) : that.userId != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (sortId != null ? !sortId.equals(that.sortId) : that.sortId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (articleClassId ^ (articleClassId >>> 32));
        result = 31 * result + (addTime != null ? addTime.hashCode() : 0);
        result = 31 * result + (deleteStatus != null ? deleteStatus.hashCode() : 0);
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (sortId != null ? sortId.hashCode() : 0);
        return result;
    }
}
