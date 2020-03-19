package library.service;

import library.entity.Book;
import library.until.Msg;

import java.util.List;

public interface BookService {
    /**
     * 分类查询书籍
     * @param sort
     * @return
     */
    List<Book> selectBook(String sort);

    /**
     * 查询书籍
     * @param bookName
     * @return
     */
    List<Book> selectBookByName(String bookName);

    /**
     * 借阅书籍
     * @param bookId
     * @return
     */
    Msg BorrowBook(Integer bookId,String userName);

    /**
     * 归还书籍
     * @param userName
     * @return
     */
    Msg returnBook(String userName,Integer bookId);

    /**
     * 购买书籍
     * @param userName
     * @param bookId
     * @return
     */
    Msg buyBook(String userName, Integer bookId);

    /**
     * 查询一本书
     * @param bookName
     * @return
     */
    Book selectOneBook(String bookName);

    /**
     * 更新书籍
     *
     */
    Msg updateAndInsertBook(Integer bookId,String bookName,String image,String bookMessage,Double money,Integer number,String sort);

    /**
     * 插入数据
     *
     */
    Msg updateBook(Integer bookId,String bookName,String bookMessage,Double money,Integer number,String sort);

    /**
     * 删除书籍
     * @param bookId
     * @return
     */
    Msg deleteBook(Integer bookId);

    /**
     * 查询最大的书号的书
     * @return
     */
    Book selectMax();

    /**
     * 查询最新书籍
     * @return
     */
    List<Book> selectnowBook();
}
