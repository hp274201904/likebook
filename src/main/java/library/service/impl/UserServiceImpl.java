package library.service.impl;

import library.dao.IndentMapper;
import library.dao.JournalMapper;
import library.dao.UserMapper;
import library.dao.UserTimeMapper;
import library.entity.Indent;
import library.entity.Journal;
import library.entity.User;
import library.entity.UserTime;
import library.service.IndentService;
import library.service.JournalService;
import library.service.UserService;
import library.until.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.lang.reflect.Member;
import java.util.Date;
import java.util.List;

@Service
@Component
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    IndentMapper indentMapper;
    @Autowired
    JournalMapper journalMapper;
    @Autowired
    UserTimeMapper userTimeMapper;
    @Autowired
    JournalService journalService;
    @Autowired
    IndentService indentService;


    @Override
    public Msg insertUser(String userName, String password) {
        Msg msg=new Msg();
        if(userName.isEmpty()||password.isEmpty()){
            msg.setCode(-1);
            msg.setMessage("请完整输入！");
            return msg;
        }else {
            User user = userMapper.selectbyName(userName);
            if (user!=null){
                msg.setCode(-1);
                msg.setMessage("用户名重复请重新命名！");
                return msg;
            }else {
                String image="/userimage/男.jpeg";
                userMapper.insertUser2(userName,password,image,0.0,"否","");
                msg.setCode(1);
                msg.setMessage("注册成功！");
                return msg;
            }
        }
    }

    @Override
    public Boolean selectUser(String userName, String password) {
        if (userName==null||password==null){
            return false;
        }else {
            User user = userMapper.selectbyName(userName);
            if (user==null){
                return false;
            }else {
                if (user.getPassword().equals(password)){
                    return true;
                }else {
                    return false;
                }
            }
        }
    }

    @Override
    public Msg updateUser(Integer userId,String userName, String password, String image, String address) {
        Msg msg=new Msg();
        if(userId==null||userName.isEmpty()||password.isEmpty()){
            msg.setCode(-1);
            msg.setMessage("输入的数据有误，请重新输入！");
            return msg;
        }else {
            User user = userMapper.selectUserById(userId);
            userMapper.updateUser(userId,userName,password,image,address);
            String beforeName = user.getUserName();
            if (!userName.equals(beforeName)){
                indentMapper.updateUserName(beforeName,userName);
                journalMapper.updateUserName(beforeName,userName);
            }
            UserTime userTime = userTimeMapper.selectByUserId(userId);
            if (userTime!=null){
                userTimeMapper.updateUserName(userId,userName);
            }
            msg.setCode(-1);
            msg.setMessage("更新成功！");
            return msg;
        }
    }

    @Override
    public List<User> selectAllUser() {
        List<User> users = userMapper.selectUser();
        return users;
    }

    @Override
    public User selectOneUser(String userName) {
        User user = userMapper.selectbyName(userName);
        return user;
    }

    @Override
    public Msg deleteUser(String userName) {
        Msg msg=new Msg();
        User user = userMapper.selectbyName(userName);
        if (user==null){
            msg.setCode(-1);
            msg.setMessage( "删除的用户不存在！");
            return msg;
        }else {
            if (userName.equals("admin")){
                msg.setCode(-1);
                msg.setMessage( "无法删除管理员！");
                return msg;
            }else {
                userMapper.deleteUser(userName);
                journalService.deleteByUser(userName);
                indentService.deleteByUser(userName);
                msg.setCode(1);
                msg.setMessage( "删除成功！");
                return msg;
            }
        }
    }

    @Override
    public Msg rechargeVip(String userName) {
        User user = userMapper.selectbyName(userName);
        Msg msg=new Msg();
        if(user.getMoney()<30){
            msg.setCode(-1);
            msg.setMessage("余额不足,请尽快充值！");
            return msg;
        }else if("是".equals(user.getVip())){
            msg.setCode(-1);
            msg.setMessage("你已是VIP，不需充值！");
            return msg;
        }else {
            Double money=user.getMoney()-30.0;
             String vip="是";
             userMapper.updateUserByName(vip,money,userName);
            UserTime userTime = userTimeMapper.selectByUserId(user.getUserId());
            if (userTime==null){
                userTimeMapper.insertTime(new UserTime(user.getUserId(),user.getUserName(),new Date()));
            }else {
                userTimeMapper.updateTime(user.getUserId());
            }
            msg.setCode(-1);
            msg.setMessage("你已是尊贵的vip用户了！");
             return msg;
        }
    }

    @Override
    public String rechargeMoney(String userName, Double money) {
        User user = userMapper.selectbyName(userName);
        Double money1=user.getMoney()+money;
        userMapper.updateUserByName(user.getVip(),money1,userName);
        return "充值成功!";
    }

    @Override
    public Msg updateAndInsert(Integer userId,String userName, String password, String vip, Double money, String address) {
        Msg msg=new Msg();
        if (userName.isEmpty()||password.isEmpty()||money<0||!"是".equals(vip)&&!"否".equals(vip)){
            msg.setCode(-1);
            msg.setMessage("输入数据有误请重新输入!");
            return msg;
        }else if (userId==1){
            msg.setCode(-1);
            msg.setMessage("管理员数据无法修改!");
            return msg;
        }
        else {
            User user = userMapper.selectUserById(userId);
            if (user==null){
                User user1 = userMapper.selectbyName(userName);
                if (user1!=null){
                    msg.setCode(-1);
                    msg.setMessage("该用户名已存在，请从新输入！");
                    return msg;
                }else {
                    userMapper.insertUser(userId,userName,password,"/userimage/男.jpeg",money,vip,address);
                    if ("是".equals(vip)){
                        userTimeMapper.insertTime(new UserTime(userId,userName,new Date()));
                    }
                    msg.setCode(1);
                    msg.setMessage("增加用户成功！");
                    return msg;
                }
            }else {
                    String beforeName = user.getUserName();
                    userMapper.updateUserByAll(userId,userName,password,user.getImage(),address,vip,money);
                    UserTime userTime = userTimeMapper.selectByUserId(userId);
                    if ("是".equals(vip)&&"否".equals(user.getVip())){
                        if (userTime==null){
                            userTimeMapper.insertTime(new UserTime(userId,userName,new Date()));
                        }else {
                            userTimeMapper.updateTime(userId);
                        }
                    }
                    if (!userName.equals(beforeName)){
                        indentMapper.updateUserName(beforeName,userName);
                        journalMapper.updateUserName(beforeName,userName);
                        if (userTime!=null){
                            userTimeMapper.updateUserName(userId,userName);
                        }
                    }
                    msg.setCode(1);
                    msg.setMessage("修改用户成功！");
                    return msg;
            }
        }
    }
    @Override
    public User selectMax() {
        User user = userMapper.selectMax();
        return user;
    }

    /**
     * 每天凌晨0点执行一次
     */
    @Scheduled(cron = "0 0 0 * * ?")
    public void test1(){
        List<UserTime> userTimes = userTimeMapper.selectall();
        Date nowTime=new Date();
        for (UserTime userTime:userTimes){
            if (userTime!=null&&userTime.getGetVipTime()!= null){
                Date getVipTime = userTime.getGetVipTime();
                Integer userId = userTime.getUserId();
                //相差多少小时
                long hour = (nowTime.getTime() - getVipTime.getTime()) / (1000 * 60 * 60);
                if (hour>24 * 30){
                    userTimeMapper.updateuserTime(userId);
                    userMapper.updateUserVip(userId);
                }
            }
        }
    }
}
