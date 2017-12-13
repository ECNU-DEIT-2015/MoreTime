package com.quinnnorris.ssm.controller;

import com.quinnnorris.ssm.util.BaseJson;
import com.quinnnorris.ssm.util.Configers;
import com.quinnnorris.ssm.util.EmailSend;
import com.quinnnorris.ssm.util.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Title: PostemailController
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/26 下午10:47 星期四
 * @author: quinn_norris
 * @version: 1.0
 */
@Controller
public class PostemailController extends BaseController {

    @RequestMapping("/postemail")
    public String toPostemailPage(HttpSession httpSession) {
        if (SessionUtil.sessionHasNull(httpSession, "phone")) return "login";
        return "postemail";
    }

    @RequestMapping("/postemail/post")
    @ResponseBody
    public BaseJson sendPostEmail(@RequestParam String inner, @RequestParam String titles,
                                  @RequestParam String selected, HttpSession httpSession) {
        boolean hasSccess = true;
        BaseJson baseJson = new BaseJson();
        String emailInner = Configers.getEmailInner();
        try {
            EmailSend.sendMail("sei_qnz2015@126.com", (String) (httpSession.getAttribute("username")),
                    "意见反馈——" + selected + ":" + titles, inner);
        } catch (Exception e) {
            e.printStackTrace();
            hasSccess = false;
        }
        if (hasSccess == true) baseJson.setErrorCode("0");
        else baseJson.setErrorCode("1");
        return baseJson;
    }

}
