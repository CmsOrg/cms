<%@ page language="Java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<script>
    $(function () {
        $(function () {
            initTable();
            initDate();
        });

        function doQuery(params) {
            $('#demo-table').bootstrapTable('refresh'); //刷新表格
        }

        function initTable() {
            var url = "user.do?method=listUsers&random=" + Math.random();
            $('#demo-table').bootstrapTable({
                method: 'POST',
                dataType: 'json',
                contentType: "application/x-www-form-urlencoded",
                cache: false,
                striped: true, //是否显示行间隔色
                sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
                url: url,
                height: $(window).height() - 110,
                width: $(window).width(),
                showColumns: true,
                pagination: true,
                queryParams: queryParams,
                minimumCountColumns: 2,
                pageNumber: 1, //初始化加载第一页，默认第一页
                pageSize: 20, //每页的记录行数（*）
                pageList: [10, 25, 50, 100], //可供选择的每页的行数（*）
                uniqueId: "id", //每一行的唯一标识，一般为主键列
                showExport: true,
                exportDataType: 'all',
                responseHandler: responseHandler,
                columns: [{
                    field: '',
                    title: 'Sort No.',
                    formatter: function (value, row, index) {
                        return index + 1;
                    }
                }, {
                    field: 'id',
                    title: 'User ID',
                    align: 'center',
                    valign: 'middle',
                    sortable: true
                }, {
                    field: 'institutionCode',
                    title: 'Institution Code',
                    align: 'center',
                    valign: 'middle',
                    sortable: true
                }, {
                    field: 'institutionName',
                    title: 'Institution Name',
                    align: 'center',
                    valign: 'middle'
                }, {
                    field: 'loginId',
                    title: 'Login Name',
                    align: 'center',
                    valign: 'middle',
                    sortable: true
                }, {
                    field: 'realName',
                    title: 'Real Name',
                    align: 'center',
                    valign: 'middle'
                }, {
                    field: 'createTime',
                    title: 'Create Time',
                    align: 'center',
                    valign: 'left',
                    formatter: function (value, row, index) {
                        return new Date(value).format('yyyy-MM-dd hh:mm:ss');
                    }
                }, {
                    field: 'homeAddress',
                    title: 'Address',
                    align: 'center',
                    valign: 'middle'
                }]
            });
        }

        function initDate() {
            var start = {
                elem: '#startDate',
                format: 'YYYY-MM-DD hh:mm:ss',
                min: laydate.now(-7),
                max: laydate.now(),
                istime: true,
                istoday: false,
                choose: function (datas) {
                    end.min = datas; //开始日选好后，重置结束日的最小日期
                    end.start = datas //将结束日的初始值设定为开始日
                }
            };
            var end = {
                elem: '#endDate',
                format: 'YYYY-MM-DD hh:mm:ss',
                min: laydate.now(-7),
                max: laydate.now(),
                istime: true, //是否开启时间选择
                isclear: true, //是否显示清空
                istoday: true, //是否显示今天
                issure: true, //是否显示确认
                choose: function (datas) {
                    start.max = datas; //结束日选好后，重置开始日的最大日期
                }
            };
            laydate(start);
            laydate(end);
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
                    "rows": res.result,
                    "total": res.totalCount
                };
            } else {
                return {
                    "rows": [],
                    "total": 0
                };
            }
        }
    })
</script>
</head>
<body>
<div class="row">
    <div class="row base-margin" id="query">
        <form class="form-inline" role="form"
              style="float: left; width: 100%" method="post" id="queryForm">
            <div class="form-group">
                <label for="orgCode">部门:</label> <select class="form-control"
                                                         id="orgCode" name="orgCode">
                <option value="">默认选择</option>
            </select>
            </div>
            <div class="form-group">
                <label for="userName">名称:</label> <input type="text"
                                                         class="form-control" name="userName" id="userName"
                                                         placeholder="请输入名称">
            </div>
            <div class="form-group">
                <label>日期:</label> <input placeholder="开始日期"
                                          class="form-control layer-date" id="startDate" name="startDate">
                <input placeholder="结束日期" class="form-control layer-date"
                       id="endDate" name="endDate">
            </div>
            <div class="form-group">
                <button type="button" id="queryBtn" onclick="doQuery();"
                        class="btn btn-primary">查询
                </button>
            </div>
            <div class="form-group btn-right">
                <button type="button" class="btn btn-primary" id="addBtn"
                        onclick="addUser();">新增用户
                </button>
            </div>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <table id="myTable">
        </table>
    </div>
</div>
</body>
</html>