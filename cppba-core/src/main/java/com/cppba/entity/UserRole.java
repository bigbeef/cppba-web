package com.cppba.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Timestamp;
import java.util.Date;

/**
 * 用户角色表
 */
@Entity
@Table(name = "user_role")
public class UserRole {
    private long userRoleId;
    private Timestamp addTime = new Timestamp(new Date().getTime());
    private Integer deleteStatus = 0;
    private long userId;
    private long roleId;
    
    @Id
    @Column(name = "user_role_id")
    public long getUserRoleId() {
        return userRoleId;
    }


    public void setUserRoleId(long userRoleId) {
        this.userRoleId = userRoleId;
    }

    @Column(name = "add_time")
    public Timestamp getAddTime() {
        return addTime;
    }


    public void setAddTime(Timestamp addTime) {
        this.addTime = addTime;
    }

    @Column(name = "delete_status")
    public Integer getDeleteStatus() {
        return deleteStatus;
    }

    public void setDeleteStatus(Integer deleteStatus) {
        this.deleteStatus = deleteStatus;
    }
    
    @Column(name = "user_id")
    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    @Column(name = "role_id")
    public long getRoleId() {
        return roleId;
    }

    public void setRoleId(long roleId) {
        this.roleId = roleId;
    }
}
