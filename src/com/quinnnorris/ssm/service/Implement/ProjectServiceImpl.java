package com.quinnnorris.ssm.service.Implement;

import com.quinnnorris.ssm.bean.ProinfoCustom;
import com.quinnnorris.ssm.bean.ProjectCustom;
import com.quinnnorris.ssm.bean.SubjobCustom;
import com.quinnnorris.ssm.mapper.ProinfoCustomMapper;
import com.quinnnorris.ssm.mapper.ProjectCustomMapper;
import com.quinnnorris.ssm.mapper.SubjobCustomMapper;
import com.quinnnorris.ssm.service.ProjectService;
import com.quinnnorris.ssm.util.BaseJson;
import com.quinnnorris.ssm.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.*;

/**
 * Title: ProjectServiceImpl
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/11/2 下午5:21 星期四
 * @author: quinn_norris
 * @version: 1.0
 */
@Service("projectServiceImpl")
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    ProjectCustomMapper projectCustomMapper;

    @Autowired
    ProinfoCustomMapper proinfoCustomMapper;

    @Autowired
    SubjobCustomMapper subjobCustomMapper;

    @Override
    public BaseJson createNewProject(ProjectCustom projectCustom) {
        List<ProjectCustom> customList = projectCustomMapper.selectProByPhoneTypes(projectCustom);
        if (customList.size() >= 4) return new BaseJson("1");
        String pronumbers = "";
        try {
            pronumbers = DateUtil.continueDateFormat(new Date());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        pronumbers += projectCustom.getPhone().substring(7);
        projectCustom.setPronumber(pronumbers.substring(3));
        projectCustomMapper.insertPro(projectCustom);
        BaseJson baseJson = new BaseJson("0");
        baseJson.setObject(projectCustom.getPronumber());
        return baseJson;
    }

    @Override
    public void createNewProinfo(ProinfoCustom proinfoCustom) {
        proinfoCustomMapper.insertProinfo(proinfoCustom);
    }

    @Override
    public BaseJson selectOnePros(ProjectCustom projectCustom) {
        List<ProjectCustom> customList = projectCustomMapper.selectProByPhoneTypes(projectCustom);
        BaseJson baseJson = new BaseJson();
        baseJson.setBeanObject(customList);
        baseJson.setObject(customList.size());
        return baseJson;
    }

    @Override
    public BaseJson getPromessage(String pronumber, Model model, HttpSession httpSession) {
        ProjectCustom projectCustom = new ProjectCustom();
        projectCustom.setPhone((String) httpSession.getAttribute("phone"));
        projectCustom.setPronumber(pronumber);
        ProjectCustom custom = projectCustomMapper.selectProByPronumber(projectCustom);
        model.addAttribute("color", custom.getBarcolor());
        try {
            model.addAttribute("begtime", DateUtil.proshowDateFormat(custom.getBegtime()));
            model.addAttribute("endtime", DateUtil.proshowDateFormat(custom.getEndtime()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        model.addAttribute("info", custom.getInfo());
        model.addAttribute("name", custom.getProname());
        model.addAttribute("phone", custom.getPhone());
        ProinfoCustom proinfoCustom = new ProinfoCustom();
        proinfoCustom.setPhone((String) httpSession.getAttribute("phone"));
        proinfoCustom.setPronumber(pronumber);
        ProinfoCustom custom1 = proinfoCustomMapper.selectProinfoByPhonePronumber(proinfoCustom);
        model.addAttribute("forgetinfo", custom1.getForgetinfo());
        model.addAttribute("count", custom1.getProcount());
        model.addAttribute("toteltimes", custom1.getToteltimes());
        model.addAttribute("persons", custom1.getPersons().trim());
        return new BaseJson();
    }

    @Override
    public BaseJson addNewProcess(SubjobCustom subjobCustom) {
        subjobCustomMapper.insertSubjob(subjobCustom);
        return new BaseJson("0");
    }

    @Override
    public void endProcess(ProjectCustom projectCustom) {
        projectCustomMapper.updateTypesByPhone(projectCustom);
    }

    @Override
    public void delProcess(ProjectCustom projectCustom) {
        projectCustomMapper.updateTypesByPhone(projectCustom);
    }

    @Override
    public BaseJson getProcessdoing(String toteltimes, SubjobCustom subjobCustom) {
        List<SubjobCustom> customList = subjobCustomMapper.selectSubjobByPhonePronumber(subjobCustom);
        double toteltimes_ser = 0;
        for (int i = 0; i < customList.size(); i++)
            toteltimes_ser += customList.get(i).getDotimes();
        int pre = (int) ((toteltimes_ser / Double.parseDouble(toteltimes)) * 100);
        return new BaseJson(pre);
    }

    @Override
    public BaseJson weekdaysWork(SubjobCustom subjobCustom) {
        List<SubjobCustom> subjobCustoms;
        if (subjobCustom.getPushperson().equals("all"))
            subjobCustoms = subjobCustomMapper.selectSubjobByPhonePronumber(subjobCustom);
        else
            subjobCustoms = subjobCustomMapper.selectSubjobByPhonePronumberPerson(subjobCustom);
        int[] olds = new int[7];
        String[] dates = new String[7];
        int upper = Integer.MIN_VALUE;
        int lower = Integer.MAX_VALUE;
        try {
            for (int i = 6; i >= 0; i--) {
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(new Date());
                calendar.add(Calendar.DATE, -i);
                String oldtime = DateUtil.simpleDateFormat(calendar.getTime());
                dates[i] = DateUtil.monthdayDateFormat(calendar.getTime());
                for (int j = 0; j < subjobCustoms.size(); j++)
                    if (oldtime.equals(DateUtil.simpleDateFormat(subjobCustoms.get(j).getPushtime())))
                        olds[i] += subjobCustoms.get(j).getDotimes();
                upper = upper > olds[i] ? upper : olds[i];
                lower = lower < olds[i] ? lower : olds[i];
            }
            int pre = (upper - lower) / 4;
            if (pre == 0) pre = 1;
            int minpre = lower - pre;
            if (minpre < 0) minpre = 0;
            Map<String, Object> map = new HashMap<>();
            map.put("pre", pre);
            map.put("minpre", minpre);
            map.put("maxpre", upper + pre);
            map.put("olds", olds);
            map.put("dates", dates);
            BaseJson baseJson = new BaseJson(map);
            return baseJson;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return new BaseJson("none");
    }

    @Override
    public BaseJson personspie(SubjobCustom subjobCustom) {
        List<SubjobCustom> customList = subjobCustomMapper.selectpersoncountByPronumber(subjobCustom);
        Map<String, Object> map = new HashMap<>();
        String[] pes = new String[customList.size()];
        String[] pernames = new String[customList.size()];
        double alldoings = 0;
        for (SubjobCustom sub : customList) alldoings += sub.getAlltimes();
        for (int i = 0; i < customList.size(); i++) {
            pes[i] = ((int) ((customList.get(i).getAlltimes() / alldoings) * 100)) + "";
            pernames[i] = customList.get(i).getPushperson();
        }
        map.put("pes", pes);
        map.put("pernames", pernames);
        map.put("size", customList.size());
        return new BaseJson(map);
    }

    @Override
    public BaseJson gethissubmits(SubjobCustom subjobCustom) {
        List<SubjobCustom> customList = subjobCustomMapper.selectSubjobByPhonePronumber(subjobCustom);
        Map<String, Object> map = new HashMap<>();
        String[] person = new String[customList.size()];
        String[] inner = new String[customList.size()];
        String[] time = new String[customList.size()];
        String[] works = new String[customList.size()];
        for (int i = 0; i < customList.size(); i++) {
            person[i] = customList.get(i).getPushperson();
            inner[i] = customList.get(i).getSubinfo();
            try {
                time[i] = DateUtil.normalDateFormat(customList.get(i).getPushtime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            works[i] = customList.get(i).getDotimes() + "";
        }
        map.put("person", person);
        map.put("inner", inner);
        map.put("time", time);
        map.put("works", works);
        map.put("size", customList.size());
        return new BaseJson(map);
    }

    @Override
    public BaseJson getProcessPes(ProjectCustom projectCustom) {
        projectCustom.setTypes(1);
        List<ProjectCustom> projectCustoms = projectCustomMapper.selectProByPhoneTypes(projectCustom);
        int[] propes = new int[projectCustoms.size()];
        String[] pronames = new String[projectCustoms.size()];
        String[] colors = new String[projectCustoms.size()];
        String[] pronumbers = new String[projectCustoms.size()];
        for (int i = 0; i < projectCustoms.size(); i++) {
            pronames[i] = projectCustoms.get(i).getProname();
            ProinfoCustom proinfoCustom = new ProinfoCustom();
            proinfoCustom.setPronumber(projectCustoms.get(i).getPronumber());
            proinfoCustom.setPhone(projectCustoms.get(i).getPhone());
            ProinfoCustom proinfoCustoms = proinfoCustomMapper.selectProinfoByPhonePronumber(proinfoCustom);
            double totels = proinfoCustoms.getToteltimes();
            SubjobCustom subjobCustom = new SubjobCustom();
            subjobCustom.setPronumber(projectCustoms.get(i).getPronumber());
            SubjobCustom subjobCustoms = subjobCustomMapper.selectallcountByPronumber(subjobCustom);
            double sumdos = .0;
            if (subjobCustoms != null)
                sumdos = subjobCustoms.getAlltimes();
            colors[i] = projectCustoms.get(i).getBarcolor();
            propes[i] = (int) ((sumdos / totels) * 100);
            pronumbers[i] = projectCustoms.get(i).getPronumber();
        }

        Map<String, Object> map = new HashMap<>();
        map.put("propes", propes);
        map.put("sizes", projectCustoms.size());
        map.put("pronames", pronames);
        map.put("colors", colors);
        map.put("pronumbers", pronumbers);
        return new BaseJson(map);
    }

    @Override
    public BaseJson getallhissubmits(SubjobCustom subjobCustom) {
        ProjectCustom projectCustom = new ProjectCustom();
        projectCustom.setPhone(subjobCustom.getPhone());
        projectCustom.setTypes(1);
        List<ProjectCustom> projectCustoms = projectCustomMapper.selectProByPhoneTypes(projectCustom);
        Map<String, Object> map = new HashMap<>();
        List<String> person = new ArrayList<>();
        List<String> inner = new ArrayList<>();
        List<String> time = new ArrayList<>();
        List<String> works = new ArrayList<>();
        int allsize = 0;
        for (int j = 0; j < projectCustoms.size(); j++) {
            subjobCustom.setPronumber(projectCustoms.get(j).getPronumber());
            List<SubjobCustom> customList = subjobCustomMapper.selectSubjobByPhonePronumber(subjobCustom);
            allsize += customList.size();
            for (int i = 0; i < customList.size(); i++) {
                person.add(customList.get(i).getPushperson());
                inner.add(customList.get(i).getSubinfo());
                try {
                    time.add(DateUtil.normalDateFormat(customList.get(i).getPushtime()));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                works.add(customList.get(i).getDotimes() + "");
            }
        }
        map.put("person", person);
        map.put("inner", inner);
        map.put("time", time);
        map.put("works", works);
        map.put("size", allsize);
        return new BaseJson(map);
    }

    @Override
    public BaseJson getallhispros(ProjectCustom projectCustom) {
        List<ProjectCustom> list = projectCustomMapper.selectProByPhone(projectCustom);
        int size = list.size();
        Map<String, Object> map = new HashMap<>();
        String[] names = new String[size];
        int[] count = new int[size];
        String[] info = new String[size];
        String[] begtime = new String[size];
        String[] endtime = new String[size];
        String[] status = new String[size];
        for (int i = 0; i < size; i++) {
            ProinfoCustom proinfoCustom = new ProinfoCustom();
            proinfoCustom.setPhone(list.get(i).getPhone());
            proinfoCustom.setPronumber(list.get(i).getPronumber());
            ProinfoCustom proinfoCustom1 = proinfoCustomMapper.selectProinfoByPhonePronumber(proinfoCustom);
            count[i] = proinfoCustom1.getProcount();
            names[i] = list.get(i).getProname();
            info[i] = list.get(i).getInfo();
            try {
                begtime[i] = DateUtil.proshowDateFormat(list.get(i).getBegtime());
                endtime[i] = DateUtil.proshowDateFormat(list.get(i).getEndtime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            if (list.get(i).getTypes() == 1) status[i] = "正在进行";
            else if (list.get(i).getTypes() == 2) status[i] = "已完成";
            else status[i] = "已删除";
        }

        map.put("names", names);
        map.put("count", count);
        map.put("info", info);
        map.put("begtime", begtime);
        map.put("endtime", endtime);
        map.put("status", status);
        map.put("size", size);

        return new BaseJson(map);
    }

    @Override
    public BaseJson weekdaysallWork(SubjobCustom subjobCustom) {
        ProjectCustom projectCustom = new ProjectCustom();
        projectCustom.setPhone(subjobCustom.getPhone());
        projectCustom.setTypes(1);
        List<ProjectCustom> pros = projectCustomMapper.selectProByPhoneTypes(projectCustom);
        int[] olds = new int[7];
        String[] dates = new String[7];
        int upper = Integer.MIN_VALUE;
        int lower = Integer.MAX_VALUE;
        for (int k = 0; k < pros.size(); k++) {
            List<SubjobCustom> subjobCustoms;
            subjobCustom.setPronumber(pros.get(k).getPronumber());
            subjobCustoms = subjobCustomMapper.selectSubjobByPhonePronumber(subjobCustom);
            try {
                for (int i = 6; i >= 0; i--) {
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(new Date());
                    calendar.add(Calendar.DATE, -i);
                    String oldtime = DateUtil.simpleDateFormat(calendar.getTime());
                    dates[i] = DateUtil.monthdayDateFormat(calendar.getTime());
                    for (int j = 0; j < subjobCustoms.size(); j++)
                        if (oldtime.equals(DateUtil.simpleDateFormat(subjobCustoms.get(j).getPushtime())))
                            olds[i] += subjobCustoms.get(j).getDotimes();
                    upper = upper > olds[i] ? upper : olds[i];
                    lower = lower < olds[i] ? lower : olds[i];
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        int pre = (upper - lower) / 4;
        if (pre == 0) pre = 1;
        int minpre = lower - pre;
        if (minpre < 0) minpre = 0;
        Map<String, Object> map = new HashMap<>();
        map.put("pre", pre);
        map.put("minpre", minpre);
        map.put("maxpre", upper + pre);
        map.put("olds", olds);
        map.put("dates", dates);
        BaseJson baseJson = new BaseJson(map);
        return baseJson;
    }

    @Override
    public BaseJson personsbar(ProjectCustom projectCustom) {
        projectCustom.setTypes(1);
        List<ProjectCustom> customList = projectCustomMapper.selectProByPhoneTypes(projectCustom);
        String[] pronames = new String[customList.size()];
        int[] alloftimes = new int[customList.size()];
        for (int k = 0; k < customList.size(); k++) {
            SubjobCustom subjobCustom = new SubjobCustom();
            subjobCustom.setPhone(customList.get(k).getPhone());
            subjobCustom.setPronumber(customList.get(k).getPronumber());
            List<SubjobCustom> subjobCustoms = subjobCustomMapper.selectSubjobByPhonePronumber(subjobCustom);
            pronames[k] = customList.get(k).getProname();
            try {
                for (int i = 6; i >= 0; i--) {
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(new Date());
                    calendar.add(Calendar.DATE, -i);
                    String oldtime = DateUtil.simpleDateFormat(calendar.getTime());
                    for (int j = 0; j < subjobCustoms.size(); j++)
                        if (oldtime.equals(DateUtil.simpleDateFormat(subjobCustoms.get(j).getPushtime()))) {
                            alloftimes[k] += subjobCustoms.get(j).getDotimes();
                        }
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        Map<String, Object> map = new HashMap<>();
        map.put("pronames", pronames);
        map.put("alloftimes", alloftimes);
        map.put("size", customList.size());
        return new BaseJson(map);

    }

}
