<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/28
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="js/jquery-3.1.1.js"></script>
    <title>后台管理</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            /* outline: 1px solid red; */
        }
        .card img {
            height: 200px;
        }
        .card {
            height: 350px;
            margin-bottom: 30px;
            margin-right: 15px;
            display: inline-block;
        }
        .navbar {
            position: relative;
        }

        /* 以下为样式美化代码，可以自行删改 */
        body {
            background: url('http://s2.hdslb.com/bfs/static/blive/blfe-message-web/static/img/infocenterbg.a1a0d152.jpg')
            top/cover no-repeat fixed !important;
        }

        .container {
            background: #fff9;
            padding-bottom: 35px;
        }

        /* 主体分块 */
        .option {
            margin: 15px 0 5px 0;
            box-sizing: content-box;
            background: #fffc;
            border-radius: 4px;
            overflow: auto;
        }

        .glass,
        .glass-black {
            position: relative;
            backdrop-filter: blur(10px);
        }

        .glass::before {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: #fff3;
            z-index: -1;
        }

        .glass-black::before {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: #0003;
        }

        .type-cover {
            /* padding-right: 15px; */
        }

        .book-type {
            width: 100%;
            height: 45px;
            line-height: 45px;
            font-size: 14px;
            font-weight: 700;
            font-family: 'Microsoft YaHei', 'Microsoft Sans Serif',
            'Microsoft SanSerf', 微软雅黑;
            text-align: center;
            user-select: none;
        }

        li {
            list-style: none;
            font-size: 14px;
            line-height: 40px;
        }

        .book-type ~ li::before {
            content: '\25cf';
            color: #007bff;
            font-size: 12px;
            line-height: 40px;
            margin: 0 10px 0 25px;
        }
        textarea.form-control{
            height:100px
        }
    </style>
</head>
<body>
<%--用户修改，添加的的模态框--%>
<div class="modal fade" id="usermodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">用户管理</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="userinsert">
                    <div class="form-group">
                        <label class="col-sm-6 control-label">用户ID：
                        </label>
                        <div class="col-sm-10">
                            <input type="text" disabled="disabled" name="bookid" class="form-control" id="userId_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-6 control-label">用户名：
                        </label>
                        <div class="col-sm-10">
                            <input type="text" name="bookid" class="form-control" id="userName_input" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-6 control-label">密码：</label>
                        <div class="col-sm-10">
                            <input type="text" name="bookname" class="form-control" id="password_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-6 control-label">VIP：</label>
                        <div class="col-sm-10">
                            <input type="text" name="bookname" class="form-control" id="VIP_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-6 control-label">该用户余额：</label>
                        <div class="col-sm-10">
                            <input type="text" name="number" class="form-control" id="money_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-6 control-label">该用户地址：</label>
                        <div class="col-sm-10">
                            <input type="text" name="number" class="form-control" id="address_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="user_update_btn"></button>
            </div>
        </div>
    </div>
