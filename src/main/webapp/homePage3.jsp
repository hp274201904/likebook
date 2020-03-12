<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <link rel="stylesheet" type="text/css" href="static/buy.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
        <script src="js/jquery-3.1.1.js"></script>
        <title>首页</title>
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
                /*background: url('Wopop_files/login_bgx.gif')*/
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
        </style>
    </head>

    <body>
        <!-- 充值Modal -->
        <div class="modal fade" id="open_input_money" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">充值</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-6 control-label"
                                >你当前的余额为: ${user.money}</label>
                        </div>
                        <div class="form-group">
                            <label for="input_money" class="col-sm-6 control-label">充值金额为:
                                <input type="text" name="input_money" class="form-control" id="input_money" placeholder="充值金额"/>
                                <span class="help-block"></span>
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="input_money_btn">充值</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 预约Modal -->
        <div class="modal fade" id="open_input_order" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">预约</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="input_money" class="col-sm-10 control-label">地址为:
                                <input type="text" name="input_address" class="form-control" id="input_address" value="${user.address}"/>
                                <span class="help-block"></span>
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="input_money" class="col-sm-10 control-label">书籍名称为:
                                <input type="text" name="input_bookName" class="form-control" id="input_bookName" />
                                <span class="help-block"></span>
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="input_money" class="col-sm-10 control-label">书籍信息为:
                                <textarea   class="form-control" id="input_message"></textarea>
                                <span class="help-block"></span>
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary" id="input_order_btn">预约
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!--充值VIP Modal -->
        <div class="modal fade" id="open_input_VIP" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">VIP</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-6 control-label">当前余额为:${user.money}</label>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-6 control-label">充值VIP需要30元
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary" id="input_VIP_btn">
                            充值
                        </button>
                    </div>
                </div>
            </div>
        </div>
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
                            <div class="book-img">
                                <img src="" />
                            </div>
                            <div class="book-info">
                                <div class="book-base">
                                    <div class="book-title"></div>
                                    <div class="book-price"></div>
                                </div>
                                <div class="book-state">
                                    <p></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div><a id="book_bookId"></a></div>
                        <div class="book-nums"></div>
                        <div>
                            <button
                                type="button"
                                class="btn btn-link btn-sm"
                                data-dismiss="modal"
                            >
                                取消
                            </button>
                            <button
                                type="button"
                                class="btn btn-primary btn-sm"
                                id="book_buy_btn"
                            >
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
                        <button
                            type="button"
                            class="close"
                            data-dismiss="modal"
                            aria-label="Close"
                        >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="book-cover">
                            <div class="book-img">
                                <img src="" />
                            </div>
                            <div class="book-info">
                                <div class="book-base">
                                    <div class="book-title"></div>
                                    <div class="book-price"></div>
                                </div>
                                <div class="book-state">
                                    <p></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div><a id="bbook_bookId"></a></div>
                        <div class="book-nums"></div>
                        <div>
                            <button
                                type="button"
                                class="btn btn-link btn-sm"
                                data-dismiss="modal"
                            >
                                取消
                            </button>
                            <button
                                type="button"
                                class="btn btn-primary btn-sm"
                                id="book_buy_btn1"
                            >
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
                        <a class="navbar-brand" href="selectOneUser?userName=${user.userName}"><img src="${user.image}" height="60px" width="60px"/></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="selectOneUser?userName=${user.userName}">${user.userName}<span class="sr-only"></span></a>
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
                                <li class="nav-link"><a class="nav-item" id="moneyButton">充值</a></li>
                                <li class="nav-link"><a class="nav-item" id="orderButton">预约</a></li>
                                <li class="nav-link"><a class="nav-item" href="index.jsp">退出登录</a></li>
                            </ul>
                            <form class="form-inline my-2 my-lg-0">
                                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" id="search_input"/>
                                <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="tohomepage()">搜索</button>
                            </form>
                        </div>
                    </nav>
                    <!-- 内容主体 -->
                    <div class="row option clearfix">
                        <div class="col-sm-2 column glass type-cover">
                            <div class="book-type">书籍分类</div>
                            <li><a href="tohomePage?userName=${user.userName}&sort=全部&bookName=">全部</a></li>
                            <li><a href="tohomePage?userName=${user.userName}&sort=小说&bookName=">小说</a></li>
                            <li><a href="tohomePage?userName=${user.userName}&sort=漫画&bookName=">漫画</a></li>
                            <li><a href="tohomePage?userName=${user.userName}&sort=科幻&bookName=">科幻</a></li>
                            <li><a href="tohomePage?userName=${user.userName}&sort=文学&bookName=">文学</a></li>
                            <li><a href="tohomePage?userName=${user.userName}&sort=其他&bookName=">其他</a></li>
                        </div>
                        <div class="col-sm-10 column">
                            <div
                                id="carouselExampleIndicators"
                                class="carousel slide"
                                data-ride="carousel"
                                style="height: 300px;overflow: hidden;"
                            >
                                <ol class="carousel-indicators">
                                    <li
                                        data-target="#carouselExampleIndicators"
                                        data-slide-to="0"
                                        class="active"
                                    ></li>
                                    <li
                                        data-target="#carouselExampleIndicators"
                                        data-slide-to="1"
                                    ></li>
                                    <li
                                        data-target="#carouselExampleIndicators"
                                        data-slide-to="2"
                                    ></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img
                                            src="static/logo21.png"
                                            class="d-block w-100"
                                            alt="Wopop_files/logo21.png"
                                        />
                                    </div>
                                    <div class="carousel-item">
                                        <img
                                            src="/bookimage/封面.jpg"
                                            class="d-block w-100"
                                            alt="temporary/bookimage/封面.jpg"
                                        />
                                    </div>
                                    <div class="carousel-item">
                                        <img
                                            src="/bookimage/封面2.jpg"
                                            class="d-block w-100"
                                            alt="temporary/bookimage/封面2.jpg"
                                        />
                                    </div>
                                </div>
                                <a class="carousel-control-prev"
                                   href="#carouselExampleIndicators"
                                    role="button"
                                    data-slide="prev"
                                >
                                    <span
                                        class="carousel-control-prev-icon"
                                        aria-hidden="true"
                                    ></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a
                                    class="carousel-control-next"
                                    href="#carouselExampleIndicators"
                                    role="button"
                                    data-slide="next"
                                >
                                    <span
                                        class="carousel-control-next-icon"
                                        aria-hidden="true"
                                    ></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="option">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a
                                    class="nav-link active"
                                    id="home-tab"
                                    data-toggle="tab"
                                    href="#home"
                                    role="tab"
                                    aria-controls="home"
                                    aria-selected="true"
                                    >热门书籍</a
                                >
                            </li>
                            <li class="nav-item">
                                <a
                                    class="nav-link"
                                    id="profile-tab"
                                    data-toggle="tab"
                                    href="#profile"
                                    role="tab"
                                    aria-controls="profile"
                                    aria-selected="false"
                                    >经典书籍</a
                                >
                            </li>
                            <li class="nav-item">
                                <a
                                    class="nav-link"
                                    id="contact-tab"
                                    data-toggle="tab"
                                    href="#contact"
                                    role="tab"
                                    aria-controls="contact"
                                    aria-selected="false"
                                    >其他书籍</a
                                >
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active cards" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <!-- 热门书籍存放处 -->
                                <div class="card" style="width: 16rem;">
                                    <img class="card-img-top" src="/bookimage/三体1.jpg" alt="Card image cap"/>
                                    <div class="card-body">
                                        <h5 class="card-title">三体1</h5>
                                        <p class="card-text">荣获雨果奖的科幻小说</p>
                                        <button type="button" class="btn btn-primary" onclick="openBuy('三体1')">购买</button>
                                        <button type="button" class="btn btn-primary" onclick="borrowBook('三体1')">借阅</button>
                                    </div>
                                </div>
                                <div class="card" style="width: 16rem;">
                                    <img
                                        class="card-img-top"
                                        src="/bookimage/三体2.jpg"
                                        alt="Card image cap"
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">三体2</h5>
                                        <p class="card-text">
                                            荣获雨果奖的科幻小说
                                        </p>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="openBuy('三体2')"
                                        >
                                            购买
                                        </button>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="borrowBook('三体2 ')"
                                        >
                                            借阅
                                        </button>
                                    </div>
                                </div>
                                <div class="card" style="width: 16rem;">
                                    <img
                                        class="card-img-top"
                                        src="/bookimage/三体3.jpg"
                                        alt="Card image cap"
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">三体3</h5>
                                        <p class="card-text">
                                            荣获雨果奖的科幻小说
                                        </p>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="openBuy('三体3')"
                                        >
                                            购买
                                        </button>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="borrowBook('三体3')"
                                        >
                                            借阅
                                        </button>
                                    </div>
                                </div>
                                <div class="card" style="width: 16rem;">
                                    <img class="card-img-top" src="/bookimage/流浪地球.jpeg" alt="Card image cap"/>
                                    <div class="card-body">
                                        <h5 class="card-title">流浪地球</h5>
                                        <p class="card-text">改编的电影票房冠军</p>
                                        <button type="button" class="btn btn-primary" onclick="openBuy('流浪地球')">购买</button>
                                        <button type="button" class="btn btn-primary" onclick="borrowBook('流浪地球')">借阅</button>
                                    </div>
                                </div>
                            </div>
                            <!-- 经典书籍存放处 -->
                            <div
                                class="tab-pane fade cards"
                                id="profile"
                                role="tabpanel"
                                aria-labelledby="profile-tab"
                            >
                                <!-- 书籍存放处 -->
                                <div class="card" style="width: 16rem;">
                                    <img
                                        class="card-img-top"
                                        src="/bookimage/三国演义.jpg"
                                        alt="Card image cap"
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">三国演义</h5>
                                        <p class="card-text">四大名著之一</p>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="openBuy('三国演义')"
                                        >
                                            购买
                                        </button>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="borrowBook('三国演义')"
                                        >
                                            借阅
                                        </button>
                                    </div>
                                </div>
                                <div class="card" style="width: 16rem;">
                                    <img
                                        class="card-img-top"
                                        src="/bookimage/孙子兵法.jpg"
                                        alt="Card image cap"
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">孙子兵法</h5>
                                        <p class="card-text">
                                            中国现存最早的兵书
                                        </p>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="openBuy('孙子兵法')"
                                        >
                                            购买
                                        </button>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="borrowBook('孙子兵法')"
                                        >
                                            借阅
                                        </button>
                                    </div>
                                </div>
                                <div class="card" style="width: 16rem;">
                                    <img
                                        class="card-img-top"
                                        src="/bookimage/宋词三百首.jpg"
                                        alt="Card image cap"
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">宋词三百首</h5>
                                        <p class="card-text">唐诗宋词的宋词</p>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="openBuy('宋词三百首')"
                                        >
                                            购买
                                        </button>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="borrowBook('宋词三百首')"
                                        >
                                            借阅
                                        </button>
                                    </div>
                                </div>
                                <div class="card" style="width: 16rem;">
                                    <img
                                        class="card-img-top"
                                        src="/bookimage/红楼梦.jpg"
                                        alt="Card image cap"
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">红楼梦</h5>
                                        <p class="card-text">四大名著之一</p>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="openBuy('红楼梦')"
                                        >
                                            购买
                                        </button>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="borrowBook('红楼梦')"
                                        >
                                            借阅
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!-- 其他书籍存放处 -->
                            <div
                                class="tab-pane fade cards"
                                id="contact"
                                role="tabpanel"
                                aria-labelledby="contact-tab"
                            >
                                <!-- 书籍存放处 -->
                                <div class="card" style="width: 16rem;">
                                    <img
                                        class="card-img-top"
                                        src="/bookimage/原则.jpg"
                                        alt="Card image cap"
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">原则</h5>
                                        <p class="card-text">
                                            跨年演讲时推荐的书
                                        </p>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="openBuy('原则')"
                                        >
                                            购买
                                        </button>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="borrowBook('原则')"
                                        >
                                            借阅
                                        </button>
                                    </div>
                                </div>
                                <div class="card" style="width: 16rem;">
                                    <img
                                        class="card-img-top"
                                        src="/bookimage/茶道.jpg"
                                        alt="Card image cap"
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">茶道</h5>
                                        <p class="card-text">
                                            让你知道什么是茶道
                                        </p>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="openBuy('茶道')"
                                        >
                                            购买
                                        </button>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="borrowBook('茶道')"
                                        >
                                            借阅
                                        </button>
                                    </div>
                                </div>
                                <div class="card" style="width: 16rem;">
                                    <img
                                        class="card-img-top"
                                        src="/bookimage/蒙台梭利的家庭教育法.jpg"
                                        alt="Card image cap"
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">
                                            蒙台梭利的家庭教育法
                                        </h5>
                                        <p class="card-text">
                                            别人是如何教育孩子的
                                        </p>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="openBuy('蒙台梭利的家庭教育法')"
                                        >
                                            购买
                                        </button>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="borrowBook('蒙台梭利的家庭教育法')"
                                        >
                                            借阅
                                        </button>
                                    </div>
                                </div>
                                <div class="card" style="width: 16rem;">
                                    <img
                                        class="card-img-top"
                                        src="/bookimage/钢铁是怎样炼成的.jpg"
                                        alt="Card image cap"
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">
                                            钢铁是怎样炼成的
                                        </h5>
                                        <p class="card-text">世界名著之一</p>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="openBuy('钢铁是怎样炼成的')"
                                        >
                                            购买
                                        </button>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="borrowBook('钢铁是怎样炼成的')"
                                        >
                                            借阅
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"
    ></script>
    <script>
        $('#moneyButton').click(function() {
            //弹出模态框
            $('#open_input_money').modal({
                backdrop: 'static'
            });
        });
        $('#input_money_btn').click(function() {
            var userName = '${user.userName}';
            var money = document.getElementById('input_money').value;
            $.ajax({
                url: 'rechargeMoney',
                data: { userName: userName, money: money },
                type: 'POST',
                success: function(result) {
                    $('#open_input_money').modal('hide');
                    window.location.reload();
                }
            });
        });
        $('#orderButton').click(function() {
            //弹出模态框
            $('#open_input_order').modal({
                backdrop: 'static'
            });
        });
        $('#input_order_btn').click(function() {
            var userName = '${user.userName}';
            var bookName = document.getElementById('input_bookName').value;
            var message = document.getElementById('input_message').value;
            var address = document.getElementById('input_address').value;
            $.ajax({
                url: 'insertIndent',
                data: {
                    userName: userName,
                    bookName: bookName,
                    message: message,
                    address: address
                },
                type: 'POST',
                success: function(result) {
                    alert(result.message);
                    $('#open_input_order').modal('hide');
                }
            });
        });
        function VIP() {
            $('#open_input_VIP').modal({
                backdrop: 'static'
            });
        }
        $('#input_VIP_btn').click(function() {
            var userName = '${user.userName}';
            $.ajax({
                url: 'rechargeVip',
                data: { userName: userName },
                type: 'POST',
                success: function(result) {
                        alert(result.message);
                        $('#open_input_VIP').modal('hide');
                        window.location.reload();
                }
            });
        });
        function tohomepage() {
            var search = $('#search_input').val();
            window.location.href =
                'tohomePage?userName=${user.userName}&sort=全部&bookName=' +
                search;
        }
        //打开购买书籍模态框
        function openBuy(bookName) {
            $.ajax({
                url: 'selectOneBook',
                data: { bookName: bookName },
                type: 'POST',
                success: function(result) {
                    const modal = document.querySelector('#open_input_buy');
                    const img = modal.querySelector('.book-img>img');
                    const title = modal.querySelector('.book-title');
                    const price = modal.querySelector('.book-price');
                    const content = modal.querySelector('.book-state');
                    const num = modal.querySelector('.book-nums');
                    const bookId = modal.querySelector('#book_bookId');
                    img.setAttribute('src', result.object.image); // 封面图URL
                    title.innerHTML = result.object.bookName; //  书名
                    content.innerHTML = result.object.bookMessage; // 简介
                    price.innerHTML = result.object.money; // 价格
                    num.innerHTML = result.object.number; // 剩余数量
                    bookId.innerHTML = result.object.booKId;
                    $('#open_input_buy').modal({
                        backdrop: 'static'
                    });
                }
            });
        }
        $('#book_buy_btn').click(function() {
            var userName = '${user.userName}';
            var bookId = document.getElementById('book_bookId').innerHTML;
            $.ajax({
                url: 'buyBook',
                data: { userName: userName, bookId: bookId },
                type: 'POST',
                success: function(result) {
                    if (${user.vip== '是'}) {
                        alert('因为你是尊贵VIP，所以你可以享用八折');
                    }
                    alert(result.message);
                    $("#open_input_buy").modal('hide');
                }
            });
        });
        //打开借阅书籍模态框
        function borrowBook(bookName) {
            !borrowBook.flag && alert('每个人都可以借阅5本书籍，每次的借阅需交本书价格的押金和解约费5元，归还书籍将会归还押金！');
            borrowBook.flag = true;
            $.ajax({
                url: 'selectOneBook',
                data: { bookName: bookName },
                type: 'POST',
                success: function(result) {
                    const modal = document.querySelector('#open_input_borrow');
                    const img = modal.querySelector('.book-img>img');
                    const title = modal.querySelector('.book-title');
                    const price = modal.querySelector('.book-price');
                    const content = modal.querySelector('.book-state');
                    const num = modal.querySelector('.book-nums');
                    const bookId = modal.querySelector('#bbook_bookId');
                    img.setAttribute('src', result.object.image); // 封面图URL
                    title.innerHTML = result.object.bookName; //  书名
                    content.innerHTML = result.object.bookMessage; // 简介
                    price.innerHTML = result.object.money; // 价格
                    num.innerHTML = result.object.number; // 剩余数量
                    bookId.innerHTML = result.object.booKId;
                    $('#open_input_borrow').modal({
                        backdrop: 'static'
                    });
                }
            });
        }
        $('#book_buy_btn1').click(function() {
            var userName = '${user.userName}';
            var bookId = document.getElementById('bbook_bookId').innerHTML;
            $.ajax({
                url: 'BorrowBook',
                data: { userName: userName, bookId: bookId },
                type: 'POST',
                success: function(result) {
                    alert(result.message);
                    $("#open_input_borrow").modal('hide');
                }
            });
        });
    </script>
</html>
