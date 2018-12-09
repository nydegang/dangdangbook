<%--
    if ( session.getAttribute("hasLogined")==null||!(Boolean) session.getAttribute("hasLogined")){//木有登录
        response.sendRedirect("login.jsp");
        return;
    }
--%>
<%@ page import="com.oraclewdp.ddbookmarket.model.Book" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>书籍编辑</title>
    <!-- 1告诉浏览器不要缩放 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--  2 css -->
    <!-- <link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" /> -->
    <link href="bower_components/bootswatch/dist/darkly/bootstrap.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        .custom-file-label::after {
            content: "浏览666"
        }
    </style>
</head>
<body>
<!-- 响应式设计 -->
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <form method="post" autocomplete="off" action="doBookEdit" enctype="multipart/form-data">
                        <%
                            Book book = (Book) request.getAttribute("book");
                        %>
                        <!--需要把当前编辑的书籍id传递回去，这个值不允许用户修改-->
                        <input type="hidden" name="id" value="<%=book.getId()%>">
                        <div class="form-group row">
                            <!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
                            <label for="inputBid" class="col-sm-2 col-form-label text-right">大类</label>
                            <div class="col-sm-10">

                                <select name="bid" class="form-control" id="inputBid">
                                    <option value="-1">--请选择大类---</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
                            <label for="inputSid" class="col-sm-2 col-form-label text-right">小类</label>
                            <div class="col-sm-10">

                                <select name="sid" class="form-control" id="inputSid">

                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
                            <label for="inputName" class="col-sm-2 col-form-label text-right">书名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputName" placeholder="书名" name="name" value="<%=book.getName()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputPrice" class="col-sm-2 col-form-label text-right">价格</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputPrice" placeholder="价格" name="price" value="<%=book.getPrice()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
                            <label for="inputAuthor" class="col-sm-2 col-form-label text-right">作者</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputAuthor" placeholder="作者" name="author" value="<%=book.getAuthor()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
                            <label for="inputCbs" class="col-sm-2 col-form-label text-right">出版社</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputCbs" placeholder="出版社" name="cbs" value="<%=book.getCbs()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputCbDate" class="col-sm-2 col-form-label text-right">出版日期</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputCbDate" placeholder="出版时间"  name="cbDate" readonly="readonly" value="<%=book.getCbDate()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
                            <label for="inputDescri" class="col-sm-2 col-form-label text-right">简介</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" id="inputDescri" placeholder="出版社" name="descri"><%=book.getDescri()%></textarea>
                            </div>
                        </div>
                        <div class="form-group row">

                            <label for="inputPhoto" class="col-sm-2 col-form-label text-right">图片</label>
                            <div class="col-sm-10">
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="inputPhoto" aria-describedby="inputGroupFileAddon" name="photo">
                                    <label class="custom-file-label" for="inputPhoto">请选择文件</label>

                                </div>
                                <!--让用户看到图片-->
                                <img src="upload/<%=book.getPhoto()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">修改</button>
                            </div>
                        </div>


                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script type="text/javascript">
    //1 用Ajax步骤
    /* var xhr=new XMLHttpRequest();//创建对象
     xhr.open("GET","findAllBigType");//开启报号
     xhr.send();//点击拨打
     xhr.onreadystatechange=function(){//等待
         if (xhr.readyState==4) {//请求完全接收到了
           if (xhr.status==200) {//请求成功了
               //console.dir(xhr.responseText);
               //让字符串种JavaScript代码执行
               eval(xhr.responseText);
           }
        }
     }*/

    function fillSel(types) {
        //填充
        for (var i = 0; i < types.length; i++) {
            var op = new Option(types[i].name, types[i].id);
            document.getElementById("inputBid").appendChild(op);
        }
        //回填时间让以前选中的项选中
        $("#inputBid").val('<%=request.getAttribute("bid")%>');
        //用代码触发change事件，让小类填充
        $("#inputBid").trigger("change");
    }

    function fillSmallSel(types) {
        //添加之前清除以后
        document.getElementById("inputSid").innerHTML = '<option value="-1">--请选择---</option>';
        for (var i = 0; i < types.length; i++) {
            var op = new Option(types[i].name, types[i].id);
            document.getElementById("inputSid").appendChild(op);
        }
        //回填时，把刚才用户选中的选中
        $("#inputSid").val('<%=book.getSid()%>');
    }

    //动态创建script元素
    /* var script=document.createElement("script");
     script.src="findAllBigType";
     document.body.appendChild(script);*/
    //发送Ajax请求去拿大类数据
    $.ajax({
        url: "findAllBigType",
        dataType: "jsonp",
        jsonpCallback: "fillSel"
    });
    //给大类绑定change
    $("#inputBid").change(function () {
        $.ajax({
            url: "findAllSmallType",
            dataType: "jsonp",
            data: "bid=" + $(this).val(),
            jsonpCallback: "fillSmallSel"
        });
    });
</script>
<!-- 一个script标签只能那一次数据 -->
<!-- -<script type="text/javascript"  src="findAllBigType"></script> -->
<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">
    //对那个输入框添加日历控件
    $('#inputCbDate').datepicker({
        language: 'zh-CN',//修改界面语言
        format: 'yyyy-mm-dd',//修改日期格式
        autoclose: true,//让自动关闭
        defaultViewDate: {
            year: new Date().getFullYear() - 3
        }
    });
</script>
</body>
</html>