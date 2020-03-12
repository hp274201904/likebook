<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/24
  Time: 11:44
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
    <title>购买</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            list-style: none;
            user-select: none;
            box-sizing: border-box;
        }
        body,
        html {
            position: relative;
            width: 100vw;
            height: 100vh;
        }
        body {
            display: flex;
            justify-content: center;
        }
        .card {
            margin: 15px;
            width: 200px;
            height: 266px;
            background: #bfc4;
            position: relative;
            overflow: hidden;
            border-radius: 4px;
        }
        .card-img-wrap {
            width: 100%;
            height: 100%;
            background: #eee;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .card-img-wrap img {
            width: 100%;
            height: auto;
        }
        .card-operate {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            background: #ccc7;
            flex-direction: column;
            justify-content: space-evenly;
            align-items: center;
            display: none;
        }
        .card:hover .card-operate {
            display: flex;
        }

        .card:hover {
            box-shadow: 0 5px 10px #9993, 3px 8px 10px #6663,
            -3px 8px 10px #6663;
            transform: translateY(-5px);
            transition: all 0.3s linear;
        }
        /* 以下为样式美化代码，可以自行删改 */
        body {
            background: url('http://s2.hdslb.com/bfs/static/blive/blfe-message-web/static/img/infocenterbg.a1a0d152.jpg')
            /*background: url('Wopop_files/login_bgx.gif')*/
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
    </style>
</head>
<body>
<!-- 购买模态窗口 -->
<div class="modal" id="open_input_buy" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">购买</h5>
                <button type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="book-cover">
                    <div class="book-img">
                        <img
                                src=""
                        />
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
<!-- 借阅模态窗口 -->
<div class="modal" id="open_input_borrow" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">借阅</h5>
                <button type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="book-cover">
                    <div class="book-img">
                        <img
                                src=""
                        />
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
                <div><a id="bbook_bookId"></a></div>
                <div class="book-nums"></div>
                <div>
                    <button type="button" class="btn btn-link btn-sm" data-dismiss="modal">
                        取消
                    </button>
                    <button type="button" class="btn btn-primary btn-sm" id="book_buy_btn1">
                        借阅
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="selectOneUser?userName=${user.userName}"><img src="${user.image}" height="60px" width="60px"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="selectOneUser?userName=${user.userName}">${user.userName}<span class="sr-only"></span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <c:if test="${user.vip=='是'}">
                                    <font color="red">vip</font>
                                </c:if>
                                <c:if test="${user.vip!='是'}">
                                    <font color="gray">vip</font>
                                </c:if>
                            </a>
                        </li>
                        <li class="nav-link"><a class="nav-item" href="selectUser?userName=${user.userName}&password=${user.password}">返回主页</a></li>
                        <li class="nav-link"><a class="nav-item" href="index.jsp">退出登录</a></li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="搜索书籍" aria-label="Search" id="search_input">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="tohomepage()">搜索</button>
                    </form>
                </div>
            </nav>
            <table class="table table-hover" id="book_table">

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
</div>
</body>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>
<script>
    var currentpage;
    var pages;
    var bookName;
    var sort;
    $(function () {
        sort="${sort}";
        bookName="${bookName}";
        if (bookName==""&&sort=="全部"){
            to_page2(1,sort);
        }else if (bookName==""){
            to_page2(1,sort);
        }else {
            to_page3(1,bookName);
        }
    })
    function to_page(pn) {
        $.ajax({
            url:"selectBooks",
            data:"pn="+pn,
            type:"post",
            success:function (result) {
                books_table(result);
                books_info(result);
                books_nav(result);
            }
        })
    }
    function to_page2(pn,sort) {
        $.ajax({
            url:"selectBooks",
            data:"pn="+pn+"&sort="+sort,
            type:"post",
            success:function (result) {
                books_table(result);
                books_info(result);
                books_nav(result);
            }
        })
    }
    function to_page3(pn,bookName) {
        $.ajax({
            url:"selectBooks",
            data:"pn="+pn+"&bookName="+bookName,
            type:"post",
            success:function (result) {
                books_table(result);
                books_info(result);
                books_nav(result);
            }
        })
    }
    //表单数据
    function books_table(result) {
        $("#book_table").empty();
        var books=result.list;
        var path="${pageContext.request.contextPath}";
        $.each(books,function (index,item) {
            var body =
                '<div class="card" style="width: 16rem;float:left; margin:10px 50px 10px 50px;height: 16rem;">' +
                '<img class="card-img-wrap" src="' +
                item.image +
                '" alt="Card image cap" height="254px" width="200px">' +
                '<div class="card-operate">' +
                '<button type="button" class="btn btn-info" style="margin: -10px 30px  0 30px;" onclick="openBuy(' +
                "'"+item.bookName+"'" +
                ')">购买</button>' +
                '<button type="button" class="btn btn-info" style="margin: -10px 0  0 0;" onclick="borrowBook('+
                "'"+item.bookName+"'" +
                ')">借阅</button>' +
                '</div></div>';
            $(body).appendTo("#book_table");
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
            }
        })
    })
    //打开借阅书籍模态框
    function borrowBook(bookName){
        !borrowBook.flag&&alert("每个人都可以借阅5本书籍，每次的借阅需交本书价格的押金和解约费5元，归还书籍将会归还押金！");
        borrowBook.flag=true;
        $.ajax({
            url:"selectOneBook",
            data:{"bookName":bookName},
            type:"POST",
            success:function (result) {
                const modal = document.querySelector("#open_input_borrow");
                const img = modal.querySelector('.book-img>img');
                const title = modal.querySelector('.book-title');
                const price = modal.querySelector('.book-price');
                const content = modal.querySelector('.book-state');
                const num = modal.querySelector('.book-nums');
                const bookId=modal.querySelector("#bbook_bookId");
                img.setAttribute('src', result.object.image); // 封面图URL
                title.innerHTML = result.object.bookName; //  书名
                content.innerHTML = result.object.bookMessage; // 简介
                price.innerHTML = result.object.money; // 价格
                num.innerHTML = result.object.number; // 剩余数量
                bookId.innerHTML=result.object.booKId;
                $("#open_input_borrow").modal({
                    backdrop:"static",
                })
            }
        })
    }
    $("#book_buy_btn1").click(function () {
        var userName="${user.userName}";
        var bookId=document.getElementById("bbook_bookId").innerHTML;
        $.ajax({
            url:"BorrowBook",
            data:{"userName":userName,"bookId":bookId},
            type:"POST",
            success:function (result) {
                alert(result.message);
                $("#open_input_borrow").modal('hide');

            }
        })
    })
    function tohomepage() {
        var search=$("#search_input").val();
        to_page3(1,search);
    }
    function tohomepage2() {
       window.location.href="selectUser?userName=${user.userName}&password=${user.password}";
    }
</script>
</html>

