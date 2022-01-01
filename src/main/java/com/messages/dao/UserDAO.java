package com.messages.dao;

import com.messages.beans.db.MessageUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Component;

@Component
public class UserDAO {
    @Autowired MongoTemplate mongoTemplate;

    public void insertMessageUser(MessageUser messageUser){
        mongoTemplate.insert(messageUser, "message_user");
    }

    public MessageUser authUser(String email, String secter){
        Query query = new Query();
        query.addCriteria(Criteria.where("email").is(email));
        query.addCriteria(Criteria.where("secter").is(secter));
        return mongoTemplate.findOne(query, MessageUser.class, "message_user");
    }

    public MessageUser findUser(String email){
        Query query = new Query();
        query.addCriteria(Criteria.where("email").is(email));
        return mongoTemplate.findOne(query, MessageUser.class, "message_user");
    }

    public String fetchuser(String suser) {
        Query query = new Query();
        query.addCriteria(Criteria.where("email").is(suser));
        MessageUser messageUser = mongoTemplate.findOne(query, MessageUser.class, "message_user");
        return messageUser == null ? null : messageUser.getEmail();
    }
}
