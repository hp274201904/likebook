<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/5
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
    <script src="js/jquery-3.1.1.js"></script>
</head>
<body>

<form enctype="multipart/form-data" method="post" id="bookform">
    <input type="file"  id="file" name="file" class="txt_input txt_input2">
    <input type="text" id="bookId" name="bookId" class="txt_input txt_input2"  value="6">
    <input type="text" id="bookName" name="bookName" class="txt_input txt_input2"  value="三国演义">
    <input type="text" id="bookMessage" name="bookMessage" class="txt_input txt_input2"  value="四大名著之一">
    <input type="text" id="money" name="money" class="txt_input txt_input2"  value="50">
    <input type="text" id="number" name="number" class="txt_input txt_input2"  value="100">
    <input type="text" id="sort"  name="sort" class="txt_input txt_input2"  value="文学">
    <input type="submit" value="提交" id="sumbit" >
</form>
</body>
<script>
    $("#sumbit").click(function () {
        var bookId=document.getElementById("bookId").value;
        var bookName=document.getElementById("bookName").value;
        var bookMessage=document.getElementById("bookMessage").value;
        var money=document.getElementById("money").value;
        var number=document.getElementById("number").value;
        var sort=document.getElementById("sort").value;

        var fomdate=new FormData($("#bookform")[0]);
        fomdate.append("bookId",bookId);
        fomdate.append("bookName",bookName);
        fomdate.append("bookMessage",bookMessage);
        fomdate.append("money",money);
        fomdate.append("number",number);
        fomdate.append("sort",sort);
        console.log(fomdate);
        //MultipartFile file,Integer bookId,String bookName,String bookMessage,Double money,Integer number,String sort)
        $.ajax({
            url:"uploadImage",
            data:fomdate,
            type:"POST",
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success:function (result) {
                alert(result.message);
            }
        })
    })
</script>
</html>