</div>
<%--书籍修改，添加的的模态框--%>
<div class="modal fade" id="bookmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">书籍管理</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="bookinsert" enctype="multipart/form-data" method="post">
                    <div class="form-group">
                        <div class="text-center">
                            <img src="" class="rounded" id="bookImage" height="200px" width="200px">
                        </div>
                        <label class="col-sm-12" style="margin: 10px 0 1px;" id="addbookimage">
                            修改图片封面：<input type="file" id="file" name="file" onchange="changge()">
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-6 control-label">书籍ID：
                        </label>
                        <div class="col-sm-10">
                            <input type="text"  class="form-control" id="bookId_input" disabled="disabled">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-6 control-label">书名：</label>
                        <div class="col-sm-10">
                            <input type="text"  class="form-control" id="bookName_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-6 control-label">价格：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="bookMoney_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-6 control-label">数量：</label>
                        <div class="col-sm-10">
                            <input type="text"  class="form-control" id="bookNumber_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-6 control-label">分类：</label>
                        <div class="col-sm-10">
                            <input type="text"  class="form-control" id="bookSort_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-6 control-label">书籍信息：</label>
                        <div class="col-sm-10">
                            <textarea  class="form-control" id="bookMessage_input">
                            </textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="book_update_btn"></button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="navbar-brand" href="#"><img src="${user.image}" height="60px" width="60px"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">${user.userName}<span class="sr-only"></span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="javascript:VIP()">
                                    <c:if test="${user.vip=='是'}">
                                        <font color="red">VIP</font>
                                    </c:if>
                                    <c:if test="${user.vip!='是'}">
                                        <font color="gray">VIP</font>
                                    </c:if>
                                </a>
                            </li>
                            <li class="nav-link"><a lass="nav-item" href="index.jsp">退出登录</a></li>
                        </ul>
                    </div>
                </nav>
                <div class="row" style="margin: 20px;">
                    <div class="col-2" style="border:1px solid #cccccc;height:600px;">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">用户信息</a>
                            <a class="nav-link" id="v-pills-book-tab" data-toggle="pill" href="#v-pills-book" role="tab" aria-controls="v-pills-settings" aria-selected="false">书籍信息</a>
                            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">购买记录</a>
                            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">借阅记录</a>
                            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">未处理订单</a>
                            <a class="nav-link" id="v-pills-all-tab" data-toggle="pill" href="#v-pills-all" role="tab" aria-controls="v-pills-settings" aria-selected="false">所有订单</a>
                        </div>
                    </div>
                    <div class="col-9" style="border:1px solid #cccccc;height:600px;margin: auto;">
                        <div  id="v-pills-tabContent">
                            <div class="tab-pane fade show active collapse" id="v-pills-home" >
                                <%--  显示表格数据--%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-hover" id="book_table">
                                            <thead>
                                            <tr>
                                                <th>用户ID</th>
                                                <th>用户名</th>
                                                <th>密码</th>
                                                <th>VIP</th>
                                                <th>余额</th>
                                                <th>地址</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                        <%-- 显示分页信息--%>
                                        <div class="row">
                                            <%--        分页文字信息--%>
                                            <div class="col-md-6" id="page_info_area">
                                            </div>
                                            <%--         分页条信息--%>
                                            <div class="col-md-6" id="page_nav_area">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade collapse" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                <%--  显示表格数据--%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-hover" id="book_table2">
                                            <thead>
                                            <tr>
                                                <th>用户名</th>
                                                <th>书名</th>
                                                <th>书籍号</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                        <%-- 显示分页信息--%>
                                        <div class="row">
                                            <%--        分页文字信息--%>
                                            <div class="col-md-6" id="page_info_area2">
                                            </div>
                                            <%--         分页条信息--%>
                                            <div class="col-md-6" id="page_nav_area2">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade collapse" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                <%--  显示表格数据--%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-hover" id="book_table3">
                                            <thead>
                                            <tr>
                                                <th>用户名</th>
                                                <th>书名</th>
                                                <th>书籍号</th>
                                                <th>是否归还</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                        <%-- 显示分页信息--%>
                                        <div class="row">
                                            <%--        分页文字信息--%>
                                            <div class="col-md-6" id="page_info_area3">
                                            </div>
                                            <%--         分页条信息--%>
                                            <div class="col-md-6" id="page_nav_area3">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade collapse" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                <%--  显示表格数据--%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-hover" id="book_table4">
                                            <thead>
                                            <tr>
                                                <th>用户名</th>
                                                <th>书名</th>
                                                <th>地址</th>
                                                <th>书籍信息</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                        <%-- 显示分页信息--%>
                                        <div class="row">
                                            <%--        分页文字信息--%>
                                            <div class="col-md-6" id="page_info_area4">
                                            </div>
                                            <%--         分页条信息--%>
                                            <div class="col-md-6" id="page_nav_area4">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade collapse" id="v-pills-all" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                <%--  显示表格数据--%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-hover" id="book_table5">
                                            <thead>
                                            <tr>
                                                <th>用户名</th>
                                                <th>书名</th>
                                                <th>地址</th>
                                                <th>书籍信息</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                        <%-- 显示分页信息--%>
                                        <div class="row">
                                            <%--        分页文字信息--%>
                                            <div class="col-md-6" id="page_info_area5">
                                            </div>
                                            <%--         分页条信息--%>
                                            <div class="col-md-6" id="page_nav_area5">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade collapse" id="v-pills-book" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                <%--  显示表格数据--%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-hover" id="book_table6">
                                            <thead>
                                            <tr>
                                                <th>书籍ID</th>
                                                <th>书名</th>
                                                <th>价格</th>
                                                <th>分类</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                        <%-- 显示分页信息--%>
                                        <div class="row">
                                            <%--        分页文字信息--%>
                                            <div class="col-md-6" id="page_info_area6">
                                            </div>
                                            <%--         分页条信息--%>
                                            <div class="col-md-6" id="page_nav_area6">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    var currentpage;
    var pages;
    var maxbookId=${bookId};
    var maxuserId=${userId};
