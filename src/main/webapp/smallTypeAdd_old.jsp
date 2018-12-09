<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>小类添加</title>
<!-- 1告诉浏览器不要缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--  2 css -->
<!-- <link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" /> -->
<link href="bower_components/bootswatch/dist/sketchy/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
      <!-- 响应式设计 -->
	<div class="container-fluid" >
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<form method="post"  autocomplete="off" action="smallTypeAdd">
						
						    <div class="form-group row">
								<!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
								<label for="inputBid" class="col-sm-2 col-form-label text-right">大类</label>
								<div class="col-sm-10">
									
									<select name="bid" class="form-control"  id="inputTid">
									
									</select>
								</div>
							</div>
						 
						    <div class="form-group row">
								<!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
								<label for="inputName" class="col-sm-2 col-form-label text-right">小类名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="小类名" name="name"  >
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
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.slim.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">
	//ajax:借助于一个JavaScript来完成http请求和响应
          var xhr=new XMLHttpRequest();
          xhr.open("GET","findAllBigType");//开启报号
          xhr.send();//点击拨打
          xhr.onreadystatechange=function(){
              if (xhr.readyState==4) {//请求完全接收到了
				if (xhr.status==200) {//请求成功了
					//console.dir(xhr.responseText);
					//让字符串种JavaScript代码执行
					eval(xhr.responseText);
				}
			 }
          }
          function fillSel(types){
             for (var i = 0; i < types.length; i++) {
				var op=new Option(types[i].name,types[i].id);
				document.getElementById("inputTid").appendChild(op);
			}
          }
	</script>
</body>
</html>