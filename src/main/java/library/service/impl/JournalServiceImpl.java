package library.service.impl;

import library.dao.BookMapper;
import library.dao.JournalMapper;
import library.dao.UserMapper;
import library.entity.Book;
import library.entity.Journal;
import library.entity.User;
import library.service.JournalService;
import library.until.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JournalServiceImpl implements JournalService {
    @Autowired
    JournalMapper journalMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    BookMapper bookMapper;

    @Override
    public List<Journal> selectAllJournal() {
        List<Journal> journals = journalMapper.selectAllJournal();
        return journals;
    }

    @Override
    public List<Journal> selectJournal(String userName) {
        List<Journal> journals = journalMapper.selecyJournal(userName);
        return journals;
    }

    @Override
    public Msg borrowToBuy(String userName, Integer userBookId, Integer bookId, String returnBook, String buyBook) {
        Msg msg=new Msg();
        User user = userMapper.selectbyName(userName);
        Book book = bookMapper.selectById(bookId);
        if("是".equals(user.getVip())){
            if ("已借阅".equals(returnBook)&&"未购买".equals(buyBook)){
                userMapper.updateUserByName(user.getVip(),user.getMoney()+5+book.getMoney()*0.2,user.getUserName());
                userMapper.updateBookId(userBookId,userName);
                journalMapper.updateJournal(userName,null,bookId);
                msg.setCode(1);
                msg.setMessage("购买成功！");
                return msg;
            }else{
                if (user.getMoney()<book.getMoney()*0.8){
                    msg.setCode(-1);
                    msg.setMessage("余额不足，请尽快充值！");
                    return msg;
                }else {
                    userMapper.updateUserByName(user.getVip(),user.getMoney()-book.getMoney()*0.8,userName);
                    journalMapper.insertJournal(new Journal(userName,null,bookId,book.getBookName(),returnBook,buyBook));
                    msg.setCode(1);
                    msg.setMessage("购买成功！");
                    return msg;
                }
            }
        }else {
            if ("已借阅".equals(returnBook)&&"未购买".equals(buyBook)){
                userMapper.updateUserByName(user.getVip(),user.getMoney()+5,user.getUserName());
                userMapper.updateBookId(userBookId,userName);
                journalMapper.updateJournal(userName,userBookId,bookId);
                msg.setCode(1);
                msg.setMessage("购买成功！");
                return msg;
            }else{
                if (user.getMoney()<book.getMoney()){
                    msg.setCode(-1);
                    msg.setMessage("余额不足，请尽快充值！");
                    return msg;
                }else {
                    userMapper.updateUserByName(user.getVip(),user.getMoney()-book.getMoney(),userName);
                    journalMapper.insertJournal(new Journal(userName,null,bookId,book.getBookName(),returnBook,buyBook));
                    msg.setCode(1);
                    msg.setMessage("购买成功！");
                    return msg;
                }
            }
        }
    }

    @Override
    public List<Journal> selectMyBuyJo(String userName) {
        List<Journal> journals = journalMapper.selectMyBuyJo(userName);
        return journals;
    }


    @Override
    public List<Journal> selectMyBorrowJo(String userName) {
        List<Journal> journals = journalMapper.selectMyBorrowJo(userName);
        return journals;
    }

    @Override
    public List<Journal> selectBuyJo() {
        List<Journal> journals = journalMapper.selectMyBuyJo(null);
        return journals;
    }

    @Override
    public List<Journal> selectBorrowJo() {
        List<Journal> journals = journalMapper.selectMyBorrowJo(null);
        return journals;
    }

    @Override
    public void deleteByUser(String userName) {
        journalMapper.deleteByuser(userName);
    }
}
