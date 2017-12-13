package com.quinnnorris.ssm.controller;

import com.quinnnorris.ssm.bean.NotepadCustom;
import com.quinnnorris.ssm.bean.TaskCustom;
import com.quinnnorris.ssm.service.Implement.NotepadServiceImpl;
import com.quinnnorris.ssm.util.BaseJson;
import com.quinnnorris.ssm.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Title: NotepadController
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/24 下午6:36 星期二
 * @author: quinn_norris
 * @version: 1.0
 */
@Controller
public class NotepadController extends BaseController {

    @Autowired
    NotepadServiceImpl notepadService;

    @RequestMapping("/notepad")
    public String toNotepadPage(HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        return "notepad";
    }

    @RequestMapping(value = "/notepad/save", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson saveNewNotepad(@RequestParam String inners,
                                   @RequestParam String titles, HttpSession httpSession) {
        NotepadCustom notepadCustom = new NotepadCustom();
        notepadCustom.setPhone((String) httpSession.getAttribute("phone"));
        notepadCustom.setInners(inners);
        notepadCustom.setTitles(titles);
        return notepadService.setNewNotepad(notepadCustom);
    }

    @RequestMapping(value = "/notepad/loading", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson loadingNotepad( HttpSession httpSession) {
        NotepadCustom notepadCustom = new NotepadCustom();
        notepadCustom.setPhone((String) httpSession.getAttribute("phone"));
        BaseJson baseJson = notepadService.loadingNotepad(notepadCustom);
        return baseJson;
    }

    @RequestMapping(value = "/notepad/delete", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson deleteNotepad(@RequestParam String titles, HttpSession httpSession) {
        NotepadCustom notepadCustom = new NotepadCustom();
        notepadCustom.setPhone((String) httpSession.getAttribute("phone"));
        notepadCustom.setTitles(titles);
        BaseJson baseJson = notepadService.deleteNotepad(notepadCustom);
        return baseJson;
    }

    @RequestMapping(value = "/task/add", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson addNewTask(@RequestParam String task, HttpSession httpSession) {
        TaskCustom taskCustom = new TaskCustom();
        taskCustom.setTask(task);
        taskCustom.setPhone((String) httpSession.getAttribute("phone"));
        taskCustom.setTypes(1);
        taskCustom.setTasktime(new Date());
        BaseJson baseJson = notepadService.addNewTask(taskCustom);
        return baseJson;
    }

    @RequestMapping(value = "/task/loading", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson updateNewTask(HttpSession httpSession) {
        TaskCustom taskCustom = new TaskCustom();
        taskCustom.setPhone((String) httpSession.getAttribute("phone"));
        return notepadService.loadingTask(taskCustom);
    }

    @RequestMapping(value = "/task/refresh", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson updateTaskTypes(@RequestParam String task, HttpSession httpSession) {
        TaskCustom taskCustom = new TaskCustom();
        taskCustom.setTask(task);
        taskCustom.setTypes(2);
        taskCustom.setPhone((String) httpSession.getAttribute("phone"));
        return notepadService.updateTaskType(taskCustom);
    }

    @RequestMapping(value = "/task/delete", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson deleteTaskType(@RequestParam String task, HttpSession httpSession) {
        TaskCustom taskCustom = new TaskCustom();
        taskCustom.setTask(task);
        taskCustom.setPhone((String) httpSession.getAttribute("phone"));
        taskCustom.setTypes(3);
        return notepadService.updateTaskType(taskCustom);
    }

}