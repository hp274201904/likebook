package library.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;
import library.entity.User;
import library.service.UserService;
import library.until.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    /**
     * 注册
     * @param userName
     * @param password
     * @return
     */
    @RequestMapping("/insertUser")
    @ResponseBody
    public void insertUser(String userName,String password,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Msg msg = userService.insertUser(userName, password);
        if (msg.getCode()==-1){
            request.setAttribute("msg",msg.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }else {
            request.setAttribute("msg",msg.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    /**
     * 登录
     * @param userName
     * @param password
     * @return
     */
    @RequestMapping("/selectUser")
    @ResponseBody
    public void selectUser(String userName, String password, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Boolean Boolean = userService.selectUser(userName, password);
        if (!Boolean){
            request.setAttribute("msg","用户名或密码错误！");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else {
            User user = userService.selectOneUser(userName);
            if (user.getUserId()==1){
                request.setAttribute("user",user);
                request.getRequestDispatcher("root.jsp").forward(request,response);
            }else {
                request.setAttribute("user",user);
                request.getRequestDispatcher("homePage3.jsp").forward(request,response);
            }

        }
    }
    /**
     * 查询所有用户信息
     * @param pn
     * @return
     */
    @RequestMapping("/selectAllUser")
    @ResponseBody
    public PageInfo selectAllUser(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,10);
        List<User> users = userService.selectAllUser();
        PageInfo page=new PageInfo(users,5);
        return page;
    }

    /**
     * 查询自己的详细信息
     * @param userName
     * @return
     */
    @RequestMapping("/selectOneUser")
    @ResponseBody
    public void selectOneUser(String userName,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = userService.selectOneUser(userName);
        request.setAttribute("user",user);
        request.getRequestDispatcher("user.jsp").forward(request,response);
    }

    /**
     * 查询指定用户详情
     * @param userName
     * @return
     */
    @RequestMapping("/selectAppointUser")
    @ResponseBody
    public Msg selectAppointUser(String userName){
        User user = userService.selectOneUser(userName);
        Msg msg=new Msg();
        if (user==null){
            msg.setCode(-1);
            msg.setMessage("操作失败，请正确输入！");
            return msg;
        }else {
            msg.setCode(-1);
            msg.setMessage("操作成功！");
            msg.setObject(user);
            return msg;
        }
    }

    /**
     * 跳转到homepage
     * @param userName
     * @param sort
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/tohomePage")
    @ResponseBody
    public void tohomePage(String userName,String sort,String bookName,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = userService.selectOneUser(userName);
        request.setAttribute("user",user);
        request.setAttribute("sort",sort);
        request.setAttribute("bookName",bookName);
        request.getRequestDispatcher("homePage.jsp").forward(request,response);
    }

    /**
     * 修改用户的信息
     * @param userId
     * @param userName
     * @param password
     * @param image
     * @param address
     * @return
     */
    @RequestMapping("/updateUser")
    @ResponseBody
    public Msg updateUser(Integer userId,String userName,String password,String image,String address){
        Msg msg = userService.updateUser(userId, userName, password, image, address);
        return msg;
    }

    /**
     * 更新或者添加用户
     * @param userId
     * @param userName
     * @param password
     * @param money
     * @param vip
     * @param address
     * @return
     */
    @RequestMapping("/updateAndInsertUser")
    @ResponseBody
    public Msg updateAndInsertUser(Integer userId,String userName,String password,Double money,String vip,String address){
        Msg msg = userService.updateAndInsert(userId, userName, password, vip, money, address);
        return msg;
    }

    /**
     * 删除用户信息
     * @param userName
     * @return
     */
    @RequestMapping("/deleteUser")
    @ResponseBody
    public Msg deleteUser(String userName){
        Msg msg = userService.deleteUser(userName);
        return msg;
    }

    /**
     * 充值vip
     * @param userName
     * @return
     */
    @RequestMapping("/rechargeVip")
    @ResponseBody
    public Msg rechargeVip(String userName){
        Msg msg = userService.rechargeVip(userName);
        return msg;
    }

    /**
     * 充值金额
     * @param userName
     * @param money
     * @return
     */
    @RequestMapping("/rechargeMoney")
    @ResponseBody
    public String rechargeMoney(String userName,Double money){
        String msg = userService.rechargeMoney(userName, money);
        return msg;
    }

}
