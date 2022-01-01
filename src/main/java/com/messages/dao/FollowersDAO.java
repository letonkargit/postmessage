package com.messages.dao;

import com.messages.beans.db.Followers;
import com.messages.beans.db.MessageUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

@Component
public class FollowersDAO {
    @Autowired MongoTemplate mongoTemplate;

    public void insertFollower(Followers followers){
        mongoTemplate.insert(followers, "message_followers");
    }
}
