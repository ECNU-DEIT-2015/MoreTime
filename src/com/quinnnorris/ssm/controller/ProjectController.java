package com.quinnnorris.ssm.controller;

import com.quinnnorris.ssm.bean.ProinfoCustom;
import com.quinnnorris.ssm.bean.Project;
import com.quinnnorris.ssm.bean.ProjectCustom;
import com.quinnnorris.ssm.bean.SubjobCustom;
import com.quinnnorris.ssm.service.Implement.ProjectServiceImpl;
import com.quinnnorris.ssm.util.BaseJson;
import com.quinnnorris.ssm.util.DateUtil;
import com.quinnnorris.ssm.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

/**
 * Title: ProjectController
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/31 上午8:04 星期二
 * @author: quinn_norris
 * @version: 1.0
 */
@Controller
public class ProjectController extends BaseController {

    @Autowired
    ProjectServiceImpl projectService;


    @RequestMapping("/project")
    public String toProjectPage(HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        return "project";
    }

    @RequestMapping("/project/{pronumber}")
    public String toProjectPage(@PathVariable String pronumber, Model model, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        // do some models
        model.addAttribute("pronumber", pronumber);
        projectService.getPromessage(pronumber, model, httpSession);
        return "oneproject";
    }

    @RequestMapping(value = "/getpros", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson getProschange(HttpSession httpSession) {
        ProjectCustom projectCustom = new ProjectCustom();
        projectCustom.setPhone((String) httpSession.getAttribute("phone"));
        projectCustom.setTypes(1);
        BaseJson baseJson = projectService.selectOnePros(projectCustom);
        for (int i = 1; i <= (int) baseJson.getObject(); i++)
            httpSession.setAttribute("pro" + i, ((List<ProjectCustom>) (baseJson.getBeanObject())).get(i - 1).getPronumber());
        return baseJson;
    }

    @RequestMapping("/newpro")
    public String toChooseproPage(HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        return "newpro";
    }

    @RequestMapping("/oneproject")
    public String toonePage(HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        return "oneproject";
    }

    @RequestMapping(value = "/createNew", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson createOneNewPro(@RequestParam String name, @RequestParam String barcolor,
                                    @RequestParam String info, @RequestParam String begtime,
                                    @RequestParam String endtime, @RequestParam String toteltimes,
                                    @RequestParam String pronumber, @RequestParam String persons,
                                    @RequestParam String types, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        ProjectCustom projectCustom = new ProjectCustom();
        projectCustom.setBarcolor(barcolor);
        try {
            projectCustom.setBegtime(DateUtil.proshowStringFormat(begtime));
            projectCustom.setEndtime(DateUtil.proshowStringFormat(endtime));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        projectCustom.setInfo(info);
        projectCustom.setTypes(Integer.parseInt(types));
        projectCustom.setPhone((String) httpSession.getAttribute("phone"));
        projectCustom.setProname(name);
        BaseJson pronum = projectService.createNewProject(projectCustom);
        if (pronum.getErrorCode().equals("1")) return new BaseJson("1");
        ProinfoCustom proinfoCustom = new ProinfoCustom();
        proinfoCustom.setPhone((String) httpSession.getAttribute("phone"));
        proinfoCustom.setPersons(persons);
        proinfoCustom.setToteltimes(Integer.parseInt(toteltimes));
        proinfoCustom.setPronumber((String) pronum.getObject());
        proinfoCustom.setProcount(Integer.parseInt(pronumber));
        projectService.createNewProinfo(proinfoCustom);
        BaseJson baseJson = new BaseJson("0");
        baseJson.setBeanObject(projectCustom);
        return baseJson;
    }

    @RequestMapping(value = "/addProcess", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson addnewProcess(@RequestParam String times, @RequestParam String persons,
                                  @RequestParam String hisinfo, @RequestParam String pronumber,
                                  HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        SubjobCustom subjobCustom = new SubjobCustom();
        subjobCustom.setPhone((String) httpSession.getAttribute("phone"));
        subjobCustom.setDotimes(Integer.parseInt(times));
        subjobCustom.setPronumber(pronumber);
        subjobCustom.setPushperson(persons);
        subjobCustom.setPushtime(new Date());
        subjobCustom.setSubinfo(hisinfo);
        projectService.addNewProcess(subjobCustom);
        return new BaseJson("0");
    }

    @RequestMapping(value = "/endProcess", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson endProcess(@RequestParam String pronumber, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        ProjectCustom projectCustom = new ProjectCustom();
        projectCustom.setPhone((String) httpSession.getAttribute("phone"));
        projectCustom.setTypes(2);
        projectCustom.setPronumber(pronumber);
        projectService.endProcess(projectCustom);
        return new BaseJson("0");
    }

    @RequestMapping(value = "/delProcess", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson delProcess(@RequestParam String pronumber, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        ProjectCustom projectCustom = new ProjectCustom();
        projectCustom.setPhone((String) httpSession.getAttribute("phone"));
        projectCustom.setPronumber(pronumber);
        projectCustom.setTypes(3);
        projectService.delProcess(projectCustom);
        return new BaseJson("0");
    }

    @RequestMapping(value = "/getProcessdoing", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson getProcessdoing(@RequestParam String pronumber, @RequestParam String toteltimes,
                                    HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        SubjobCustom subjobCustom = new SubjobCustom();
        subjobCustom.setPhone((String) httpSession.getAttribute("phone"));
        subjobCustom.setPronumber(pronumber);
        return projectService.getProcessdoing(toteltimes, subjobCustom);
    }

    @RequestMapping(value = "/weekdayswork", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson weekDaysWork(@RequestParam String pronumber, @RequestParam String person,
                                 HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        SubjobCustom subjobCustom = new SubjobCustom();
        subjobCustom.setPronumber(pronumber);
        subjobCustom.setPhone((String) httpSession.getAttribute("phone"));
        subjobCustom.setPushperson(person);
        return projectService.weekdaysWork(subjobCustom);
    }

    @RequestMapping(value = "/personspie", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson personspies(@RequestParam String pronumber, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        SubjobCustom subjobCustom = new SubjobCustom();
        subjobCustom.setPronumber(pronumber);
        subjobCustom.setPhone((String) httpSession.getAttribute("phone"));
        return projectService.personspie(subjobCustom);
    }

    @RequestMapping(value = "/gethissubmit", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson gethissubmit(@RequestParam String pronumber, HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        SubjobCustom subjobCustom = new SubjobCustom();
        subjobCustom.setPronumber(pronumber);
        subjobCustom.setPhone((String) httpSession.getAttribute("phone"));
        return projectService.gethissubmits(subjobCustom);
    }

    @RequestMapping(value = "/getpropes", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson getprospes(HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        ProjectCustom projectCustom = new ProjectCustom();
        projectCustom.setPhone((String) httpSession.getAttribute("phone"));
        return projectService.getProcessPes(projectCustom);
    }

    @RequestMapping(value = "/getallhissubmit", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson getallhissubmit(HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        SubjobCustom subjobCustom = new SubjobCustom();
        subjobCustom.setPhone((String) httpSession.getAttribute("phone"));
        return projectService.getallhissubmits(subjobCustom);
    }

    @RequestMapping(value = "/getallhispro", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson getallispro(HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        ProjectCustom projectCustom = new ProjectCustom();
        projectCustom.setPhone((String) httpSession.getAttribute("phone"));
        return projectService.getallhispros(projectCustom);
    }

    @RequestMapping(value = "/weekdaysallwork", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson weekDaysallWork(HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        SubjobCustom subjobCustom = new SubjobCustom();
        subjobCustom.setPhone((String) httpSession.getAttribute("phone"));
        return projectService.weekdaysallWork(subjobCustom);
    }

    @RequestMapping(value = "/personsbar", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson personsbar(HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        ProjectCustom projectCustom = new ProjectCustom();
        projectCustom.setPhone((String)httpSession.getAttribute("phone"));
        return projectService.personsbar(projectCustom);
    }


}
