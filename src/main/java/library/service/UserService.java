package library.service;


import library.entity.User;
import library.until.Msg;

import java.util.List;

public interface UserService {
    /**
     * 注册用户
     * @param userName
     * @param password
     * @return
     */
    Msg insertUser(String userName, String password);

    /**
     * 登录用户
     * @param userName
     * @param password
     * @return
     */
    Boolean selectUser(String userName,String password);

    /**
     * 更新用户
     * @param userId
     * @param userName
     * @param password
     * @param image
     * @param address
     * @return
     */
    Msg updateUser(Integer userId,String userName,String password,String image,String address);

    /**
     * 查询所有用户
     * @return
     */
    List<User> selectAllUser();

    /**
     * 查询自己详细信息
     * @param userName
     * @return
     */
    User selectOneUser(String userName);

    /**
     * 删除用户
     * @param userName
     * @return
     */
    Msg deleteUser(String userName);

    /**
     * 充值vip
     * @param userName
     * @return
     */
    Msg rechargeVip(String userName);

    /**
     * 充值
     * @param userName
     * @param money
     * @return
     */
    String rechargeMoney(String userName,Double money);

    /**
     * 更新或增加用户
     * @param userId
     * @param userName
     * @param password
     * @param vip
     * @param money
     * @param address
     * @return
     */
    Msg updateAndInsert(Integer userId,String userName,String password,String vip,Double money,String address);


}
