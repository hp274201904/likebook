package library.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import library.dao.IndentMapper;
import library.entity.Indent;
import library.service.IndentService;
import library.until.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class IndentController {
    @Autowired
    IndentService indentService;

    /**
     * 提交订单
     * @return
     */
    @RequestMapping("/insertIndent")
    @ResponseBody
    public Msg insertIndent(String userName,String bookName,String message,String address){
        Msg msg = indentService.insertIndent(userName, bookName, message, address);
        return msg;
    }

    /**
     * 处理预约订单
     * @param userName
     * @param bookName
     * @return
     */
    @RequestMapping("/updateIndent")
    @ResponseBody
    public Msg updateIndent(String userName,String bookName){
        Msg msg = indentService.updateIndent(userName, bookName);
        return msg;
    }

    /**
     * 查看全部订阅
     * @param pn
     * @return
     */
    @RequestMapping("/selectIndent")
    @ResponseBody
    public PageInfo selectIndent(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,10);
        List<Indent> indents = indentService.selectIndent();
        PageInfo page=new PageInfo(indents,5);
        return page;
    }

    /**
     * 查看自己的订单
     * @param pn
     * @param userName
     * @return
     */
    @RequestMapping("/selectMyIndent")
    @ResponseBody
    public PageInfo selectMyIndent(@RequestParam(value = "pn",defaultValue = "1")Integer pn,String userName){
        PageHelper.startPage(pn,10);
        List<Indent> indents = indentService.selectMyIndent(userName);
        PageInfo page=new PageInfo(indents,5);
        return page;
    }

    /**
     * 查看没有处理的订单信息
     * @param pn
     * @return
     */
    @RequestMapping("/selectnotIndent")
    @ResponseBody
    public PageInfo selectnotIndent(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,10);
        List<Indent> indents = indentService.selectnotIndent();
        PageInfo page=new PageInfo(indents,5);
        return page;
    }

}
