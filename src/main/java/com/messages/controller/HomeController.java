package com.messages.controller;

import com.messages.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class HomeController {
    @Autowired UserService userService;

    @RequestMapping(value= {"/home","/" }, method={ RequestMethod.POST, RequestMethod.GET})
    public String home(HttpServletRequest request,
                       HttpServletResponse response, Model model){
        String user = (String)request.getSession().getAttribute("user");
        String mpage = request.getParameter("mymsgpage");
        String apage = request.getParameter("allmsgpage");
        System.out.println("User logged on --- "+user);
        if(user != null){
            return userService.redirectHomepage(user, model, mpage == null ? 1 : Integer.parseInt(mpage), apage == null ? 1 : Integer.parseInt(apage));
        } else {
            return "index";
        }
    }
}
