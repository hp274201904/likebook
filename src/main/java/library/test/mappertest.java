package library.test;


import jdk.management.resource.ResourceType;
import library.dao.*;
import library.entity.Book;
import library.entity.Journal;
import library.entity.User;
import library.entity.UserTime;
import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value="classpath:ApplicationContext.xml")
public class mappertest {
    @Autowired
    BookMapper bookMapper;
    @Autowired
    IndentMapper indentMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    JournalMapper journalMapper;
    @Autowired
    UserTimeMapper userTimeMapper;

    @Test
    public void test3(){
//       UserTime userTime=new UserTime(null,null,null);
//       if (userTime.getGetVipTime()==null){
//           System.out.println("qwer");
//       }
        UserTime userTime = userTimeMapper.selectByUserId(1);
    }
}
