<%@ page language="Java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script>
    $(function () {
        initTable();
    });

    function doQuery(params) {
        $('#initTable').bootstrapTable('refresh'); //刷新表格
    }

    function initTable() {
        var url = "<%=request.getContextPath()%>/sys/user/list?random=" + Math.random();
        $('#initTable').bootstrapTable({
            method: 'POST',
            dataType: 'json',
            contentType: "application/x-www-form-urlencoded",
            cache: false,
            striped: true, //是否显示行间隔色
            sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
            url: url,
            height: $(window).height() / 3 * 2,
            showColumns: true,
            pagination: true,
            queryParams: queryParams,
            //【其它设置】
            locale: 'zh-CN',//中文支持
            pagination: true,//是否开启分页（*）
            pageNumber: 1,//初始化加载第一页，默认第一页
            pageSize: 3,//每页的记录行数（*）
            pageList: [2, 3, 4],//可供选择的每页的行数（*）
            sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
            showRefresh: true,//刷新按钮

            uniqueId: "id", //每一行的唯一标识，一般为主键列
            showExport: true,
            exportDataType: 'all',
            responseHandler: responseHandler,
            columns: [{
                field: 'id',
                title: 'User ID',
                align: 'center',
                valign: 'middle',
                sortable: true
            }, {
                field: 'username',
                title: '用户名',
                align: 'center',
                valign: 'middle',
                sortable: true
            }, {
                field: 'nickname',
                title: '用户昵称',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'email',
                title: '邮箱',
                align: 'center',
                valign: 'middle',
                sortable: true
            }, {
                field: 'createDate',
                title: '创建时间',
                align: 'center',
                valign: 'left'
            }]
        });
    }


    function queryParams(params) {
        var param = {
            orgCode: $("#orgCode").val(),
            userName: $("#userName").val(),
            startDate: $("#startDate").val(),
            endDate: $("#endDate").val(),
            limit: this.limit, // 页面大小
            offset: this.offset, // 页码
            pageindex: this.pageNumber,
            pageSize: this.pageSize
        }
        return param;
    }
    // 用于server 分页，表格数据量太大的话 不想一次查询所有数据，可以使用server分页查询，数据量小的话可以直接把sidePagination: "server"  改为 sidePagination: "client" ，同时去掉responseHandler: responseHandler就可以了，
    function responseHandler(res) {
        if (res) {
            return {
                "rows": res.rows,
                "total": res.total
            };
        } else {
            return {
                "rows": [],
                "total": 0
            };
        }
    }
</script>
</head>
<body>
<div class="row">
    <form class="form-inline" role="form" method="post" id="queryForm">
        <div class="input-group">
            <div class="input-group-addon">部门:</div>
            <select class="form-control"
                    id="orgCode" name="orgCode">
                <option value="">默认选择</option>
            </select>
        </div>
    </form>
</div>
<div class="row">
    <div class="col-xs-12">
        <table id="initTable">
        </table>
    </div>
</div>