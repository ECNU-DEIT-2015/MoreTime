package com.quinnnorris.ssm.bean;

/**
 * Title: TaskCustom
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/25 下午5:20 星期三
 * @author: quinn_norris
 * @version: 1.0
 */
public class TaskCustom extends Task {

    private int startPos;
    private int pageSize;

    public int getStartPos() {
        return startPos;
    }

    public void setStartPos(int startPos) {
        this.startPos = startPos;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
