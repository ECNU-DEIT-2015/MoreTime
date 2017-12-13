package com.quinnnorris.ssm.service;

import com.quinnnorris.ssm.bean.ProinfoCustom;
import com.quinnnorris.ssm.bean.ProjectCustom;
import com.quinnnorris.ssm.bean.SubjobCustom;
import com.quinnnorris.ssm.util.BaseJson;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

/**
 * Title: ProjectService
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/11/2 下午5:21 星期四
 * @author: quinn_norris
 * @version: 1.0
 */
public interface ProjectService {

    public BaseJson createNewProject(ProjectCustom projectCustom);

    public void createNewProinfo(ProinfoCustom proinfoCustom);

    public BaseJson selectOnePros(ProjectCustom projectCustom);

    public BaseJson getPromessage(String pronumber, Model model, HttpSession httpSession);

    public BaseJson addNewProcess(SubjobCustom subjobCustom);

    public void endProcess(ProjectCustom projectCustom);

    public void delProcess(ProjectCustom projectCustom);

    public BaseJson getProcessdoing(String toteltimes, SubjobCustom subjobCustom);

    public BaseJson weekdaysWork(SubjobCustom subjobCustom);

    public BaseJson personspie(SubjobCustom subjobCustom);

    public BaseJson gethissubmits(SubjobCustom subjobCustom);

    public BaseJson getProcessPes(ProjectCustom projectCustom);

    public BaseJson getallhissubmits(SubjobCustom subjobCustom);

    public BaseJson getallhispros(ProjectCustom projectCustom);

    public BaseJson weekdaysallWork(SubjobCustom subjobCustom);

    public BaseJson personsbar(ProjectCustom projectCustom);
}
