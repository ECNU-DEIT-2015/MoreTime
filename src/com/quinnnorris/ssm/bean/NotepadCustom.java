package com.quinnnorris.ssm.bean;

/**
 * Title: NotepadCustom
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/25 上午10:57 星期三
 * @author: quinn_norris
 * @version: 1.0
 */
public class NotepadCustom extends Notepad {

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
