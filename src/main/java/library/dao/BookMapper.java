package library.dao;

import library.entity.Book;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookMapper {
    List<Book> selectByName(String bookName);
    List<Book> selectBySort(@Param("sort") String sort);
    void BorrowBook(@Param("number")Integer number,
                    @Param("bookId") Integer bookId);
    Book selectById(Integer bookId);
    Book selectOneBook(String bookName);

    void updateBook(Book book);

    void insertBook(Book book);

    Book selectBybookName(String bookName);

    void deleteBook(Integer bookId);

    Book selectMax();
}
