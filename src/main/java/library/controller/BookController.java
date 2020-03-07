package library.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import library.entity.Book;
import library.service.BookService;
import library.service.UserService;
import library.until.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class BookController {
    @Autowired
    BookService bookService;
    @Autowired
    UserService userService;

    /**
     *主页展示，分类查找，搜索
     * @param pn
     * @param sort
     * @param bookName
     * @return
     */
    @RequestMapping(value = "/selectBooks")
    @ResponseBody
    public PageInfo selectBooks(@RequestParam(value = "pn",defaultValue = "1")Integer pn,
                                @RequestParam(value = "sort",defaultValue = "全部")String sort,
                                @RequestParam(value = "bookName",defaultValue = "1")String bookName) {

        PageHelper.startPage(pn,6);
        if("1".equals(bookName)){
            List<Book> books = bookService.selectBook(sort);
            //navigatePages:导航页码数
            PageInfo page=new PageInfo(books,5);
            return page;
        }else {
            List<Book> books = bookService.selectBookByName(bookName);
            PageInfo page=new PageInfo(books,5);
            return page;
        }
    }

    /**
     * 借阅书籍
     * @param bookId
     * @param userName
     * @return
     */
    @RequestMapping("/BorrowBook")
    @ResponseBody
    public Msg BorrowBook(Integer bookId,String userName){
        Msg msg = bookService.BorrowBook(bookId, userName);
        return msg;
    }

    /**
     * 归还书籍
     * @param userName
     * @param bookId
     * @return
     */
    @RequestMapping("/returnBook")
    @ResponseBody
    public Msg returnBook(String userName,Integer bookId){
        Msg msg = bookService.returnBook(userName, bookId);
        return msg;
    }

    /**
     * 购买书籍
     * @param userName
     * @param bookId
     * @return
     */
    @RequestMapping("/buyBook")
    @ResponseBody
    public Msg buyBook(String userName,Integer bookId){
        Msg msg = bookService.buyBook(userName, bookId);
        return msg;
    }

    /**
     * 查询一本书
     * @param bookName
     */
    @RequestMapping("/selectOneBook")
    @ResponseBody
    public Msg selectOneBook(String bookName)  {
        Msg msg=new Msg();
        Book book = bookService.selectOneBook(bookName);
        msg.setCode(1);
        msg.setObject(book);
        return msg;
    }

    /**
     * 上传图片
     * @param file
     * @param bookId
     * @param bookName
     * @param bookMessage
     * @param money
     * @param number
     * @param sort
     * @return
     * @throws IOException
     */
    @RequestMapping("/uploadImage")
    @ResponseBody
    public Msg uploadImage(MultipartFile file,Integer bookId,String bookName,String bookMessage,Double money,Integer number,String sort) throws IOException {
            //保存图片的路径
            String filePath = "temporary/bookimage";
            //获取原始图片的拓展名
            String originalFilename = file.getOriginalFilename();
            //新文件的文件名
            String newFileName = UUID.randomUUID() + originalFilename;
            String image = "/bookimage/" + newFileName;
            //封装上传文件位置的全路径
            File targetFile = new File(filePath, newFileName);
            //把本地文件上传到封装上传文件位置的全路径
            file.transferTo(targetFile);
            Book book = new Book(bookId, bookName, image, bookMessage, number, money, sort);
            Msg msg = bookService.updateAndInsertBook(book);
            return msg;


    }

    @RequestMapping("/updateBook")
    @ResponseBody
    public Msg updateBook(Integer bookId,String bookName,String bookMessage,Double money,Integer number,String sort){
        Msg msg = bookService.updateBook(new Book(bookId, bookName, null, bookMessage,number, money, sort));
        return msg;
    }

}
