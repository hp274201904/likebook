package library.dao;

import library.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import sun.security.util.Password;

import java.net.ServerSocket;
import java.util.List;

@Repository
public interface UserMapper {

    User selectbyName(String userName);

    void insertUser(@Param("userId")Integer userId,
                    @Param("userName") String userName,
                    @Param("password") String password,
                    @Param("image")String image,
                    @Param("money")Double money,
                    @Param("vip")String vip,
                    @Param("address")String address);

    void insertUser2(@Param("userName") String userName,
                    @Param("password") String password,
                    @Param("image")String image,
                    @Param("money")Double money,
                    @Param("vip")String vip,
                    @Param("address")String address);

    User selectByNameAndPD(@Param("userName")String userName,
                           @Param("password")String password);

    void updateUser(@Param("userId")Integer userId,
                    @Param("userName")String userName,
                    @Param("password")String password,
                    @Param("image")String image,
                    @Param("address")String address);

    void updateUserByAll(@Param("userId")Integer userId,
                    @Param("userName")String userName,
                    @Param("password")String password,
                    @Param("image")String image,
                    @Param("address")String address,
                    @Param("vip")String vip,
                    @Param("money")Double money);

    List<User> selectUser();

    void deleteUser(String userName);

    void updateUserByName(@Param("vip")String vip,
                          @Param("money")Double money,
                          @Param("userName") String userName
                         );
    void updateBookIdByName(@Param("bookId1")Integer bookId1,
                            @Param("bookId2")Integer bookId2,
                            @Param("bookId3")Integer bookId3,
                            @Param("bookId4")Integer bookId4,
                            @Param("bookId5")Integer bookId5,
                            @Param("userName")String userName);

    void updateBookId(@Param("i")Integer i,
                      @Param("userName")String userName);

    User selectUserById(Integer userId);

    User selectMax();

}
