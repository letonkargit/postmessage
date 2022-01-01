package com.messages.dao;

import com.messages.beans.db.Followers;
import com.messages.beans.db.MessageUser;
import com.messages.beans.db.Messages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class MessageDAO {
    @Autowired
    MongoTemplate mongoTemplate;

    public void insertMessage(Messages messages){
        mongoTemplate.insert(messages, "messages");
    }

    public List<Messages> getMyMessages(String email, int page){
        Query query = new Query();
        query.addCriteria(Criteria.where("email").is(email));
        query.with(Sort.by(Sort.Direction.DESC, "date"));
        query.limit(5).skip(5*(page-1));
        return mongoTemplate.find(query, Messages.class, "messages");
    }

    public List<Messages> getAllMessages(String email, int page){
        Query query1 = new Query();
        query1.addCriteria(Criteria.where("follower_email").is(email));
        query1.fields().include("email").exclude("_id");
        List<Followers> followingMsg = mongoTemplate.find(query1, Followers.class, "message_followers");
        List<String> following = new ArrayList<>();
        for(Followers f : followingMsg){
            following.add(f.getEmail());
        }
        System.out.println("following -- "+following);

        Query query = new Query();
        query.addCriteria(Criteria.where("email").in(following));
        query.with(Sort.by(Sort.Direction.DESC, "date"));
        query.limit(5).skip(5*(page-1));
        return mongoTemplate.find(query, Messages.class, "messages");
    }

    public long getMessagesCount(String email){
        Query query = new Query();
        query.addCriteria(Criteria.where("email").is(email));
        return mongoTemplate.count(query, "messages");
    }
}
