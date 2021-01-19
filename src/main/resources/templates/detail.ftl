<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>案例详情</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0,viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="../css/iconfont/iconfont.css">
    <link rel="stylesheet" href="../css/scroll.css">
    <link rel="stylesheet" href="../css/lunbo.css">
    <link rel="stylesheet" href="../css/mofangProject.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"/>

</head>
<body>
<div style="width: 1200px; min-width: 1200px; margin: auto">
    <#include "head.ftl" />
    <section class="bignav" id="bignav">
        <div class="left_logo">
            <img src="../images/left_logo.jpg" alt="">
        </div>
        <div class="nav">
            <a href="/index">首页</a>
            <a href="/box" class="active">魔方块</a>
            <a href="/space">魔方空间</a>
        </div>
    </section>
    <section>
        <div id="content" class="detail-content">
            <p class="detail-title"> ${showcaseModel.title}</p>

            ${showcaseModel.content}
        </div>

    </section>

    <#include "foot.ftl" />
</div>
</body>
<script src="../js/jquery-1.7.2.js"></script>
<script src="../js/lubotu.js"></script>
<script src="../js/scroll.js"></script>
<script src="../js/jquery.goup.min.js"></script>
<script src="../js/returnTop.js"></script>
<script src="../js/MiniDialog-es5.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<script type="text/javascript">

    $(function () {

        $(".lubo").lubo({});
    });

</script>

</html>