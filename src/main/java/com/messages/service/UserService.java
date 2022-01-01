package com.messages.service;

import com.messages.beans.User;
import com.messages.beans.db.MessageUser;
import com.messages.dao.MessageDAO;
import com.messages.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
public class UserService {
    @Autowired UserDAO userDAO;
    @Autowired MessageDAO messageDAO;

    public User getUInfo(String user){
        MessageUser messageUser = userDAO.findUser(user);
        User user1 = new User(messageUser.getName(), user, "Try it out bro!");
        return user1;
    }

    public void createUser(MessageUser messageUser){
         userDAO.insertMessageUser(messageUser);
    }

    public String redirectHomepage(String user, Model model, int mpage, int apage){
        model.addAttribute("userinfo", getUInfo(user));
        System.out.println("Mypages -"+mpage+" Allpages -"+apage);

        long endofmymsgs = getcountOfMyMsgs(user);
        mpage = (mpage * 5 ) == endofmymsgs || ((mpage-1)*5) > (endofmymsgs-endofmymsgs%5) ? --mpage : mpage;
        model.addAttribute("mymessages", messageDAO.getMyMessages(user,  mpage));
        model.addAttribute("endofmymsgs", (mpage * 5 ) == endofmymsgs || endofmymsgs < mpage * 5 ? "no" : "mid");
        model.addAttribute("mymsgpage", mpage);

        long endofallmsgs = getcountOfAllMsgs(user);
        apage = (apage * 5 ) == endofallmsgs || ((apage-1)*5) > (endofallmsgs-endofallmsgs%5) ? --apage : apage;
        model.addAttribute("allmessages", messageDAO.getAllMessages(user, apage));
        model.addAttribute("endofallmsgs",(apage * 5 ) == endofallmsgs || endofallmsgs < apage * 5 ? "no" : "mid");
        model.addAttribute("allmsgpage", apage);

        return "userhome";
    }

    private long getcountOfMyMsgs(String email) {
        return messageDAO.getMessagesCount(email);
    }

    private long getcountOfAllMsgs(String email) {
        return messageDAO.getMessagesCount(email);
    }

    public String fetchuser(String suser) {
        return userDAO.fetchuser(suser);
    }
}
