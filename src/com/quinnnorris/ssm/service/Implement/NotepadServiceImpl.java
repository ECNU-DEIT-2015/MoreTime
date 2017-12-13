package com.quinnnorris.ssm.service.Implement;

import com.quinnnorris.ssm.bean.NotepadCustom;
import com.quinnnorris.ssm.bean.TaskCustom;
import com.quinnnorris.ssm.mapper.NotepadCustomMapper;
import com.quinnnorris.ssm.mapper.TaskCustomMapper;
import com.quinnnorris.ssm.service.NotepadService;
import com.quinnnorris.ssm.util.BaseJson;
import com.quinnnorris.ssm.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.*;

/**
 * Title: NotepadServiceImpl
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/25 下午12:27 星期三
 * @author: quinn_norris
 * @version: 1.0
 */
@Service("notepadService")
public class NotepadServiceImpl implements NotepadService {

    @Autowired
    NotepadCustomMapper notepadCustomMapper;

    @Autowired
    TaskCustomMapper taskCustomMapper;

    @Override
    public BaseJson setNewNotepad(NotepadCustom notepadCustom) {
        notepadCustom.setTypes(1);
        notepadCustom.setFintime(new Date());
        NotepadCustom custom = notepadCustomMapper.selectNotByPhoneTitlesType(notepadCustom);
        if (custom != null) return new BaseJson("1");
        notepadCustomMapper.insertNewNotepad(notepadCustom);
        return new BaseJson("0");
    }

    @Override
    public BaseJson loadingNotepad(NotepadCustom notepadCustom) {
        notepadCustom.setTypes(1);
        notepadCustom.setStartPos(0);
        notepadCustom.setPageSize(7);
        List<NotepadCustom> customs = notepadCustomMapper.selectNotByPhoneTypeLimit(notepadCustom);
        List<Map<String, String>> list = new ArrayList<>();
        for (NotepadCustom custom : customs) {
            Map<String, String> map = new HashMap<>();
            map.put("titles", custom.getTitles());
            map.put("inners", custom.getInners());
            try {
                map.put("time", DateUtil.lineDateFormat(custom.getFintime()));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            list.add(map);
        }
        Map<String, List<Map<String, String>>> maps = new HashMap<>();
        maps.put("not_list", list);
        BaseJson baseJson = new BaseJson(maps);
        return baseJson;
    }

    @Override
    public BaseJson deleteNotepad(NotepadCustom notepadCustom) {
        notepadCustom.setTypes(2);
        notepadCustomMapper.updateNotByPhoneTitlesType(notepadCustom);
        return new BaseJson("0");
    }

    @Override
    public BaseJson addNewTask(TaskCustom taskCustom) {
        taskCustomMapper.insertNewTask(taskCustom);
        return new BaseJson("0");
    }

    @Override
    public BaseJson loadingTask(TaskCustom taskCustom) {
        taskCustom.setTypes(1);
        taskCustom.setStartPos(0);
        taskCustom.setPageSize(7);
        List<TaskCustom> customs = taskCustomMapper.selectTsakByPhoneTypeLimit(taskCustom);
        List<String> list = new ArrayList<>();
        for (TaskCustom custom : customs)
            list.add(custom.getTask());
        Map<String, List<String>> maps = new HashMap<>();
        maps.put("task1_list", list);
        taskCustom.setTypes(2);
        taskCustom.setStartPos(0);
        taskCustom.setPageSize(6);
        List<TaskCustom> customs1 = taskCustomMapper.selectTsakByPhoneTypeLimit(taskCustom);
        List<String> list1 = new ArrayList<>();
        for (TaskCustom custom : customs1)
            list1.add(custom.getTask());
        maps.put("task2_list", list1);
        BaseJson baseJson = new BaseJson(maps);
        return baseJson;
    }

    @Override
    public BaseJson updateTaskType(TaskCustom taskCustom) {
        taskCustomMapper.updateTaskTypeByPhoneTask(taskCustom);
        return new BaseJson("0");
    }

}
