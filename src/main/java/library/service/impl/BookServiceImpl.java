package library.service.impl;

import library.dao.BookMapper;
import library.dao.JournalMapper;
import library.dao.UserMapper;
import library.entity.Book;
import library.entity.Journal;
import library.entity.User;
import library.service.BookService;
import library.until.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    BookMapper bookMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    JournalMapper journalMapper;
    @Override
    public List<Book> selectBook(String sort) {
        List<Book> books = bookMapper.selectBySort(sort);
        return books;
    }

    @Override
    public List<Book> selectBookByName(String bookName) {
        List<Book> books = bookMapper.selectByName(bookName);
        return books;
    }

    @Override
    public Msg BorrowBook(Integer bookId,String userName) {
        Msg msg=new Msg();
        Book book = bookMapper.selectById(bookId);
        User user = userMapper.selectbyName(userName);
        if (book.getNumber()<1){
            msg.setCode(-1);
            msg.setMessage("书籍暂时缺货！");
            return msg;
        }else if (user.getAddress().isEmpty()){
           msg.setCode(-1);
           msg.setMessage("没有收获地址，无法借阅书籍！");
           return msg;
        } else {
                if(user.getBookId1()==null){
                    if(user.getMoney()>=book.getMoney()+5){
                        userMapper.updateUserByName(user.getVip(),user.getMoney()-book.getMoney()-5,userName);
                        userMapper.updateBookIdByName(bookId,null,null,null,null,userName);
                        bookMapper.BorrowBook(book.getNumber()-1,bookId);
                        journalMapper.insertJournal(new Journal(user.getUserName(),1,bookId,book.getBookName(),"未购买","已借阅"));
                        msg.setCode(1);
                        msg.setMessage("借阅成功！");
                        return msg;
                    }else {
                        msg.setCode(-1);
                        msg.setMessage("余额不足，请尽快充充值！");
                        return msg;
                    }
                }else if (user.getBookId2()==null&&user.getBookId1()!=null){
                    if(user.getMoney()>=book.getMoney()+5){
                        userMapper.updateUserByName(user.getVip(),user.getMoney()-book.getMoney()-5,userName);
                        userMapper.updateBookIdByName(null,bookId,null,null,null,userName);
                        bookMapper.BorrowBook(book.getNumber()-1,bookId);
                        journalMapper.insertJournal(new Journal(user.getUserName(),2,bookId,book.getBookName(),"未购买","已借阅"));
                        msg.setCode(1);
                        msg.setMessage("借阅成功！");
                        return msg;
                    }else {
                        msg.setCode(-1);
                        msg.setMessage("余额不足，请尽快充充值！");
                        return msg;
                    }
                }else if (user.getBookId3()==null&&user.getBookId1()!=null&&user.getBookId2()!=null){
                    if(user.getMoney()>=book.getMoney()+5){
                        userMapper.updateUserByName(user.getVip(),user.getMoney()-book.getMoney()-5,userName);
                        userMapper.updateBookIdByName(null,null,bookId,null,null,userName);
                        bookMapper.BorrowBook(book.getNumber()-1,bookId);
                        journalMapper.insertJournal(new Journal(user.getUserName(),3,bookId,book.getBookName(),"未购买","已借阅"));
                        msg.setCode(1);
                        msg.setMessage("借阅成功！");
                        return msg;
                    }else {
                        msg.setCode(-1);
                        msg.setMessage("余额不足，请尽快充充值！");
                        return msg;
                    }
                }else if(user.getBookId4()==null&&user.getBookId1()!=null&&user.getBookId2()!=null&&user.getBookId3()!=null&&user.getVip().equals("是")){
                    if(user.getMoney()>=book.getMoney()+5){
                        userMapper.updateUserByName(user.getVip(),user.getMoney()-book.getMoney()-5,userName);
                        userMapper.updateBookIdByName(null,null,null,bookId,null,userName);
                        bookMapper.BorrowBook(book.getNumber()-1,bookId);
                        journalMapper.insertJournal(new Journal(user.getUserName(),4,bookId,book.getBookName(),"未购买","已借阅"));
                        msg.setCode(1);
                        msg.setMessage("借阅成功！");
                        return msg;
                    }else {
                        msg.setCode(-1);
                        msg.setMessage("余额不足，请尽快充充值！");
                        return msg;
                    }
                }else if(user.getBookId5()==null&&user.getBookId1()!=null&&user.getBookId2()!=null&&user.getBookId3()!=null&&user.getBookId4()!=null&&user.getVip().equals("是")){
                    if(user.getMoney()>=book.getMoney()+5){
                        userMapper.updateUserByName(user.getVip(),user.getMoney()-book.getMoney()-5,userName);
                        userMapper.updateBookIdByName(null,null,null,null,bookId,userName);
                        bookMapper.BorrowBook(book.getNumber()-1,bookId);
                        journalMapper.insertJournal(new Journal(user.getUserName(),5,bookId,book.getBookName(),"未购买","已借阅"));
                        msg.setCode(1);
                        msg.setMessage("借阅成功！");
                        return msg;
                    }else {
                        msg.setCode(-1);
                        msg.setMessage("余额不足，请尽快充充值！");
                        return msg;
                    }
                }else {
                    msg.setCode(-1);
                    msg.setMessage("已无法再次借阅书籍！");
                    return msg;
                }
        }
    }

    @Override
    public Msg returnBook(String userName,Integer bookId) {
        Msg msg=new Msg();
        User user = userMapper.selectbyName(userName);
        Book book = bookMapper.selectById(bookId);
        if(bookId.equals(user.getBookId5())){
            userMapper.updateUserByName(user.getVip(),user.getMoney()+book.getMoney(),userName);
            userMapper.updateBookId(5,userName);
            journalMapper.deleteJournal(userName,5,bookId);
            msg.setCode(1);
            msg.setMessage("还书成功！");
            return msg;
        }else if (bookId.equals(user.getBookId4())){
            userMapper.updateUserByName(user.getVip(),user.getMoney()+book.getMoney(),userName);
            userMapper.updateBookId(4,userName);
            journalMapper.deleteJournal(userName,4,bookId);
            msg.setCode(1);
            msg.setMessage("还书成功！");
            return msg;
        }else if (bookId.equals(user.getBookId3())){
            userMapper.updateUserByName(user.getVip(),user.getMoney()+book.getMoney(),userName);
            userMapper.updateBookId(3,userName);
            journalMapper.deleteJournal(userName,3,bookId);
            msg.setCode(1);
            msg.setMessage("还书成功！");
            return msg;
        } else if (bookId.equals(user.getBookId2())){
            userMapper.updateUserByName(user.getVip(),user.getMoney()+book.getMoney(),userName);
            userMapper.updateBookId(2,userName);
            journalMapper.deleteJournal(userName,2,bookId);
            msg.setCode(1);
            msg.setMessage("还书成功！");
            return msg;
        } else if (bookId.equals(user.getBookId1())){
            userMapper.updateUserByName(user.getVip(),user.getMoney()+book.getMoney(),userName);
            userMapper.updateBookId(1,userName);
            journalMapper.deleteJournal(userName,1,bookId);
            msg.setCode(1);
            msg.setMessage("还书成功！");
            return msg;
        }  else {
            msg.setCode(1);
            msg.setMessage("还书失败！");
            return msg;
        }
    }

    @Override
    public Msg buyBook(String userName, Integer bookId) {
        User user = userMapper.selectbyName(userName);
        Book book = bookMapper.selectById(bookId);
        Msg msg=new Msg();
        if (book.getNumber()<1){
            msg.setCode(-1);
            msg.setMessage( "暂无存货，购买失败！");
            return msg;
        }else if (user.getAddress().isEmpty()){
            msg.setCode(-1);
            msg.setMessage("没有收货地址，无法购买书籍！");
            return msg;
        }else {
            if ("否".equals(user.getVip())){
                if (user.getMoney()<book.getMoney()){
                    msg.setCode(-1);
                    msg.setMessage( "金额不足，购买失败！");
                    return msg;
                }else {
                    userMapper.updateUserByName(user.getVip(),user.getMoney()-book.getMoney(),userName);
                    bookMapper.BorrowBook(book.getNumber()-1,book.getBooKId());
                    journalMapper.insertJournal(new Journal(userName,null,bookId,book.getBookName(),"已购买","未借阅"));
                    msg.setCode(1);
                    msg.setMessage( "购买成功！");
                    return msg;
                }
            }else {
                if (user.getMoney()<book.getMoney()*0.8){
                    msg.setCode(-1);
                    msg.setMessage( "金额不足，购买失败！");
                    return msg;
                }else {
                    userMapper.updateUserByName(user.getVip(),user.getMoney()-(book.getMoney()*0.8),userName);
                    bookMapper.BorrowBook(book.getNumber()-1,book.getBooKId());
                    journalMapper.insertJournal(new Journal(userName,null,bookId,book.getBookName(),"已购买","未借阅"));
                    msg.setCode(1);
                    msg.setMessage( "购买成功！");
                    return msg;
                }
            }
        }
    }

    @Override
    public Book selectOneBook(String bookName) {
        Book book = bookMapper.selectOneBook(bookName);
        return book;
    }

    @Override
    public Msg updateAndInsertBook(Integer bookId,String bookName,String image,String bookMessage,Double money,Integer number,String sort) {
        Msg msg=new Msg();
        if(money==null||number==null ||bookName.isEmpty()||bookMessage.isEmpty()||sort.isEmpty()){
            msg.setCode(-1);
            msg.setMessage("输入的数据不完整，请重新输入！");
            return msg;
        }else {
            Book book1 = bookMapper.selectById(bookId);
            if (book1!=null){
                bookMapper.updateBook(new Book(bookId,bookName,image,bookMessage,number,money,sort));
                msg.setCode(1);
                msg.setMessage("更新成功！");
                return msg;
            }else {
                Book book2 = bookMapper.selectBybookName(bookName);
                if (book2!=null){
                msg.setCode(-1);
                msg.setMessage("已经有了此书，请勿重复新增此书！");
                return msg;
                 }else {
                    bookMapper.insertBook(new Book(bookId,bookName,image,bookMessage,number,money,sort));
                    msg.setCode(1);
                    msg.setMessage("新增书籍成功！");
                    return msg;
                }
            }
        }
    }

    @Override
    public Msg updateBook(Integer bookId,String bookName,String bookMessage,Double money,Integer number,String sort) {
        Msg msg=new Msg();
        if(money==null||number==null ||bookName.isEmpty()||bookMessage.isEmpty()||sort.isEmpty()){
            msg.setCode(-1);
            msg.setMessage("输入的数据不完整，请重新输入！");
            return msg;
        }else {
            Book book1 = bookMapper.selectById(bookId);
            if (book1==null){
                msg.setCode(-1);
                msg.setMessage("输入的数据不完整，请重新输入！");
                return msg;
                }
            else {
                bookMapper.updateBook(new Book(bookId,bookName,null,bookMessage,number,money,sort));
                msg.setCode(1);
                msg.setMessage("更新书籍成功！");
                return msg;
            }
        }
    }

    @Override
    public Msg deleteBook(Integer bookId) {
        Msg msg=new Msg();
        List<Journal> journals = journalMapper.selectdeletBook(bookId);
        if (journals.size()!=0){
            msg.setCode(-1);
            msg.setMessage("还有用户在借阅此书，无法删除！");
            return msg;
        }else {
            bookMapper.deleteBook(bookId);
            msg.setCode(1);
            msg.setMessage("删除成功！");
            return msg;
        }
    }

    @Override
    public Book selectMax() {
        Book book = bookMapper.selectMax();
        return book;
    }

    @Override
    public List<Book> selectnowBook() {
        List<Book> books = bookMapper.selectnowBook();
        int i=1;
        for (Book book:books){
            book.setBookMessage("更新榜第"+i+"名");
            i++;
        }
        return books;
    }
}
