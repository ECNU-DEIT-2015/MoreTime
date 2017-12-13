package com.quinnnorris.ssm.service;

import com.quinnnorris.ssm.bean.NotepadCustom;
import com.quinnnorris.ssm.bean.TaskCustom;
import com.quinnnorris.ssm.util.BaseJson;

/**
 * Title: NotepadService
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/25 下午12:27 星期三
 * @author: quinn_norris
 * @version: 1.0
 */
public interface NotepadService {
    public BaseJson setNewNotepad(NotepadCustom notepadCustom);

    public BaseJson loadingNotepad(NotepadCustom notepadCustom);

    public BaseJson deleteNotepad(NotepadCustom notepadCustom);

    public BaseJson addNewTask(TaskCustom taskCustom);

    public BaseJson loadingTask(TaskCustom taskCustom);

    public BaseJson updateTaskType(TaskCustom taskCustom);

}
