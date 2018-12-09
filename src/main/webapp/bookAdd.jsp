<%--
    if ( session.getAttribute("hasLogined")==null||!(Boolean) session.getAttribute("hasLogined")){//木有登录
        response.sendRedirect("login.jsp");
        return;
    }
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>书籍添加</title>
    <!-- 1告诉浏览器不要缩放 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--  2 css -->
    <!-- <link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" /> -->
    <link href="bower_components/bootswatch/dist/simplex/bootstrap.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        .custom-file-label::after {
            content: "浏览"
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
                    <form method="post" autocomplete="off" action="bookAdd" enctype="multipart/form-data" id="bookAddForm">

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
                                <input type="text" class="form-control" id="inputName" placeholder="书名" name="name">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputPrice" class="col-sm-2 col-form-label text-right">价格</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputPrice" placeholder="价格" name="price">
                            </div>
                        </div>
                        <div class="form-group row">
                            <!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
                            <label for="inputAuthor" class="col-sm-2 col-form-label text-right">作者</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputAuthor" placeholder="作者" name="author">
                            </div>
                        </div>
                        <div class="form-group row">
                            <!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
                            <label for="inputCbs" class="col-sm-2 col-form-label text-right">出版社</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputCbs" placeholder="出版社" name="cbs">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputCbDate" class="col-sm-2 col-form-label text-right">出版日期</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputCbDate" placeholder="出版时间"
                                       name="cbDate" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group row">
                            <!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
                            <label for="inputDescri" class="col-sm-2 col-form-label text-right">简介</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" id="inputDescri" placeholder="简介"
                                          name="descri"></textarea>
                            </div>
                        </div>
                        <div class="form-group row">

                            <label for="inputPhoto" class="col-sm-2 col-form-label text-right">图片</label>
                            <div class="col-sm-10">
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="inputPhoto"
                                           aria-describedby="inputGroupFileAddon04" name="photo"> <label
                                        class="custom-file-label" for="inputPhoto">请选择文件</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">添加</button>
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

    function fillSel(types) {
        for (var i = 0; i < types.length; i++) {
            var op = new Option(types[i].name, types[i].id);
            document.getElementById("inputBid").appendChild(op);
        }
    }

    function fillSmallSel(types) {
        //添加之前清除以后
        document.getElementById("inputSid").innerHTML = "";
        for (var i = 0; i < types.length; i++) {
            var op = new Option(types[i].name, types[i].id);
            document.getElementById("inputSid").appendChild(op);
        }
    }

    $.ajax({
        url: "findAllBigType",
        dataType: "jsonp",
        jsonpCallback: "fillSel"
    });
    //给大类change
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
<script type="text/javascript"
        src="bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">
    //对那个输入框添加日历控件
    $('#inputCbDate').datepicker({
        language: 'zh-CN',//修改界面语言
        format: 'yyyy-mm-dd',//修改日期格式
        autoclose: true,//让自动关闭
        defaultViewDate: {
            year: new Date().getFullYear() - 18
        }
    });
</script>
<!--先导入js-->
<script type="text/javascript" src="bower_components/jquery-validation/dist/jquery.validate.js"></script>
<!--加上文件验证，它在下面js-->
<script type="text/javascript" src="bower_components/jquery-validation/dist/additional-methods.js"></script>
<script type="text/javascript" src="bower_components/jquery-validation/src/localization/messages_zh.js"></script>
<script type="text/javascript">
    $(function () {
        $("#bookAddForm").validate({
            rules: {//验证规则
                price: {
                    required: true,
                    number: true
                },
                descri: {
                    required: true,
                    maxlength: 120
                },
                photo:{
                    required:true,
                    accept: "image/*"
                }
            },
            messages: {//验证不通过，应该显示的消息,如果不写，用默认消息
                price: {
                    required: "价格必填",
                    number: "必须是数字"
                },
                photo:{
                    accept:"只能是图片"
                }

            },
            errorElement: "div",
            errorClass: "invalid-feedback",//错误消息的样式
            highlight: function (element, errorClass, validClass) {//高亮显示:如果输入框木有通过验证
                $(element).addClass("is-invalid").removeClass(validClass);
                 ///由于bootstrap4不支持label设置样式，因而下面不需要做
                // $(element.form).find("label[for=" + element.id + "]")
                //     .addClass(errorClass);
            },
            unhighlight: function (element, errorClass, validClass) {//取消高亮：如果我们把错误纠正
                $(element).removeClass("is-invalid").addClass(validClass);
                // $(element.form).find("label[for=" + element.id + "]")
                //     .removeClass(errorClass);
            },
            validClass: "is-valid"//指定纠正正确时候输入框的样式
        });
    });
</script>
</body>
</html>