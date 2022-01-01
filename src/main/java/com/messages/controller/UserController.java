package com.messages.controller;

import com.messages.beans.AuthBean;
import com.messages.beans.db.Followers;
import com.messages.beans.db.MessageUser;
import com.messages.dao.FollowersDAO;
import com.messages.service.AuthService;
import com.messages.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {
    @Autowired AuthService authService;
    @Autowired UserService userService;
    @Autowired FollowersDAO followersDAO;

    @RequestMapping(value= "/logon" , method={ RequestMethod.POST})
    public String logon(HttpServletRequest request,
                             HttpServletResponse response, Model model){
        String email = request.getParameter("email");
        String secter = request.getParameter("secter");
        String mpage = request.getParameter("mymsgpage");
        String apage = request.getParameter("allmsgpage");
        System.out.println("Email : "+email+" secter : "+secter);
        if(authService.auth(new AuthBean(email, secter))) {
            request.getSession().setAttribute("user", email);
            return userService.redirectHomepage(email, model, mpage == null ? 1 : Integer.parseInt(mpage), apage == null ? 1 : Integer.parseInt(apage));
        } else {
            model.addAttribute("userstat", "Unauthorized");
            return "index";
        }
    }

    @RequestMapping(value= "/register" , method={ RequestMethod.POST})
    public String register(HttpServletRequest request,
                        HttpServletResponse response, Model model){
        String email = request.getParameter("email");
        String secter = request.getParameter("secter");
        String name = request.getParameter("name");
        String mpage = request.getParameter("mymsgpage");
        String apage = request.getParameter("allmsgpage");

        System.out.println("Email : "+email+" secter : "+secter+" name : "+name);

        userService.createUser(new MessageUser(email,secter, name));

        request.getSession().setAttribute("user", email);
        return userService.redirectHomepage(email, model, mpage == null ? 1 : Integer.parseInt(mpage), apage == null ? 1 : Integer.parseInt(apage));
    }

    @RequestMapping(value= "/searchusertofollow" , method={ RequestMethod.GET})
    @ResponseBody
    public String searchusertofollow(HttpServletRequest request,
                         HttpServletResponse response){
        String suser = request.getParameter("suser");

        System.out.println("Search user - "+suser);
        return userService.fetchuser(suser);
    }

    @RequestMapping(value= "/savefollower" , method={ RequestMethod.POST})
    @ResponseBody
    public String savefollower(HttpServletRequest request,
                                     HttpServletResponse response){
        String suser = request.getParameter("suser");

        System.out.println("Follow user - "+suser);
        followersDAO.insertFollower(new Followers(request.getSession().getAttribute("user").toString(), suser));
        return "success";
    }

    @RequestMapping(value= "/logout" , method={ RequestMethod.GET})
    public String logout(HttpServletRequest request,
                           HttpServletResponse response, Model model){
        request.getSession().invalidate();
        model.addAttribute("userstat", "Thanks for using Post Message!");
        return "index";
    }
}
