<%@ page language="Java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>标题</title>
    <link type="text/css" rel="stylesheet"
          href="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet"
          href="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/css/bootstrap-table.css">
    <link type="text/css" rel="stylesheet"
          href="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css">
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/jquery.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/bootstrap-table.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/locale/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/locale/bootstrap-datetimepicker.zh-CN.js"></script>

    <style>
        #main-nav.nav-tabs.nav-stacked > li > a {
            padding: 10px 8px;
            font-size: 12px;
            font-weight: 600;
            color: #4A515B;
            background: #E9E9E9;
            background: -moz-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #FAFAFA),
            color-stop(100%, #E9E9E9));
            background: -webkit-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
            background: -o-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
            background: -ms-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
            background: linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA',
            endColorstr='#E9E9E9');
            -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
            border: 1px solid #D5D5D5;
            border-radius: 4px;
        }

        #main-nav.nav-tabs.nav-stacked > li > a > span {
            color: #4A515B;
        }

        /*定义二级菜单样式*/
        .secondmenu a {
            color: #4A515B;
            margin-left: 20px;
            border-left: #aaa dotted 1px;
        }

        .navbar-static-top {
            background-color: #212121;
            margin-bottom: 5px;
        }

        #content {
            margin-left: 40px;
            font-size: 12px;
        }

        .row {
            width: 100%;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $(".secondmenu a").click(function () {
                var url = $(this).data("url");
                $.get(url, function (data) {
                    $("#content").empty().append(data);
//                    $("#content").empty().hide().append(data).show(200);
                })
            })
        })
    </script>
</head>
<body>
<div class=".container-fluid">
    <div class="row">
        <div class="col-xs-12" style="background: #000; padding: 20px 50px;">
            <span class="h2" style="color: #fff">cms管理系统</span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-2">
            <ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
                <li><a href="#systemSetting" class="nav-header collapsed"
                       data-toggle="collapse"> <i class="glyphicon glyphicon-cog"></i>
                    系统管理 <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                    <ul id="systemSetting" class="nav nav-list collapse secondmenu"
                        style="height: 0px;">
                        <li><a href="#"
                               data-url="<%=request.getContextPath()%>/sys/user/list"><i
                                class="glyphicon glyphicon-user"></i>用户管理</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-th-list"></i>菜单管理</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-asterisk"></i>角色管理</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-edit"></i>修改密码</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-eye-open"></i>日志查看</a></li>
                    </ul>
                </li>
                <li><a href="#"> <i
                        class="glyphicon glyphicon-credit-card"></i> 物料管理
                </a></li>
                <li><a href="#"> <i class="glyphicon glyphicon-globe"></i>
                    分发配置 <span class="label label-warning pull-right">5</span>
                </a></li>
                <li><a href="#"> <i class="glyphicon glyphicon-calendar"></i>
                    图表统计
                </a></li>
                <li><a href="#"> <i class="glyphicon glyphicon-fire"></i>
                    关于系统
                </a></li>
            </ul>
        </div>
        <div class="col-xs-10">
            <div class="row">
                <div class="row base-margin" id="query">
                    <ol class="breadcrumb">
                        <li><strong><span style="color: #27a0d7">用户列表</span></strong></li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-11" id="content"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>