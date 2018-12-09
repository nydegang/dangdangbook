<%@ page import="com.oraclewdp.ddbookmarket.model.Admin" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>登陆</title>
<!-- 1告诉浏览器不要缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--  2 css -->
<!-- <link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" /> -->
<link href="bower_components/bootswatch/dist/darkly/bootstrap.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.BDC_CaptchaImageDiv{
		display: none!important;
	}
</style>
</head>
<body>
<!-- 响应式设计 -->
	<div class="container-fluid" >
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<%--

							Map<String,String> errors= (Map<String, String>) request.getAttribute("errors");
							if (errors!=null){
								Set<String> keySet=errors.keySet();
								for (String key :
										keySet) {
									out.print(key+"---->"+errors.get(key));
								}
							}
						--%>

						<form method="post"  autocomplete="off" action="login" id="loginForm">
						  <%
							  Map<String,String> errors= (Map<String, String>) request.getAttribute("errors");
						      Admin admin =(Admin) request.getAttribute("admin");
						     
						    	if(admin !=null){
						    %>
						    <div class="form-group row">
								<!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
								<label for="inputName" class="col-sm-2 col-form-label text-right">用户名</label>
								<div class="col-sm-10">
									<!--
									   如果有错误，input高亮显示，同时显示错误消息；否则正常得显示
									--->
									 <%
									  if (errors!=null&&errors.get("name")!=null){
									   %>
									 <input type="text" class="form-control is-invalid" id="inputName" placeholder="用户名" name="name"  value="<%=admin.getName()%>">
									  <div class="invalid-feedback">
										 <%=errors.get("name")%>
									  </div>
									<%
									  }else{
									      %>
									<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name"  value="<%=admin.getName()==null?"":admin.getName()%>">

									<%
									  }
									%>




								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>
								<div class="col-sm-10">
									<%
									  if (errors!=null&&errors.get("pwd")!=null){
									 %>
									<input type="password" class="form-control is-invalid" id="inputPwd" placeholder="密码" name="pwd" >
									<div class="invalid-feedback">
										<%=errors.get("pwd")%>
									</div>
									<%
									  }else{
                                     %>
									<input type="password" class="form-control " id="inputPwd" placeholder="密码" name="pwd" >
									<%
									  }
									%>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputVcode" class="col-sm-2 col-form-label text-right">验证码</label>
								<div class="col-sm-5">
									<%if (errors!=null&&errors.get("vcode")!=null){
									    %>
									<input  class="form-control  is-invalid" id="inputVcode" placeholder="验证码" name="vcode">
									<div class="invalid-feedback">
										<%=errors.get("vcode")%>
									</div>
									<%
									}else{
									   %>
									<input  class="form-control" id="inputVcode" placeholder="验证码" name="vcode">
									<%
									}%>
								</div>
								<div class="col-5">
									<img src="vcode.png" id="vcodeImg" title="看不清点击换">
								</div>
								<div class="valid-feedback">
									<%
										if(request.getAttribute("msg")!=null){
									%>
									<%=request.getAttribute("msg")%>
									<%
										}
									%>
								</div>
							</div>
						
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登陆</button>
								</div>
							</div>
						
						    <% 	  
						    	  
						      }else{
						    	  
						    	  %>
						    	<div class="form-group row">
								<!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
								<label for="inputName" class="col-sm-2 col-form-label text-right">用户名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name"  >
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputPwd" placeholder="密码" name="pwd">
								</div>
							</div>

							<div class="form-group row">
								<label for="inputVcode" class="col-sm-2 col-form-label text-right">验证码</label>
								<div class="col-sm-5">
									<input  class="form-control" id="inputVcode" placeholder="验证码" name="vcode">

								</div>
								<div class="col-5">
									<img src="vcode.png" id="vcodeImg" title="看不清点击换">
								</div>
								<div class="valid-feedback">
									<%
										if(request.getAttribute("msg")!=null){
									%>
									<%=request.getAttribute("msg")%>
									<%
										}
									%>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登陆</button>
								</div>
							</div>
						    	  <% 
						      }
						   %>
						</form>  
							
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.slim.js"></script>

	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>

	<script type="text/javascript">
		$(function () {
			$("#vcodeImg").click(function(){
			    //不加入不能换图片
			    $(this).attr("src","vcode.png?t="+Math.random());
			});
        });
	</script>

<!--先导入js-->
<script type="text/javascript" src="bower_components/jquery-validation/dist/jquery.validate.js"></script>
<script type="text/javascript" src="bower_components/jquery-validation/src/localization/messages_zh.js"></script>
<script type="text/javascript">
    $(function () {
        $("#loginForm").validate({
            rules: {//验证规则

                name: {
                    required: true,
                    maxlength: 45,
					minlength:3
                },
                pwd: {
                    required: true,
                    maxlength: 45,
                    minlength:3
                },
				vcode:{
                    required: true,
                    maxlength: 4,
                    minlength:4
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