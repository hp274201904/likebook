package library.service.impl;

import library.dao.IndentMapper;
import library.dao.UserMapper;
import library.entity.Indent;
import library.service.IndentService;
import library.until.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndentServiceImpl implements IndentService {
    @Autowired
    IndentMapper indentMapper;

    @Override
    public Msg insertIndent(String userName, String bookName, String message, String address) {
        Msg msg=new Msg();
        if(userName==null||bookName.isEmpty()||message.isEmpty()||address.isEmpty()){
            msg.setCode(-1);
            msg.setMessage("输入的数据不完整，订阅失败！");
            return msg;
        }else {
            Indent indent = indentMapper.selectIndentByIdAndName(userName, bookName);
            if (indent!=null){
                msg.setCode(-1);
                msg.setMessage("你已订阅改书籍，无法再次订阅改书籍！");
                return msg;
            }else {
                String complete="未处理";
                indentMapper.insertIndent(new Indent(userName,bookName,message,address,complete));
                msg.setCode(-1);
                msg.setMessage("完成订阅！");
                return msg;
            }
        }
    }

    @Override
    public Msg updateIndent(String userName, String bookName) {
        Msg msg=new Msg();
        String complete="已处理";
        indentMapper.updateIndent(complete,userName,bookName);
        msg.setCode(1);
        msg.setMessage("处理成功");
        return msg;
    }

    @Override
    public List<Indent> selectIndent() {
        List<Indent> indents = indentMapper.selectIndent();
        return indents;
    }

    @Override
    public List<Indent> selectMyIndent(String userName) {
        List<Indent> indents = indentMapper.selectMyIndent(userName);
        return indents;
    }

    @Override
    public List<Indent> selectnotIndent() {
        List<Indent> indents = indentMapper.selectnotIndent();
        return indents;
    }

    @Override
    public Msg handleIndent(String userName, String bookName) {
        Msg msg=new Msg();
        if (userName.isEmpty()||bookName.isEmpty()){
            msg.setCode(-1);
            msg.setMessage("处理失败！");
            return msg;
        }else {
            indentMapper.handleIndent(userName,bookName);
            msg.setCode(-1);
            msg.setMessage("处理成功！");
            return msg;
        }
    }
}
