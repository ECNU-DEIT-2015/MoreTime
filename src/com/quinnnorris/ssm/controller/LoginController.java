package com.quinnnorris.ssm.controller;

import com.quinnnorris.ssm.bean.UserCustom;
import com.quinnnorris.ssm.service.Implement.LoginServiceImpl;
import com.quinnnorris.ssm.util.BaseJson;
import com.quinnnorris.ssm.util.Configers;
import com.quinnnorris.ssm.util.EmailSend;
import com.quinnnorris.ssm.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Title: LoginController
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/23 下午1:43 星期一
 * @author: quinn_norris
 * @version: 1.0
 */
@Controller
public class LoginController {

    @Autowired
    private LoginServiceImpl loginService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson registerUser(@RequestParam String phone, @RequestParam String pw, HttpSession httpSession) {
        UserCustom userCustom = new UserCustom();
        userCustom.setPhone(phone);
        userCustom.setPassword(pw);
        return loginService.findUserByLogin(userCustom, httpSession);
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson registerPhonePW(@RequestParam String phone, @RequestParam String pw,
                                    @RequestParam String username, HttpSession httpSession) {
        UserCustom userCustom = new UserCustom();
        userCustom.setPhone(phone);
        userCustom.setPassword(pw);
        userCustom.setUsername(username);
        return loginService.findUserByRegister(userCustom, httpSession);
    }

    @RequestMapping(value = "/forget", method = RequestMethod.POST)
    @ResponseBody
    public BaseJson registerPhonePW(@RequestParam String email, HttpSession httpSession) {
        boolean hasSccess = true;
        BaseJson baseJson = new BaseJson();
        String emailInner = Configers.getEmailInner();
        try {
            EmailSend.sendMail(email, (String) (httpSession.getAttribute("username")),
                    "【MoreTime】修改密码邮箱验证", emailInner);
        } catch (Exception e) {
            e.printStackTrace();
            hasSccess = false;
        }
        if (!hasSccess) baseJson.setErrorCode("1");
        else baseJson.setErrorCode("0");
        return baseJson;
    }

    @RequestMapping("/signout")
    public String signOutToLogin(HttpSession httpSession){
        SessionUtil.initSession(httpSession);
        return "login";
    }

}
