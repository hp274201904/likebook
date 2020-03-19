package library.dao;

import library.entity.Indent;
import library.entity.UserTime;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserTimeMapper {

    void insertTime(UserTime UserTime);

    List<UserTime> selectall();

    void updateuserTime(Integer userId);

    void updateUserName(@Param("userId")Integer userId,
                        @Param("userName")String userName);

    UserTime selectByUserId(Integer userId);

    void updateTime(Integer userId);
}
