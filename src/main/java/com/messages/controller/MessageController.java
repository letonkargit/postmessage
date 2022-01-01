package com.messages.controller;

import com.messages.beans.db.Messages;
import com.messages.dao.MessageDAO;
import com.messages.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

@Controller
public class MessageController {
    @Autowired UserService userService;
    @Autowired MessageDAO messageDAO;

    @RequestMapping(value= "/postmsg" , method={ RequestMethod.POST})
    public String postmsg(HttpServletRequest request,
                         HttpServletResponse response, Model model){
        String messagepost = request.getParameter("messagepost");
        String mpage = request.getParameter("mymsgpage");
        String apage = request.getParameter("allmsgpage");
        String user = request.getSession().getAttribute("user").toString();

        messageDAO.insertMessage(new Messages(messagepost, user, new Date()));

        System.out.println("messagepost : "+messagepost);
        System.out.println("Sent from session - "+request.getSession().getId());

        model.addAttribute("msgstat", "posted");
        return userService.redirectHomepage(user, model, mpage == null ? 1 : Integer.parseInt(mpage), apage == null ? 1 : Integer.parseInt(apage));
    }

    @RequestMapping(value= "/getnextmy" , method={ RequestMethod.GET})
    public String getnextmy(HttpServletRequest request,
                          HttpServletResponse response, Model model){

        String mpage = request.getParameter("mymsgpage");
        System.out.println("Value from form, mpage - "+mpage);
        String apage = request.getParameter("allmsgpage");
        System.out.println("Value from form, mpage - "+apage);
        String user = request.getSession().getAttribute("user").toString();

        return userService.redirectHomepage(user, model, mpage == null ? 1 : Integer.parseInt(mpage)+1, apage == null ? 1 : Integer.parseInt(apage));
    }

    @RequestMapping(value= "/getprevmy" , method={ RequestMethod.GET})
    public String getprevmy(HttpServletRequest request,
                          HttpServletResponse response, Model model){

        String mpage = request.getParameter("mymsgpage");
        System.out.println("Value from form, mpage - "+mpage);
        String apage = request.getParameter("allmsgpage");
        System.out.println("Value from form, mpage - "+apage);
        String user = request.getSession().getAttribute("user").toString();

        return userService.redirectHomepage(user, model, mpage == null ? 1 : Integer.parseInt(mpage)-1, apage == null ? 1 : Integer.parseInt(apage));
    }

    @RequestMapping(value= "/getnextall" , method={ RequestMethod.GET})
    public String getnextall(HttpServletRequest request,
                             HttpServletResponse response, Model model){

        String mpage = request.getParameter("mymsgpage");
        System.out.println("Value from form, mpage - "+mpage);
        String apage = request.getParameter("allmsgpage");
        System.out.println("Value from form, mpage - "+apage);
        String user = request.getSession().getAttribute("user").toString();

        return userService.redirectHomepage(user, model, mpage == null ? 1 : Integer.parseInt(mpage), apage == null ? 1 : Integer.parseInt(apage)+1);
    }

    @RequestMapping(value= "/getprevall" , method={ RequestMethod.GET})
    public String getprevall(HttpServletRequest request,
                             HttpServletResponse response, Model model){

        String mpage = request.getParameter("mymsgpage");
        System.out.println("Value from form, mpage - "+mpage);
        String apage = request.getParameter("allmsgpage");
        System.out.println("Value from form, mpage - "+apage);
        String user = request.getSession().getAttribute("user").toString();

        return userService.redirectHomepage(user, model, mpage == null ? 1 : Integer.parseInt(mpage), apage == null ? 1 : Integer.parseInt(apage)-1);
    }
}
