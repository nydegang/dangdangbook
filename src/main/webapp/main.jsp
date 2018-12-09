<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html >
<html>
<head>
    <meta charset="utf-8">
    <title>主页</title>
    <!--本页面采用基于bootstrap的响应式设计-->
    <!-- 1告诉浏览器不要缩放 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--  2 css -->
    <!-- <link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" /> -->
    <link rel="stylesheet" type="text/css" id="themeLink"/>
    <!--
       通常情况下JavaScript放置body结束标签之前，但是这里要避免二次绘制，需要提前到这里
     -->
    <script type="text/javascript" src="bower_components/jquery/dist/jquery.slim.js"></script>
    <script type="text/javascript" src="bower_components/jquery.cookie/jquery.cookie.js"></script>
    <script type="text/javascript">
        //这里切记不要等到文档加载完毕，如果你等到文档加载完毕还是两次绘制，不要$(function(){})
        if ($.cookie("bootstrapTheme")) {//如果用户已经设置过主题，就用它设置的
            $("#themeLink").attr(
                "href",
                "bower_components/bootswatch/dist/"
                + $.cookie("bootstrapTheme") + "/bootstrap.css");

        } else {//如果木有设置过，就用默认
            $("#themeLink").attr("href",
                "bower_components/bootswatch/dist/cerulean/bootstrap.css");
        }
    </script>
</head>
<body>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="#"> <img src="img/dgjy.png" style="height: 40px"/>
                </a>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Link
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="http://example.com"
                               id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
                                link</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </li>
                    </ul>
                    <form class="form-inline">
                        <input class="form-control mr-sm-2" type="text"/>
                        <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                    <ul class="navbar-nav ml-md-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="javascript:void(0)">
                                <select id="themeSel" class="custom-select">
                                    <option>cerulean</option>
                                    <option>cosmo</option>
                                    <option>custom</option>
                                    <option>darkly</option>
                                    <option>flatly</option>
                                    <option>journal</option>
                                    <option>lumen</option>
                                    <option>paper</option>
                                    <option>readable</option>
                                    <option>sandstone</option>
                                    <option>simplex</option>
                                    <option>slate</option>
                                    <option>spacelab</option>
                                    <option>superhero</option>
                                    <option>united</option>
                                    <option>yeti</option>
                                </select>
                            </a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown link</a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="carousel slide" id="carousel-495264">
                        <ol class="carousel-indicators">
                            <li data-slide-to="0" data-target="#carousel-495264" class="active"></li>
                            <li data-slide-to="1" data-target="#carousel-495264"></li>
                            <li data-slide-to="2" data-target="#carousel-495264"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" alt="Carousel Bootstrap First" src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg"/>
                                <div class="carousel-caption">
                                    <h4>First Thumbnail label</h4>
                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi
                                        porta gravida at eget metus. Nullam id dolor id nibh
                                        ultricies vehicula ut id elit.</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" alt="Carousel Bootstrap Second" src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg"/>
                                <div class="carousel-caption">
                                    <h4>Second Thumbnail label</h4>
                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi
                                        porta gravida at eget metus. Nullam id dolor id nibh
                                        ultricies vehicula ut id elit.</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" alt="Carousel Bootstrap Third" src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg"/>
                                <div class="carousel-caption">
                                    <h4>Third Thumbnail label</h4>
                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi
                                        porta gravida at eget metus. Nullam id dolor id nibh
                                        ultricies vehicula ut id elit.</p>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carousel-495264" data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carousel-495264" data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <p class="text-center">
                        南阳德刚版权所有&copy;<a class="btn" href="mailto:22222@qq.com">22222 </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function () {
        $("#themeSel").val($.cookie("bootstrapTheme"));
        $("#themeSel").change(
            function (evt) {
                //console.dir(evt.target);
                /*var op=evt.target.options[evt.target.selectedIndex];
                //console.dir(op.value);
                $("#themeLink").attr("href","bower_components/bootswatch/dist/"+op.value+"/bootstrap.css")*/
                $("#themeLink").attr(
                    "href",
                    "bower_components/bootswatch/dist/"
                    + $(evt.target).val()
                    + "/bootstrap.css");
                $.cookie("bootstrapTheme", $(evt.target).val(), {
                    expires: 30
                });
            });

    });
</script>
</body>
</html>