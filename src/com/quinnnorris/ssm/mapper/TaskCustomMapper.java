package com.quinnnorris.ssm.mapper;

import com.quinnnorris.ssm.bean.NotepadCustom;
import com.quinnnorris.ssm.bean.TaskCustom;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Title: TaskCustomMapper
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/25 下午5:35 星期三
 * @author: quinn_norris
 * @version: 1.0
 */
@Repository("taskCustomMapper")
public interface TaskCustomMapper {

    public void insertNewTask(TaskCustom taskCustom);

    public List<TaskCustom> selectTsakByPhoneTypeLimit(TaskCustom taskCustom);

    public void updateTaskTypeByPhoneTask(TaskCustom taskCustom);

    public List<TaskCustom> selectTaskByPhone(TaskCustom taskCustom);
}
