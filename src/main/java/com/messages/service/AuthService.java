package com.messages.service;

import com.messages.beans.AuthBean;
import com.messages.beans.db.MessageUser;
import com.messages.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AuthService {
    @Autowired UserDAO userDAO;

    public boolean auth(AuthBean authBean){
        MessageUser messageUser = userDAO.authUser(authBean.getEmail(), authBean.getSecter());
        if(messageUser != null){
            return true;
        }
        return false;
    }
}
