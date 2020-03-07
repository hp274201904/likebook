package library.test;


import library.dao.BookMapper;
import library.dao.IndentMapper;
import library.dao.JournalMapper;
import library.dao.UserMapper;
import library.entity.Book;
import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



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

    @Test
    public void test3(){
        Book book = bookMapper.selectBybookName("1");
        System.out.println(book);
    }
}