$(function () {
    to_page(1);
    to_buypage(1);
    to_Borrowpage(1);
    to_notIndentpage(1);
    to_allIndentpage(1);
    to_bookpage(1);
})
    function to_page(pn) {
        $.ajax({
            url:"selectAllUser",
            data:{"pn":pn},
            type:"POST",
            success:function (result) {
                books_table(result);
                books_info(result);
                books_nav(result);
            }
        })
    }
//用户信息表单数据
function books_table(result) {
    //清空table表格
    $("#book_table tbody").empty();
    var books = result.list;
    $.each(books, function (index, item) {
        var userIdTd = $("<td></td>").append(item.userId);
        var userNameTd = $("<td></td>").append(item.userName);
        var passwordTd = $("<td></td>").append(item.password);
        var vipTd = $("<td></td>").append(item.vip);
        var moneyTd = $("<td></td>").append(item.money);
        var addressTd = $("<td></td>").append(item.address);
        // var buyBtn =$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
        //     .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
        //     .append("修改").click(()=>openBuy(item.bookName));
        var editBtn =$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改")
            .click(()=>openuser("是",item.userName));
        var addBtn = $("<button></button>").addClass("btn btn-info btn-sm return_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-minus")).append("增加")
            .click(()=>openuser("否",item.userName));
        var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除")
            .click(()=>deleteUser(item.userName));
        $("<tr></tr>").append(userIdTd).append(userNameTd).append(passwordTd).append(vipTd).append(moneyTd).
        append(addressTd).append(editBtn).append(addBtn).append(delBtn).appendTo("#book_table tbody");
    })
}
//分页条数据
function books_info(result) {
    $("#page_info_area").empty();
    $("#page_info_area").append("当前第"+result.pageNum+"页,总"+result.pages+"页,总"
        +result.total+"条记录");
    currentpage=result.pageNum;
    pages=result.pages;
}
//分析显示条
function books_nav(result) {
    $("#page_nav_area").empty();
    var ul=$("<ul></ul>").addClass("pagination");
    var firstPage=$("<li></li>").append($("<a></a>").append("首页").attr("href","#").addClass("page-link"));
    var prePage=$("<li></li>").append($("<a></a>").append("&laquo;").addClass("page-link"));
    if(result.hasPreviousPage==false){
        firstPage.addClass("page-item disabled");
        prePage.addClass("page-item disabled");
    }else {
        firstPage.click(function () {
            to_page(1);
        })
        prePage.click(function () {
            to_page(result.pageNum-1);
        })
    }
    var nextpage=$("<li></li>").append($("<a></a>").append("&raquo;").addClass("page-link"));
    var lastPage=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#").addClass("page-link"));
    if(result.hasNextPage==false){
        nextpage.addClass("page-item disabled");
        lastPage.addClass("page-item disabled");
    }else {
        nextpage.click(function () {
            to_page(result.pageNum+1)
        })
        lastPage.click(function () {
            to_page(result.pages);
        })
    }
    ul.append(firstPage).append(prePage)
    $.each(result.navigatepageNums,function (index,item) {
        var numli=$("<li></li>").append($("<a></a>").append(item).addClass("page-link"));
        if(result.pageNum==item){
            numli.addClass("page-item active")
        }
        numli.click(function () {
            to_page(item)
        })
        ul.append(numli);
    })
    ul.append(nextpage).append(lastPage);
    var nav=$("<nav></nav>").append(ul);
    nav.appendTo("#page_nav_area");
}

