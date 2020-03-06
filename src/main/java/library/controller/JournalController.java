package library.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import library.entity.Journal;
import library.service.JournalService;
import library.until.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class JournalController {
    @Autowired
    JournalService journalService;

    /**
     * 显示全部记录
     * @param pn
     * @return
     */
    @RequestMapping("/selectAllJournal")
    @ResponseBody
    public PageInfo selectAllJournal(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<Journal> journals = journalService.selectAllJournal();
        PageInfo page=new PageInfo(journals,5);
        return page;
    }

    /**
     * 显示自己的记录
     * @param pn
     * @param userName
     * @return
     */
    @RequestMapping("/selectJournal")
    @ResponseBody
    public PageInfo selectJournal(@RequestParam(value = "pn",defaultValue = "1")Integer pn,String userName){
        PageHelper.startPage(pn,5);
        List<Journal> journals = journalService.selectJournal(userName);
        PageInfo page=new PageInfo(journals,5);
        return page;
    }

    /**
     * 借了再买
     * @param userName
     * @param userBookId
     * @param bookId
     * @param returnBook
     * @param buyBook
     * @return
     */
    @RequestMapping("/borrowToBuy")
    @ResponseBody
    public Msg borrowToBuy(String userName, Integer userBookId, Integer bookId, String returnBook, String buyBook){
        Msg msg = journalService.borrowToBuy(userName, userBookId, bookId, returnBook, buyBook);
        return msg;
    }

    /**
     * 查询自己的购买记录
     * @param pn
     * @param userName
     * @return
     */
    @RequestMapping("/selectMyBuyJo")
    @ResponseBody
    public PageInfo selectMyBuyJo(@RequestParam(value = "pn",defaultValue = "1")Integer pn,String userName){
        PageHelper.startPage(pn,10);
        List<Journal> journals = journalService.selectMyBuyJo(userName);
        PageInfo page=new PageInfo(journals,5);
        return page;
    }


    /**
     * 查询自己的借阅记录
     * @param userName
     * @return
     */
    @RequestMapping("/selectMyBorrowJo")
    @ResponseBody
    public List<Journal> selectMyBorrowJo(String userName){
        List<Journal> journals = journalService.selectMyBorrowJo(userName);
        return journals;
    }

    /**
     * 查询所有的购买记录
     * @param pn
     * @return
     */
    @RequestMapping("/selectBuyJo")
    @ResponseBody
    public PageInfo selectMyBuyJo(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,10);
        List<Journal> journals = journalService.selectBuyJo();
        PageInfo page=new PageInfo(journals,5);
        return page;
    }


    /**
     * 查询所有的借阅记录
     * @return
     */
    @RequestMapping("/selectBorrowJo")
    @ResponseBody
    public PageInfo selectMyBorrowJo(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,10);
        List<Journal> journals = journalService.selectBorrowJo();
        PageInfo page=new PageInfo(journals,5);
        return page;
    }
}
