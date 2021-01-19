<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>魔方空间</title>
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
            <a href="/index#content">首页</a>
            <a href="/box#content">魔方块</a>
            <a href="/space" class="active">魔方空间</a>
        </div>
    </section>
    <section class="center_cons" id="content">
        <div style="display:block" class="mofangkuai_con navCon">
            <section class="mofangkuai_nav_cons">
                <div class="mofangkuai_nav_con" id="test">

                    <#list caseList as case>
                        <#if (case_index % 2 == 0)>
                            <ul class="chuangyi_ul">
                        </#if>

                        <li onclick="detail(${case.id})">
                            <div>
                                <img src="${case.imgs}" alt="">
                                <p>${case.title}</p>
                            </div>
                        </li>

                        <#if (case_index % 2 == 1 || case_index == caseList?size)>
                            </ul>
                        </#if>


                    </#list>

                </div>
            </section>
        </div>
        <div class="mofang_kongjian navCon">
        </div>
    </section>

    <#include "foot.ftl" />
</div>
</body>
<script src="../js/jquery-1.7.2.js"></script>
<script src="../js/jquery.waterfall.js"></script>
<script src="../js/MiniDialog-es5.min.js"></script>
<script src="../js/lubotu.js"></script>
<script src="../js/jquery.goup.min.js"></script>
<script src="../js/returnTop.js"></script>
<script src="../js/scroll.js"></script>
<script type="text/javascript">

    var current = 2;

    $(function () {

        $(".lubo").lubo({});

        $(window).scroll(function () {
            if ($('#foot').offset().top >= $(window).scrollTop() && $('#foot').offset().top < ($(window).scrollTop() + $(window).height())) {
                // 元素出现在可视区域后要做的事、、、

                if (current !== -1) {
                    var page = {};
                    page.current = current;

                    $.ajax({
                        type: 'POST',
                        url: "/caselist",
                        async: false,
                        data: page,
                        success: function (data) {
                            if (JSON.parse(data).code === "200") {

                                var caseList = JSON.parse(data).data;

                                if (caseList.length != 0) {

                                    var str = "";

                                    $.each(caseList, function (index, val) {
                                        if (index % 2 === 0) {
                                            str += "<ul class=\"chuangyi_ul\">";
                                        }

                                        str += "<li onclick=\"detail(\'" + val.id + "\')\">\n" +
                                            "                            <div>\n" +
                                            "                                <img src=\"" + val.imgs + "\" alt=\"\">\n" +
                                            "                                <p>" + val.title + "</p>\n" +
                                            "                            </div>\n" +
                                            "                        </li>";

                                        if (index % 2 === 1 || index === this.length) {
                                            str += "</ul>";
                                        }

                                    });


                                    $(str).appendTo($("#test"));

                                    // 重新加载标识
                                    if (caseList.length < 8) {
                                        current = -1;
                                    } else {
                                        current += 1;
                                    }

                                } else {
                                    current = -1;
                                }

                            } else {
                                Dialog.info("提示", "网络异常！请稍后再试");
                            }
                        },
                        error: function (e) {
                            console.log(e);
                            Dialog.info("提示", "网络异常！请稍后再试");
                        }
                    });
                }



            } else {
                // 元素离开可视区域后要做的事、、、
            }
        })


    })

    function detail(id) {
        location.href = "/detail/" + id;
    }

</script>
</html>