package library.dao;

import library.entity.Journal;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JournalMapper {
    void insertJournal(Journal journal);
    void deleteJournal(@Param("userName") String userName,
                       @Param("userBookId") Integer userBookId,
                       @Param("bookId")Integer bookId);

    List<Journal> selectAllJournal();

    List<Journal> selecyJournal(String userName);

    void updateJournal(@Param("userName") String userName,
                       @Param("userBookId") Integer userBookId,
                       @Param("bookId") Integer bookId);

    List<Journal> selectMyBuyJo(@Param("userName")String userName);

    List<Journal> selectMyBorrowJo(@Param("userName")String userName);

    List<Journal> selectdeletBook(Integer bookId);

    void deleteByuser(String userName);

}
