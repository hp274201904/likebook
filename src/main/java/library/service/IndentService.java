package library.service;


import library.entity.Indent;
import library.until.Msg;

import java.util.List;

public interface IndentService {
    /**
     * 订阅
     * @param userName
     * @param bookName
     * @param message
     * @param address
     * @return
     */
    Msg insertIndent(String userName, String bookName, String message, String address);

    /**
     * 处理订阅
     * @param userName
     * @param bookName
     * @return
     */
    Msg updateIndent(String userName,String bookName);

    /**
     * 查询所有订阅
     * @return
     */
    List<Indent> selectIndent();

    /**
     * 查询自己的订阅
     * @param userName
     * @return
     */
    List<Indent> selectMyIndent(String userName);

    /**
     * 查询所有未处理的订单
     * @return
     */
    List<Indent> selectnotIndent();

    Msg handleIndent(String userName,String bookName);

    /**
     * 删除用户记录
     * @param userName
     */
    void deleteByUser(String userName);
}
