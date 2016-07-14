package com.cppba.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

/**
 * 角色表
 */
@Entity
@Table(name = "role")
public class Role implements Serializable {
    private long roleId;
    private Timestamp addTime = new Timestamp(new Date().getTime());
    private Integer deleteStatus = 0;
    /**角色名**/
    private String name;
    /**角色说明**/
    private String description;

    @Id
    @Column(name = "role_id")
    public long getRoleId() {
        return roleId;
    }

    
    public void setRoleId(long roleId) {
        this.roleId = roleId;
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

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
