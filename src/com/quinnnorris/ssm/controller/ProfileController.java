package com.quinnnorris.ssm.controller;

import com.quinnnorris.ssm.bean.UserCustom;
import com.quinnnorris.ssm.bean.UsermessageCustom;
import com.quinnnorris.ssm.service.Implement.ProfileServiceImpl;
import com.quinnnorris.ssm.util.BaseJson;
import com.quinnnorris.ssm.util.HeadpUtil;
import com.quinnnorris.ssm.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

/**
 * Title: ProfileController
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/24 下午10:54 星期二
 * @author: quinn_norris
 * @version: 1.0
 */
@Controller
public class ProfileController extends BaseController {

    @Autowired
    ProfileServiceImpl profileService;

    @RequestMapping("/profile")
    public String toProfilePage(Model model,HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        profileService.setModels(model,httpSession);
        return "profile";
    }

    @RequestMapping(value = "/changeSchool",method = RequestMethod.POST)
    @ResponseBody
    public BaseJson changingSchool(@RequestParam String school,HttpSession httpSession){
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        UsermessageCustom usermessageCustom = new UsermessageCustom();
        usermessageCustom.setSchool(school);
        usermessageCustom.setPhone((String)httpSession.getAttribute("phone"));
        return profileService.changingUserSchool(usermessageCustom);
    }

    @RequestMapping(value = "/changeLocal",method = RequestMethod.POST)
    @ResponseBody
    public BaseJson changingLocal(@RequestParam String local,HttpSession httpSession){
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        UsermessageCustom usermessageCustom = new UsermessageCustom();
        usermessageCustom.setLocal(local);
        usermessageCustom.setPhone((String)httpSession.getAttribute("phone"));
        return profileService.changingUserLocal(usermessageCustom);
    }

    @RequestMapping(value = "/changeSign",method = RequestMethod.POST)
    @ResponseBody
    public BaseJson changingSign(@RequestParam String sign,HttpSession httpSession){
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        UsermessageCustom usermessageCustom = new UsermessageCustom();
        usermessageCustom.setSign(sign);
        usermessageCustom.setPhone((String)httpSession.getAttribute("phone"));
        return profileService.changingUserSign(usermessageCustom);
    }

    @RequestMapping(value = "/changeEmail",method = RequestMethod.POST)
    @ResponseBody
    public BaseJson changingEmail(@RequestParam String email,HttpSession httpSession){
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        UserCustom userCustom = new UserCustom();
        userCustom.setEmail(email);
        userCustom.setPhone((String)httpSession.getAttribute("phone"));
        return profileService.changingUserEmail(userCustom);
    }

    @RequestMapping(value = "/changeBgimage",method = RequestMethod.POST)
    @ResponseBody
    public BaseJson changingBgimage(@RequestParam MultipartFile bgimage, HttpSession httpSession){
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return new BaseJson("login");
        String headPath = "/Users/quinn_norris/Desktop/PROJECT/Learning/QuinnNorris/web/headp";
        String fileStr = HeadpUtil.insertHeadp(bgimage, headPath);
        UsermessageCustom usermessageCustom = new UsermessageCustom();
        usermessageCustom.setBgimage(fileStr);
        usermessageCustom.setPhone((String)httpSession.getAttribute("phone"));
        return profileService.changingUserBgimage(usermessageCustom);
    }

}
