<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title> ${title}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0,viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
</head>

<body>
${content}


<#list caseList as CaseModel>
    <tr>
        <td>${CaseModel.title}</td>
        <td>${CaseModel.imgs}</td>
        <td>${CaseModel.content}</td>
        <td>${CaseModel.des}</td>

     <#--   <td>
            <a href="/caseInfo?id=${CaseModel.id}"><i class="glyphicon glyphicon-search"></i></a>
        </td>-->
    </tr>
</#list>
</body>
</html>
