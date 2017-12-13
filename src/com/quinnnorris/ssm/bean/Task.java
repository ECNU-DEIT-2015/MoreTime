package com.quinnnorris.ssm.bean;

import java.util.Date;

/**
 * Title: Task
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/25 下午5:19 星期三
 * @author: quinn_norris
 * @version: 1.0
 */
public class Task {

    private int tid;
    private int id;
    private String phone;
    private String task;
    private int types;
    private Date tasktime;

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public int getTypes() {
        return types;
    }

    public void setTypes(int types) {
        this.types = types;
    }

    public Date getTasktime() {
        return tasktime;
    }

    public void setTasktime(Date tasktime) {
        this.tasktime = tasktime;
    }
}
