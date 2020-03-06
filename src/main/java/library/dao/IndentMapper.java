package library.dao;


import library.entity.Indent;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IndentMapper {
    void insertIndent(Indent indent);

    void updateIndent(@Param("complete") String complete,
                      @Param("userName") String userName,
                      @Param("bookName") String bookName);

    Indent selectIndentByIdAndName(@Param("userName") String userName,
                                   @Param("bookName") String bookName);
    List<Indent> selectIndent();

    List<Indent> selectMyIndent(String userName);

    List<Indent> selectnotIndent();

    void handleIndent(@Param("userName")String userName,
                      @Param("bookName")String bookName);
}
