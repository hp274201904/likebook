package library.test;


import library.dao.BookMapper;
import library.dao.IndentMapper;
import library.dao.JournalMapper;
import library.dao.UserMapper;
import library.entity.Book;
import library.entity.Indent;
import library.entity.Journal;
import library.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:ApplicationContext.xml")
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
        bookMapper.insertBook(new Book(13,"原则","temporary/bookimage/原则.jpg","理论与实践的统一，是马克思主义的一个最基本的原则",20,99.0,"教育"));
    }
}
