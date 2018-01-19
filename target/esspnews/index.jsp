<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
</html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <link type="text/css" rel="stylesheet" href="css/search.css">
    <link type="text/css" rel="stylesheet" href="css/base.css">


    <script type="text/javascript" src="/js/lib/jquery/jquery-1.5.2.min.js"></script>

    <title>新闻搜索</title>
</head>
<body>

<div class="logo">
    <a href="index.jsp">
        <img src="/img/baidu.png" alt="新闻搜索" width="270" height="199">
        <h1>基于Elasticsearch的新闻搜索</h1>
    </a>
</div>


    <div class="searchbox">
        <form action="/SearchNews" method="get">
            <input id="query" name="query" class="input_text" autocomplete="off" type="text"/>
            <input value="utf-8" name="enc" type="hidden"/>
            <input value="百度一下" class="input_submit" type="submit"/>
        </form>
    </div>

</body>
</html>