function openuser(thing,userName) {
    if (thing=="是"){
        $("#user_update_btn").html("修改")
        $.ajax({
            url: "selectAppointUser",
            data: {"userName":userName},
            type: "POST",
            success:function (result) {
                const modal = document.querySelector("#usermodal");
                const userId = modal.querySelector("#userId_input");
                const userName = modal.querySelector("#userName_input");
                const password = modal.querySelector("#password_input");
                const VIP = modal.querySelector("#VIP_input");
                const money = modal.querySelector("#money_input");
                const address = modal.querySelector("#address_input");
                userId.value=result.object.userId;
                userName.value = result.object.userName;
                password.value = result.object.password;
                VIP.value = result.object.vip;
                money.value = result.object.money;
                address.value=result.object.address;
                $("#usermodal").modal({
                    backdrop:"static"
                })
            }
        })
    }else {
        $("#userId_input").val(maxuserId);
        $("#userName_input").val("");
        $("#password_input").val("");
        $("#VIP_input").val("");
        $("#money_input").val("");
        $("#address_input").val("");
        $("#user_update_btn").html("增加");
        $("#usermodal").modal({
            backdrop:"static"
        })
    }
}

$("#user_update_btn").click(function () {
    //Integer userId,String userName,String password,Double money,String vip,String address
    var userId=document.getElementById("userId_input").value;
    var userName=document.getElementById("userName_input").value;
    var password=document.getElementById("password_input").value;
    var money=document.getElementById("money_input").value;
    var vip=document.getElementById("VIP_input").value;
    var address=document.getElementById("address_input").value;
    $.ajax({
        url:"updateAndInsertUser",
        data:{"userId":userId,"userName":userName,"password":password,"money":money,"vip":vip,"address":address},
        type:"POST",
        success:function (result) {
            if (result.code==-1){
                alert(result.message);
            }else {
                $("#usermodal").modal('hide');
                to_page(currentpage);
            }
        }
    })
})
    function deleteUser(userName) {
        $.ajax({
            url:"deleteUser",
            data:{"userName":userName},
            type:"POST",
            success:function (result) {
                alert(result.message);
                to_page(currentpage);
            }
        })
    }

    function to_buypage(pn) {
        $.ajax({
            url:"selectBuyJo",
            data:{"pn":pn},
            type:"POST",
            success:function (result) {
                books_table2(result);
                books_info2(result);
                books_nav2(result);
            }
        })
    }
    //所有购买表单数据
    function books_table2(result) {
        //清空table表格
        $("#book_table2 tbody").empty();
        var books = result.list;
        $.each(books, function (index, item) {
            var userNameTd = $("<td></td>").append(item.userName);
            var bookNameTd = $("<td></td>").append(item.bookName);
            var bookIdTd = $("<td></td>").append(item.bookId);
            $("<tr></tr>").append(userNameTd).append(bookNameTd).append(bookIdTd)
                .appendTo("#book_table2 tbody");
        })
    }
    //分页条数据
    function books_info2(result) {
        $("#page_info_area2").empty();
        $("#page_info_area2").append("当前第"+result.pageNum+"页,总"+result.pages+"页,总"
            +result.total+"条记录");
        currentpage=result.pageNum;
        pages=result.pages;
    }
    //分析显示条
    function books_nav2(result) {
        $("#page_nav_area2").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPage=$("<li></li>").append($("<a></a>").append("首页").attr("href","#").addClass("page-link"));
        var prePage=$("<li></li>").append($("<a></a>").append("&laquo;").addClass("page-link"));
        if(result.hasPreviousPage==false){
            firstPage.addClass("page-item disabled");
            prePage.addClass("page-item disabled");
        }else {
            firstPage.click(function () {
                to_buypage(1);
            })
            prePage.click(function () {
                to_buypage(result.pageNum-1);
            })
        }
        var nextpage=$("<li></li>").append($("<a></a>").append("&raquo;").addClass("page-link"));
        var lastPage=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#").addClass("page-link"));
        if(result.hasNextPage==false){
            nextpage.addClass("page-item disabled");
            lastPage.addClass("page-item disabled");
        }else {
            nextpage.click(function () {
                to_buypage(result.pageNum+1)
            })
            lastPage.click(function () {
                to_buypage(result.pages);
            })
        }
        ul.append(firstPage).append(prePage)
        $.each(result.navigatepageNums,function (index,item) {
            var numli=$("<li></li>").append($("<a></a>").append(item).addClass("page-link"));
            if(result.pageNum==item){
                numli.addClass("page-item active")
            }
            numli.click(function () {
                to_buypage(item)
            })
            ul.append(numli);
        })
        ul.append(nextpage).append(lastPage);
        var nav=$("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area2");
    }
    function to_Borrowpage(pn) {
        $.ajax({
            url:"selectBorrowJo",
            data:{"pn":pn},
            type:"POST",
            success:function (result) {
                books_table3(result);
                books_info3(result);
                books_nav3(result);
            }
        })
    }
    //所有购买表单数据
    function books_table3(result) {
        //清空table表格
        $("#book_table3 tbody").empty();
        var books = result.list;
        $.each(books, function (index, item) {
            var userNameTd = $("<td></td>").append(item.userName);
            var bookNameTd = $("<td></td>").append(item.bookName);
            var bookIdTd = $("<td></td>").append(item.bookId);
            var returnBookTd;
            if (item.returnBook=='未借阅'){
                 returnBookTd= $("<td></td>").append("已归还").css({ 'color': 'green'});
            }else {
                 returnBookTd= $("<td></td>").append("未归还").css({ 'color': 'red'});
            }
            $("<tr></tr>").append(userNameTd).append(bookNameTd).append(bookIdTd).append(returnBookTd)
                .appendTo("#book_table3 tbody");
        })
    }
    //分页条数据
    function books_info3(result) {
        $("#page_info_area3").empty();
        $("#page_info_area3").append("当前第"+result.pageNum+"页,总"+result.pages+"页,总"
            +result.total+"条记录");
        currentpage=result.pageNum;
        pages=result.pages;
    }
    //分析显示条
    function books_nav3(result) {
        $("#page_nav_area3").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPage=$("<li></li>").append($("<a></a>").append("首页").attr("href","#").addClass("page-link"));
        var prePage=$("<li></li>").append($("<a></a>").append("&laquo;").addClass("page-link"));
        if(result.hasPreviousPage==false){
            firstPage.addClass("page-item disabled");
            prePage.addClass("page-item disabled");
        }else {
            firstPage.click(function () {
                to_Borrowpage(1);
            })
            prePage.click(function () {
                to_Borrowpage(result.pageNum-1);
            })
        }
        var nextpage=$("<li></li>").append($("<a></a>").append("&raquo;").addClass("page-link"));
        var lastPage=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#").addClass("page-link"));
        if(result.hasNextPage==false){
            nextpage.addClass("page-item disabled");
            lastPage.addClass("page-item disabled");
        }else {
            nextpage.click(function () {
                to_Borrowpage(result.pageNum+1)
            })
            lastPage.click(function () {
                to_Borrowpage(result.pages);
            })
        }
        ul.append(firstPage).append(prePage)
        $.each(result.navigatepageNums,function (index,item) {
            var numli=$("<li></li>").append($("<a></a>").append(item).addClass("page-link"));
            if(result.pageNum==item){
                numli.addClass("page-item active")
            }
            numli.click(function () {
                to_Borrowpage(item)
            })
            ul.append(numli);
        })
        ul.append(nextpage).append(lastPage);
        var nav=$("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area3");
    }
    function to_notIndentpage(pn) {
        $.ajax({
            url:"selectnotIndent",
            data:{"pn":pn},
            type:"POST",
            success:function (result) {
                books_table4(result);
                books_info4(result);
                books_nav4(result);
            }
        })
    }
    //所有购买表单数据
    function books_table4(result) {
        //清空table表格
        $("#book_table4 tbody").empty();
        var books = result.list;
        $.each(books, function (index, item) {
            var userNameTd = $("<td></td>").append(item.userName);
            var bookNameTd = $("<td></td>").append(item.bookName);
            var messageTd = $("<td></td>").append(item.message);
            var addressTd = $("<td></td>").append(item.address);
            var addBtn = $("<button></button>").addClass("btn btn-info btn-sm return_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-minus")).append("处理")
                .click(()=>handleIndent(item.userName,item.bookName));
            $("<tr></tr>").append(userNameTd).append(bookNameTd).append(messageTd).append(addressTd)
                .append(addBtn).appendTo("#book_table4 tbody");
        })
    }
    //分页条数据
    function books_info4(result) {
        $("#page_info_area4").empty();
        $("#page_info_area4").append("当前第"+result.pageNum+"页,总"+result.pages+"页,总"
            +result.total+"条记录");
        currentpage=result.pageNum;
        pages=result.pages;
    }
    //分析显示条
    function books_nav4(result) {
        $("#page_nav_area4").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPage=$("<li></li>").append($("<a></a>").append("首页").attr("href","#").addClass("page-link"));
        var prePage=$("<li></li>").append($("<a></a>").append("&laquo;").addClass("page-link"));
        if(result.hasPreviousPage==false){
            firstPage.addClass("page-item disabled");
            prePage.addClass("page-item disabled");
        }else {
            firstPage.click(function () {
                to_notIndentpage(1);
            })
            prePage.click(function () {
                to_notIndentpage(result.pageNum-1);
            })
        }
        var nextpage=$("<li></li>").append($("<a></a>").append("&raquo;").addClass("page-link"));
        var lastPage=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#").addClass("page-link"));
        if(result.hasNextPage==false){
            nextpage.addClass("page-item disabled");
            lastPage.addClass("page-item disabled");
        }else {
            nextpage.click(function () {
                to_notIndentpage(result.pageNum+1)
            })
            lastPage.click(function () {
                to_notIndentpage(result.pages);
            })
        }
        ul.append(firstPage).append(prePage)
        $.each(result.navigatepageNums,function (index,item) {
            var numli=$("<li></li>").append($("<a></a>").append(item).addClass("page-link"));
            if(result.pageNum==item){
                numli.addClass("page-item active")
            }
            numli.click(function () {
                to_notIndentpage(item)
            })
            ul.append(numli);
        })
        ul.append(nextpage).append(lastPage);
        var nav=$("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area4");
    }
    function handleIndent(userName,bookName) {
        $.ajax({
            url:"updateIndent",
            data:{"userName":userName,"bookName":bookName},
            type:"POST",
            success:function (result) {
                alert(result.message);
                to_notIndentpage(currentpage);
            }
        })
    }
    function to_allIndentpage(pn) {
        $.ajax({
            url:"selectIndent",
            data:{"pn":pn},
            type:"POST",
            success:function (result) {
                books_table5(result);
                books_info5(result);
                books_nav5(result);
            }
        })
    }
    //所有预约表单数据
    function books_table5(result) {
        //清空table表格
        $("#book_table5 tbody").empty();
        var books = result.list;
        $.each(books, function (index, item) {
            var userNameTd = $("<td></td>").append(item.userName);
            var bookNameTd = $("<td></td>").append(item.bookName);
            var messageTd = $("<td></td>").append(item.message);
            var addressTd = $("<td></td>").append(item.address);
            $("<tr></tr>").append(userNameTd).append(bookNameTd).append(messageTd).append(addressTd)
                .appendTo("#book_table5 tbody");
        })
    }
    //分页条数据
    function books_info5(result) {
        $("#page_info_area5").empty();
        $("#page_info_area5").append("当前第"+result.pageNum+"页,总"+result.pages+"页,总"
            +result.total+"条记录");
        currentpage=result.pageNum;
        pages=result.pages;
    }
    //分析显示条
    function books_nav5(result) {
        $("#page_nav_area5").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPage=$("<li></li>").append($("<a></a>").append("首页").attr("href","#").addClass("page-link"));
        var prePage=$("<li></li>").append($("<a></a>").append("&laquo;").addClass("page-link"));
        if(result.hasPreviousPage==false){
            firstPage.addClass("page-item disabled");
            prePage.addClass("page-item disabled");
        }else {
            firstPage.click(function () {
                to_allIndentpage(1);
            })
            prePage.click(function () {
                to_allIndentpage(result.pageNum-1);
            })
        }
        var nextpage=$("<li></li>").append($("<a></a>").append("&raquo;").addClass("page-link"));
        var lastPage=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#").addClass("page-link"));
        if(result.hasNextPage==false){
            nextpage.addClass("page-item disabled");
            lastPage.addClass("page-item disabled");
        }else {
            nextpage.click(function () {
                to_allIndentpage(result.pageNum+1)
            })
            lastPage.click(function () {
                to_allIndentpage(result.pages);
            })
        }
        ul.append(firstPage).append(prePage)
        $.each(result.navigatepageNums,function (index,item) {
            var numli=$("<li></li>").append($("<a></a>").append(item).addClass("page-link"));
            if(result.pageNum==item){
                numli.addClass("page-item active")
            }
            numli.click(function () {
                to_allIndentpage(item)
            })
            ul.append(numli);
        })
        ul.append(nextpage).append(lastPage);
        var nav=$("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area5");
    }

    function to_bookpage(pn) {
        $.ajax({
            url:"selectBooks",
            data:{"pn":pn},
            type:"POST",
            success:function (result) {
                books_table6(result);
                books_info6(result);
                books_nav6(result);
            }
        })
    }
    //所有书的数据
    function books_table6(result) {
        //清空table表格
        $("#book_table6 tbody").empty();
        var books = result.list;
        $.each(books, function (index, item) {
            var bookIdTd = $("<td></td>").append(item.booKId);
            var bookNameTd = $("<td></td>").append(item.bookName);
            var moneyTd = $("<td></td>").append(item.money);
            var sortTd = $("<td></td>").append(item.sort);
            var editBtn =$("<button></button>").addClass("btn btn-primary btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("修改").click(()=>opoenupdateBook(item.booKId,item.bookName,item.image,item.bookMessage,item.money,item.number,item.sort));
            var addBook =$("<button></button>").addClass("btn btn-info btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("增加").click(()=>openaddBook());
            var deldelBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).
                append("删除").click(()=>deleteeBook(item.booKId));
            $("<tr></tr>").append(bookIdTd).append(bookNameTd).append(moneyTd).append(sortTd)
                .append(editBtn).append(addBook).append(deldelBtn).appendTo("#book_table6 tbody");
        })
    }
    //分页条数据
    function books_info6(result) {
        $("#page_info_area6").empty();
        $("#page_info_area6").append("当前第"+result.pageNum+"页,总"+result.pages+"页,总"
            +result.total+"条记录");
        currentpage=result.pageNum;
        pages=result.pages;
    }
    //分析显示条
    function books_nav6(result) {
        $("#page_nav_area6").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPage=$("<li></li>").append($("<a></a>").append("首页").attr("href","#").addClass("page-link"));
        var prePage=$("<li></li>").append($("<a></a>").append("&laquo;").addClass("page-link"));
        if(result.hasPreviousPage==false){
            firstPage.addClass("page-item disabled");
            prePage.addClass("page-item disabled");
        }else {
            firstPage.click(function () {
                to_bookpage(1);
            })
            prePage.click(function () {
                to_bookpage(result.pageNum-1);
            })
        }
        var nextpage=$("<li></li>").append($("<a></a>").append("&raquo;").addClass("page-link"));
        var lastPage=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#").addClass("page-link"));
        if(result.hasNextPage==false){
            nextpage.addClass("page-item disabled");
            lastPage.addClass("page-item disabled");
        }else {
            nextpage.click(function () {
                to_bookpage(result.pageNum+1)
            })
            lastPage.click(function () {
                to_bookpage(result.pages);
            })
        }
        ul.append(firstPage).append(prePage)
        $.each(result.navigatepageNums,function (index,item) {
            var numli=$("<li></li>").append($("<a></a>").append(item).addClass("page-link"));
            if(result.pageNum==item){
                numli.addClass("page-item active")
            }
            numli.click(function () {
                to_bookpage(item)
            });
            //   <button class="btn btn-info btn-sm _btn" onclick="openaddBook()">增加</button>
            ul.append(numli);
        })

        ul.append(nextpage).append(lastPage);
        var nav=$("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area6");
    }

    function opoenupdateBook(bookId,bookName,image,bookMessage,money,number,sort) {
        document.getElementById("file").value="";
        const modal = document.querySelector("#bookinsert");
        const bookimage = modal.querySelector("#bookImage");
        const Id = modal.querySelector("#bookId_input");
        const Name = modal.querySelector("#bookName_input");
        const Message = modal.querySelector("#bookMessage_input");
        const bookMoney = modal.querySelector("#bookMoney_input");
        const bookNumber = modal.querySelector("#bookNumber_input");
        const bookSort = modal.querySelector("#bookSort_input");
        bookimage.setAttribute('src',image);
        Id.value =bookId;
        Name.value =bookName;
        Message.value =bookMessage;
        bookMoney.value =money;
        bookNumber.value=number;
        bookSort.value =sort;
        $("#book_update_btn").html("修改");
        $('#bookmodal').modal({
            backdrop: 'static'
        });
    }
    function openaddBook() {
        document.getElementById("addbookimage").innerHTML=" 修改图片封面：<input type=\"file\" id=\"file\" name=\"file\" onchange=\"changge()\">";
        document.getElementById("file").value="";
        $("#book_update_btn").html("新增");
        $("#bookImage").attr("src","");
        $("#bookId_input").val(maxbookId);
        $("#bookName_input").val("");
        $("#bookMessage_input").val("");
        $("#bookMoney_input").val("");
        $("#bookNumber_input").val("");
        $("#bookSort_input").val("");
        $('#bookmodal').modal({
            backdrop: 'static'
        });
    }
    $("#book_update_btn").click(function () {
        var bookId = document.getElementById("bookId_input").value;
        var bookName = document.getElementById("bookName_input").value;
        var bookMessage = document.getElementById("bookMessage_input").value;
        var money = document.getElementById("bookMoney_input").value;
        var number = document.getElementById("bookNumber_input").value;
        var sort = document.getElementById("bookSort_input").value;
        var fomdate = new FormData($("#bookinsert")[0]);
        fomdate.append("bookId", bookId);
        fomdate.append("bookName", bookName);
        fomdate.append("bookMessage", bookMessage);
        fomdate.append("money", money);
        fomdate.append("number", number);
        fomdate.append("sort", sort);
        //MultipartFile file,Integer bookId,String bookName,String bookMessage,Double money,Integer number,String sort)
        console.log(document.getElementById("file").value);

        if (document.getElementById("file").value !=""){
            $.ajax({
                url: "uploadImage",
                data: fomdate,
                type: "POST",
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (result) {
                    if (result.code==-1){
                        alert(result.message);
                    } else {
                        alert(result.message);
                        $("#bookmodal").modal('hide');
                        to_bookpage(currentpage);
                    }
                }
            })
         }else {
            $.ajax({
                url:"updateBook",
                data:{"bookId":bookId,"bookName":bookName,"bookMessage":bookMessage,"money":money,"number":number,"sort":sort},
                type:"post",
                success:function (result) {
                    if (result.code==-1){
                        alert(result.message);
                    } else {
                        alert(result.message);
                        $("#bookmodal").modal('hide');
                        to_bookpage(currentpage);
                    }
                }
            })
         }
    });
    function deleteeBook(booKId) {
        console.log(booKId);
        $.ajax({
            url:"deleteBook",
            data:{"bookId":booKId},
            type:"POST",
            success:function (result) {
                alert(result.message);
                to_bookpage(currentpage);
            }
        })
    }
    //显示上传图片
    function changge(){
        var myimg = document.getElementById("bookImage");
        var inputfile=document.getElementById("file").files[0];
        var reader = new FileReader(); // 图片文件转换为base64
        reader.readAsDataURL(inputfile);//用文件加载器加载文件
        reader.onload = function() { // 显示图片
            myimg.setAttribute('src',reader.result);//file_img是图片展示载体
        }
    }

</script>
</html>
