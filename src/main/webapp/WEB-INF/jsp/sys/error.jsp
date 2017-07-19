<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="zh-CN">
<body>
<span>出现错误</span>
<div id="message"><span class="errorContainer">${exception.message }</span></div>
<div id="upPage"><a href="javascript:history.go(-1)">返回上一页</a></div>

</body>

<html/>