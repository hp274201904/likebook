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
    <link rel="stylesheet" type="text/css" href="static/buy.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="js/jquery-3.1.1.js"></script>
    <title>个人中心</title>
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
        .to_togger{
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            flex-wrap: nowrap;
        }
        .to_togger button{
            width: 72px;
        }
    </style>
</head>
<body>
<!-- 购买模态窗口 -->
<div class="modal" id="open_input_buy" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">购买</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="book-cover">
                    <div class="book-img"><img src=""/>
                    </div>
                    <div class="book-info">
                        <div class="book-base">
                            <div class="book-title"></div>
                            <div class="book-price"></div>
                        </div>
                        <div class="book-state">
                            <p>

                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div><a id="book_bookId"></a></div>
                <div class="book-nums"></div>
                <div>
                    <button type="button" class="btn btn-link btn-sm" data-dismiss="modal">
                        取消
                    </button>
                    <button type="button" class="btn btn-primary btn-sm" id="book_buy_btn">
                        购买
                    </button>
                </div>
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
                            <li class="nav-link"><a class="nav-item" href="selectUser?userName=${user.userName}&password=${user.password}">返回主页</a></li>
                            <li class="nav-link"><a class="nav-item" href="index.jsp">退出登录</a></li>
                        </ul>
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" id="search_input">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="button" id="search_btn">搜索</button>
                        </form>
                    </div>
                </nav>
                <div class="row" style="margin: 20px;">
                    <div class="col-2" style="border:1px solid #cccccc;height:600px;">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">个人信息</a>
                            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">购买记录</a>
                            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">借阅记录</a>
                            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">预约记录</a>
                        </div>
                    </div>
                    <div class="col-9" style="border:1px solid #cccccc;height:600px;margin: auto;">
                        <div  id="v-pills-tabContent">
                            <div class="tab-pane fade show active collapse" id="v-pills-home" >
                                <form class="form-horizontal" id="userinsert" enctype="multipart/form-data" method="post">
                                    <div class="form-group">
                                        <div class="text-center">
                                            <img src="${user.image}" class="rounded" id="bookImage" height="200px" width="200px">
                                        </div>
                                        <label class="col-sm-12" style="margin: 10px 0 1px;" id="addbookimage">
                                            修改头像：<input type="file" id="file" name="file" onchange="changge()">
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label">用户名：
                                        </label>
                                        <div class="col-sm-10">
                                            <input type="text" name="bookid" class="form-control" id="userName"  value="${user.userName}" disabled="disabled">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label">密码：</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="bookname" class="form-control" id="password" value="${user.password}">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label">我的余额：</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="number" class="form-control" id="money" disabled="disabled" value="${user.money}">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label">我的地址：</label>
                                        <div class="col-sm-12">
                                        <div class="to_togger">
                                            <input type="text" name="number" class="form-control" id="address" value="${user.address}" >
                                            <button type="button" class="btn btn-default"  data-dismiss="modal" onclick="window.location.reload()">撤销</button>
                                            <button type="button" class="btn btn-primary" id="update_user_btn">修改</button>
                                        </div>
                                        </div>
                                    </div>
                                </form>

                            </div>
                            <div class="tab-pane fade collapse" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                <%--  显示表格数据--%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-hover" id="book_table">
                                            <thead>
                                            <tr>
                                                <th>用户名</th>
                                                <th>书名</th>
                                                <th>书籍号</th>
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
                            <div class="tab-pane fade collapse" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                <%--  显示表格数据--%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-hover" id="book_table2">
                                            <thead>
                                            <tr>
                                                <th>用户名</th>
                                                <th>书名</th>
                                                <th>书籍号</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade collapse" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                <%--  显示表格数据--%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-hover" id="book_table3">
                                            <thead>
                                            <tr>
                                                <th>书籍名</th>
                                                <th>书籍信息</th>
                                                <th>地址</th>
                                                <th>是否处理</th>
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
    $("#update_user_btn").click(function () {
        var userId=${user.userId}
        var userName=document.getElementById("userName").value;
        var password=document.getElementById("password").value;
        var money=document.getElementById("money").value;
        var address=document.getElementById("address").value;
        if (document.getElementById("file").value ==""){
            $.ajax({
                url:"updateUser",
                data:{"userId":userId,"userName":userName,"password":password,"address":address},
                type:"POST",
                success:function (result) {
                    alert(result.message);
                    window.location.href="selectOneUser?userName="+userName;
                }
            })
        }else {
            var fomdate = new FormData($("#userinsert")[0]);
            fomdate.append("userId",userId);
            fomdate.append("userName",userName);
            fomdate.append("password",password);
            fomdate.append("address",address);
            //MultipartFile file,Integer userId,String userName,String password,String address
            $.ajax({
                url:"updateuserimage",
                data:fomdate,
                type:"post",
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success:function (result) {
                    alert(result.message)
                    window.location.href="selectOneUser?userName="+userName;
                }
            })
        }
        })
    $(function () {
            to_page(1);
            to_borrowPage();
            to_indentPage(1);
    })
    function to_page(pn) {
        var userName="${user.userName}";
        $.ajax({
            url:"selectMyBuyJo",
            data:{"pn":pn,"userName":userName},
            type:"post",
            success:function (result) {
                books_table(result);
                books_info(result);
                books_nav(result);
            }
        })
    }
    function to_borrowPage() {
        var userName="${user.userName}";
        $.ajax({
            url:"selectMyBorrowJo",
            data:{"userName":userName},
            type:"post",
            success:function (result) {
                books_table2(result);
            }
        })
    }
    function to_indentPage(pn) {
        var userName="${user.userName}";
        $.ajax({
            url:"selectMyIndent",
            data:{"pn":pn,"userName":userName},
            type:"POST",
            success:function (result) {
                books_table3(result);
                books_info2(result);
                books_nav2(result);
            }
        })
    }
    //表单数据
    function books_table(result) {
        //清空table表格
        $("#book_table tbody").empty();
        var books = result.list;
        $.each(books, function (index, item) {
            var userNameTd = $("<td></td>").append(item.userName);
            var bookNameTd = $("<td></td>").append(item.bookName);
            var bookIdTd = $("<td></td>").append(item.bookId);
            var buyBtn =$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                    .append("再次购买").click(()=>openBuy(item.bookName));
            $("<tr></tr>").append(userNameTd).append(bookNameTd).append(bookIdTd).append(buyBtn)
                .appendTo("#book_table tbody");
        })
    }
    //表单数据
    function books_table2(result) {
        //清空table表格
        $("#book_table2 tbody").empty();
        $.each(result, function (index, item) {
            var userNameTd = $("<td></td>").append(item.userName);
            var bookNameTd = $("<td></td>").append(item.bookName);
            var bookIdTd = $("<td></td>").append(item.bookId);
            var buyBtn =$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("购买此书").click(()=>returntobuy(item.userBookId,item.bookId,item.returnBook,item.buyBook));
            var retuenBtn = $("<button></button>").addClass("btn btn-info btn-sm return_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-minus"))
                .append("归还").click(()=>returnBBook(item.bookId));
            $("<tr></tr>").append(userNameTd).append(bookNameTd).append(bookIdTd).append(buyBtn).append(retuenBtn)
                .appendTo("#book_table2 tbody");
        })
    }
    //表单数据
    function books_table3(result) {
        //清空table表格
        $("#book_table3 tbody").empty();
        var books = result.list;
        $.each(books, function (index, item) {
            var bookNameTd = $("<td></td>").append(item.bookName);
            var messageTd = $("<td></td>").append(item.message);
            var addressTd = $("<td></td>").append(item.address);
            if (item.complete=='未处理'){
                var completeTd = $("<td></td>").append(item.complete).css({ 'color': 'red'});
            }else {
                var completeTd = $("<td></td>").append(item.complete).css({ 'color': 'green'});
            }
            $("<tr></tr>").append(bookNameTd).append(messageTd).append(addressTd).append(completeTd)
                .appendTo("#book_table3 tbody");
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
    //预约记录分析显示条
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
                to_indentPage(1);
            })
            prePage.click(function () {
                to_indentPage(result.pageNum-1);
            })
        }
        var nextpage=$("<li></li>").append($("<a></a>").append("&raquo;").addClass("page-link"));
        var lastPage=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#").addClass("page-link"));
        if(result.hasNextPage==false){
            nextpage.addClass("page-item disabled");
            lastPage.addClass("page-item disabled");
        }else {
            nextpage.click(function () {
                to_indentPage(result.pageNum+1)
            })
            lastPage.click(function () {
                to_indentPage(result.pages);
            })
        }
        ul.append(firstPage).append(prePage)
        $.each(result.navigatepageNums,function (index,item) {
            var numli=$("<li></li>").append($("<a></a>").append(item).addClass("page-link"));
            if(result.pageNum==item){
                numli.addClass("page-item active")
            }
            numli.click(function () {
                to_indentPage(item)
            })
            ul.append(numli);
        })
        ul.append(nextpage).append(lastPage);
        var nav=$("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area2");
    }
    //分页条数据
    function books_info2(result) {
        $("#page_info_area2").empty();
        $("#page_info_area2").append("当前第"+result.pageNum+"页,总"+result.pages+"页,总"
            +result.total+"条记录");
        currentpage=result.pageNum;
        pages=result.pages;
    }
    //打开购买书籍模态框
    function openBuy(bookName) {
        $.ajax({
            url:"selectOneBook",
            data:{"bookName":bookName},
            type:"POST",
            success:function (result) {
                const modal = document.querySelector("#open_input_buy");
                const img = modal.querySelector('.book-img>img');
                const title = modal.querySelector('.book-title');
                const price = modal.querySelector('.book-price');
                const content = modal.querySelector('.book-state');
                const num = modal.querySelector('.book-nums');
                const bookId=modal.querySelector("#book_bookId");
                img.setAttribute('src', result.object.image); // 封面图URL
                title.innerHTML = result.object.bookName; //  书名
                content.innerHTML = result.object.bookMessage; // 简介
                price.innerHTML = result.object.money; // 价格
                num.innerHTML = result.object.number; // 剩余数量
                bookId.innerHTML=result.object.booKId;
                $("#open_input_buy").modal({
                    backdrop:"static",
                })
            }
        })
    }
    $("#book_buy_btn").click(function () {
        var userName="${user.userName}";
        var bookId=document.getElementById("book_bookId").innerHTML;
        $.ajax({
            url:"buyBook",
            data:{"userName":userName,"bookId":bookId},
            type:"POST",
            success:function (result) {
                if (${user.vip=='是'}){
                    alert("因为你是尊贵VIP，所以你可以享用八折");
                }
                alert(result.message);
                $("#open_input_buy").modal('hide');
                to_page(currentpage);
            }
        })
    })
    function returnBBook(bookId) {
        var userName="${user.userName}";
        $.ajax({
            url:"returnBook",
            data:{"userName":userName,"bookId":bookId},
            type:"POST",
            success:function (result) {
                alert(result.message);
                // window.location.reload();
                to_borrowPage();
            }
        })
    }
    //String userName,Integer userBookId,Integer bookId,String returnBook,String buyBook
    function returntobuy(userBookId,bookId,returnBook,buyBook) {
        var userName="${user.userName}";
        $.ajax({
            url:"borrowToBuy",
            data:{"userName":userName,"userBookId":userBookId,"bookId":bookId,"returnBook":returnBook,"buyBook":buyBook},
            type:"POST",
            success:function (result) {
                alert(result.message);
               to_page(1);
               to_borrowPage();
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
