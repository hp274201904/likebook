package library.test;

import library.dao.UserMapper;
import library.entity.Book;
import library.entity.Indent;
import library.entity.Journal;
import library.entity.User;
import library.service.BookService;
import library.service.IndentService;
import library.service.JournalService;
import library.service.UserService;
import library.until.Msg;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:ApplicationContext.xml")
public class servicetest {
    @Autowired
    BookService bookService;
    @Autowired
    UserService userService;
    @Autowired
    JournalService journalService;
    @Autowired
    IndentService indentService;
    @Test
    public void test() {
        List<Book> books = journalService.selectPopularBook();
        for (Book book:books){
            System.out.println(book);
        }
    }
}
