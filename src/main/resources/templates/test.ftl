FreeMarker主要核心知识点

字符串输出:
${"Hello ${name} !"} / ${"Hello " + name + " !"}
<#assign cname=r"特殊字符完成输出(http:\www.baidu.com)">
${cname}

字符串截取 ：
通过下标直接获取下标对应的字母： ${name[2]}
起点下标..结尾下标截取字符串：${name[0..5]}

算数运算：
<#-- 支持"+"、"－"、"*"、"/"、"%"运算符 -->
<#assign number1 = 10>
<#assign number2 = 5>
"+" : ${number1 + number2}
"－" : ${number1 - number2}
"*" : ${number1 * number2}
"/" : ${number1 / number2}
"%" : ${number1 % number2}

比较运算符：
<#if number1 + number2 gte 12 || number1 - number2 lt 6>
    "*" : ${number1 * number2}
<#else>
    "/" : ${number1 / number2}
</#if>

内建函数：
<#assign data = "abcd1234">
第一个字母大写：${data?cap_first}
所有字母小写：${data?lower_case}
所有字母大写：${data?upper_case}
<#assign floatData = 12.34>
数值取整数：${floatData?int}
获取集合的长度：${users?size}
时间格式化：${dateTime?string("yyyy-MM-dd")}

空判断和对象集合：
<#if users??>
    <#list users as user >
        ${user.id} - ${user.name}
    </#list>
<#else>
    ${user!"变量为空则给一个默认值"}
</#if>

Map集合：
<#assign mapData={"name":"程序员", "salary":15000}>
直接通过Key获取 Value值：${mapData["name"]}
通过Key遍历Map：
<#list mapData?keys as key>
    Key: ${key} - Value: ${mapData[key]}
</#list>
通过Value遍历Map：
<#list mapData?values as value>
    Value: ${value}
</#list>

List集合：
<#assign listData=["ITDragon", "blog", "is", "cool"]>
<#list listData as value>${value} </#list>

include指令：
引入其他文件：<#include "otherFreeMarker.ftl" />

macro宏指令：
<#macro mo>
    定义无参数的宏macro--${name}
</#macro>
使用宏macro: <@mo />
<#macro moArgs a b c>
    定义带参数的宏macro-- ${a+b+c}
</#macro>
使用带参数的宏macro: <@moArgs a=1 b=2 c=3 />

命名空间：
<#import "login.ftl" as otherFtl>
${otherFtl.otherName}
<@otherFtl.addMethod a=10 b=20 />
<#assign otherName="修改otherFreeMarker.ftl中的otherName变量值"/>
${otherFtl.otherName}
<#assign otherName="修改otherFreeMarker.ftl中的otherName变量值" in otherFtl />
${otherFtl.otherName}

<html>
<head>
    <meta charset="UTF-8"/>
    <style>
        body{
            color: #666666;
        }
        .title{
            font-weight: bold;
            color:#000;
        }
    </style>

</head>
<bod>
    <div style="width: 50%;margin: auto;">
        <h3>${title}</h3>
        <p style="color:#ff0000;">名称:${user.name}</p>
        <div style="color:#ff0000;">年龄:${user.id}</div>
        <br/>
        <div>《FreeMarker语法汇总》</div>
        <!--FreeMarker语法汇总-->
        <!--声明变量cdate="自定义变量"-->
        <div class="title">声明变量cdate="自定义变量"</div>
    <#assign cdate="自定义变量"/>
        <!--条件判断-->
        <div class="title">条件判断</div>
    <#if cdate??>
        <div>${cdate}</div>
    <#else>
       <div>变量未声明</div>
    </#if>
        <!--字符串截取(原始字符串："字符串截取Demo")-->
        <div class="title">字符串截取(原始字符串："字符串截取Demo"</div>
    <#assign str="字符串截取Demo"/>
        <div>截取索引为2的字符:${str[2]}</div>
        <div>截取区间2-5字符串:${str[2..5]}</div>
        <br/>
        <!--算数运算（声明了两个变量a=5,b=8）-->
        <div class="title">算数运算（声明了两个变量a=5,b=8）</div>
    <#assign a=5/>
    <#assign b=8/>
        <div>"+":${a+b}</div>
        <div>"-":${a-b}</div>
        <div>"*":${a*b}</div>
        <div>"/":${a/b}</div>
        <div>"%":${a%b}</div>
        <br/>
        <!--比较运算符-->
        <div class="title">比较运算符</div>
        <!--gte大于等于-->
        <div><#if a gte b>a大于等于b</#if></div>
        <!--lt小于-->
        <div><#if a lt b>a小于b</#if></div>
        <br/>
        <!--内建函数-->
        <div class="title">内建函数</div>
    <#assign HELLO="helloMari"/>
        <div>第一个字母大写:${HELLO?cap_first}</div>
        <div>所有字母小写:${HELLO?lower_case}</div>
        <div>所有字母大写:${HELLO?upper_case}</div>
    <#assign fnum=3.1415926/>
        <div>数值取整(3.1415926):${fnum?int}</div>
        <div>日期格式化:${datetime?string("yyyy-MM-dd")}</div>
        <div>获取列表长度:${peoples?size}</div>
        <br/>
        <!--列表-->
        <div class="title">遍历列表项:</div>
        <ul>
        <#list peoples as people>
            <li>人:${people.name}</li>
        </#list>
        </ul>
        <!--map-->
        <div class="title">遍历Map项key:</div>
        <ul>
        <#list employees?keys as key>
            <li>键:${key}--值:${employees[key].name}</li>
        </#list>
        </ul>
        <div class="title">遍历Map项value:</div>
        <ul>
        <#list employees?values as value>
            <li>值:${value.name}</li>
        </#list>
        </ul>
        <!--声明list集合-->
        <#assign listData=["ITDragon", "blog", "is", "cool"]>

        <!--引入其它ftl模板文件-->
        <div class="title">引入其它ftl模板文件:</div>
        <#include "login.ftl"/>

        <!--宏命令(自定义标签)-->
        <div class="title">宏命令(自定义不带参数的标签)</div>
        <#macro customtag>
            <div>不带参数宏:${title}</div>
        </#macro>
        <!--使用自定义不带参数的宏(标签)-->
        <@customtag/>
        <div class="title">宏命令(自定义带参数的标签)</div>
        <#macro customtagp p0 p1 p2>
            <div>带参数宏:${title}--${p0}--${p1}--${p2}</div>
        </#macro>
        <@customtagp p0="参数0" p1="参数1" p2="参数2"/>

        <!--命名空间-->
        <#import "login.ftl" as other/>
        <div style="color: peru;">${other.otherftl}</div>

    </div>

</bod>
</html>