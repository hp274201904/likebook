package library.service;

import library.entity.Book;
import library.entity.Journal;
import library.until.Msg;

import java.util.List;

public interface JournalService {
    /**
     * 查询所有记录
     * @return
     */
    List<Journal> selectAllJournal();

    /**
     * 查询用户的记录
     * @param userName
     * @return
     */
    List<Journal> selectJournal(String userName);

    /**
     * 借了再买
     * @param userName
     * @param userBookId
     * @param bookId
     * @param returnBook
     * @param buyBook
     */
    Msg borrowToBuy(String userName, Integer userBookId, Integer bookId, String returnBook, String buyBook);

    /**
     * 查询自己的购买记录
     * @param userName
     * @return
     */
    List<Journal> selectMyBuyJo(String userName);

    /**
     * 查询自己的借阅记录
     * @param userName
     * @return
     */
    List<Journal> selectMyBorrowJo(String userName);

    /**
     * 查询自己的购买记录
     * @return
     */
    List<Journal> selectBuyJo();

    /**
     * 查询自己的借阅记录
     * @return
     */
    List<Journal> selectBorrowJo();

    /**
     * 删除用户记录
     * @param userName
     */
    void deleteByUser(String userName);

    /**
     * 查询出热销书籍
     * @return
     */
    List<Book> selectPopularBook();

    List<Book> selectPopularBBook();
}
