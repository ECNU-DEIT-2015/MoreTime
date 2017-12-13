<%--
  Created by IntelliJ IDEA.
  User: quinn_norris
  Date: 2017/10/24
  Time: 下午6:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<head>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="format-detection" content="telephone=no">
    <meta charset="UTF-8">
    <meta name="description" content="Violate Responsive Admin Template">
    <meta name="keywords" content="Super Admin, Admin, Template, Bootstrap">
    <title>日历</title>
    <!-- CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/form.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/calendar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/generics.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/qncss.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/calendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/feeds.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/functions.js"></script>
    <script src="${pageContext.request.contextPath}/js/sparkline.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/editor2.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/icheck.js"></script>
    <script src="${pageContext.request.contextPath}/js/fileupload.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/changeproing.js"></script>


</head>
<body id="skin-blur-violate">
<header id="header" class="media">
    <a href="" id="menu-toggle"></a>
    <a class="logo pull-left" href="/welcome">More Time 1.0</a>
    <div class="media-body">
        <div class="media" id="top-menu">
            <div id="time" class="pull-right">
                <span id="hours"></span>
                :
                <span id="min"></span>
                :
                <span id="sec"></span>
            </div>
        </div>
    </div>
</header>

<div class="clearfix"></div>
<section <%--id="main" class="p-relative" role="main"--%>>
    <!-- Sidebar -->
    <aside id="sidebar">
        <!-- Sidbar Widgets -->
        <div class="side-widgets overflow">
            <!-- Profile Menu -->
            <div class="text-center s-widget m-b-25 dropdown" id="profile-menu">
                <a href="" data-toggle="dropdown">
                    <img class="profile-pic animated" src="${pageContext.request.contextPath}<%= session.getAttribute("headp")%>" />
                </a>
                <ul class="dropdown-menu profile-menu">
                    <li><a href="/profile">个人中心</a> <i class="icon left">&#61903;</i><i class="icon right">&#61815;</i>
                    </li>
                    <li><a href="javascript:void(0);" onclick="showchangeImage()">更换头像</a> <i
                            class="icon left">&#61903;</i><i
                            class="icon right">&#61815;</i></li>
                    <li><a href="/signout">切换用户</a> <i class="icon left">&#61903;</i><i class="icon right">&#61815;</i>
                    </li>
                    <li><a href="/postemail">意见反馈</a> <i class="icon left">&#61903;</i><i
                            class="icon right">&#61815;</i>
                    </li>
                </ul>
                <h4 class="m-0"><%= session.getAttribute("username")%></h4>
            </div>
            <!-- Calendar -->
            <div class="s-widget m-b-25">
                <div id="sidebar-calendar"></div>
            </div>
            <!-- Projects -->
            <div class="s-widget m-b-25">
                <h2 class="tile-title">
                    项目进度
                </h2>
                <div class="s-widget-body">
                    <div id="barpro1" class="side-border" hidden>
                        <small id="barp1">A项目</small>
                        <div class="progress progress-small">
                            <a id="barpl1" href="#" data-toggle="tooltip" title="" class="progress-bar tooltips progress-bar-danger"
                               style="width: 0%;" data-original-title="60%">
                                <span class="sr-only">60% Complete</span>
                            </a>
                        </div>
                    </div>
                    <div id="barpro2" class="side-border" hidden>
                        <small id="barp2">B项目</small>
                        <div class="progress progress-small">
                            <a id="barpl2" href="#" data-toggle="tooltip" title="" class="tooltips progress-bar progress-bar-info"
                               style="width: 0%;" data-original-title="43%">
                                <span class="sr-only">43% Complete</span>
                            </a>
                        </div>
                    </div>
                    <div id="barpro3" class="side-border" hidden>
                        <small id="barp3">C项目</small>
                        <div class="progress progress-small">
                            <a id="barpl3" href="#" data-toggle="tooltip" title=""
                               class="tooltips progress-bar" style="width: 0%;"
                               data-original-title="81%">
                                <span class="sr-only">81% Complete</span>
                            </a>
                        </div>
                    </div>
                    <div id="barpro4" class="side-border" hidden>
                        <small id="barp4">D项目</small>
                        <div class="progress progress-small">
                            <a id="barpl4" href="#" data-toggle="tooltip" title=""
                               class="tooltips progress-bar" style="width: 0%;"
                               data-original-title="10%">
                                <span class="sr-only">10% Complete</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Side Menu -->
        <ul class="list-unstyled side-menu">
            <li>
                <a href="/welcome"><span class="icon qnicon">&#61713;</span>
                    <span class="menu-item">首页</span>
                </a>
            </li>
            <li>
                <a class="sa-side-calendar" href="/calendar">
                    <span class="menu-item">今日计划</span>
                </a>
            </li>
            <li class="active">
                <a href="/notepad"><span class="icon qnicon">&#61840;</span>
                    <span class="menu-item">记事笔记</span>
                </a>
            </li>
            <li>
                <a href="/project"><span class="icon qnicon">&#61804;</span>
                    <span class="menu-item">项目中心</span>
                </a>
            </li>
            <li class="dropdown">
                <a href=""><span class="icon qnicon">&#61890;</span>
                    <span class="menu-item">项目管理</span>
                </a>
                <ul class="list-unstyled menu-item">
                    <li><a href="/newpro" id="qnjpro1">新建项目</a></li>
                    <li><a href="/newpro" id="qnjpro2">新建项目</a></li>
                    <li><a href="/newpro" id="qnjpro3">新建项目</a></li>
                    <li><a href="/newpro" id="qnjpro4">新建项目</a></li>
                </ul>
            </li>

            <li>
                <a href="/postemail"><span class="icon qnicon">&#61880;</span>
                    <span class="menu-item">意见反馈</span>
                </a>
            </li>
            <li>
                <a href="/profile"><span class="icon qnicon">&#61883;</span>
                    <span class="menu-item">个人中心</span>
                </a>
            </li>
        </ul>

    </aside>

    <!-- Content -->
    <section id="content" class="container">

        <!-- Messages Drawer -->
        <div class="qntasks">
            <h3 class="block-title">待办／已办事项</h3>
            <div class="tile">
                <h2 class="tile-title">待办事项 Todo</h2>
                <div class="tile-config dropdown">
                    <a data-toggle="dropdown" href="" class="tile-menu"></a>
                    <ul class="dropdown-menu pull-right text-right">
                        <li id="todo-add"><a href="javascript:void(0);" onclick="addNewTask()">添加一个新事项</a></li>
                        <li id="todo-refresh"><a href="javascript:void(0);" onclick="refreshTask()">刷新待办事项</a></li>
                    </ul>
                </div>
                <div class="listview todo-list sortable t">
                    <div class="media">
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox" id="t1">
                                <span id="task11"></span>
                            </label>
                        </div>
                    </div>
                    <div class="media">
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox" id="t2"/>
                                <span id="task12"></span>
                            </label>
                        </div>
                    </div>
                    <div class="media">
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox" id="t3">
                                <span id="task13"></span>
                            </label>
                        </div>
                    </div>
                    <div class="media">
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox" id="t4">
                                <span id="task14"></span>
                            </label>
                        </div>
                    </div>
                    <div class="media">
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox" id="t5">
                                <span id="task15"></span>
                            </label>
                        </div>
                    </div>
                    <div class="media">
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox" id="t6">
                                <span id="task16"></span>
                            </label>
                        </div>
                    </div>
                    <div class="media">
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox" id="t7">
                                <span id="task17"></span>
                            </label>
                        </div>
                    </div>
                </div>

                <h2 class="tile-title">完成事项 Finish</h2>

                <div class="listview todo-list sortable t2">
                    <div class="media">
                        <div class="list-options">
                            <a href="javascript:void(0);" id="delt21" onclick="deleting2task(this)"
                               class="btn btn-sm"><i class="fa fa-trash-o"></i></a>
                        </div>
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox" checked="checked">
                                <span id="task21"></span>
                            </label>
                        </div>
                    </div>
                    <div class="media">
                        <div class="list-options">
                            <a href="javascript:void(0);" id="delt22" onclick="deleting2task(this)"
                               class="btn btn-sm"><i class="fa fa-trash-o"></i></a>
                        </div>
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox" checked="checked">
                                <span id="task22"></span>
                            </label>
                        </div>
                    </div>
                    <div class="media">
                        <div class="list-options">
                            <a href="javascript:void(0);" id="delt23" onclick="deleting2task(this)"
                               class="btn btn-sm"><i class="fa fa-trash-o"></i></a>
                        </div>
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox" checked="checked">
                                <span id="task23"></span>
                            </label>
                        </div>
                    </div>
                    <div class="media">
                        <div class="list-options">
                            <a href="javascript:void(0);" id="delt24" onclick="deleting2task(this)"
                               class="btn btn-sm"><i class="fa fa-trash-o"></i></a>
                        </div>
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox" checked="checked">
                                <span id="task24"></span>
                            </label>
                        </div>
                    </div>
                    <div class="media">
                        <div class="list-options">
                            <a href="javascript:void(0);" id="delt25" onclick="deleting2task(this)"
                               class="btn btn-sm"><i class="fa fa-trash-o"></i></a>
                        </div>
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox" checked="checked">
                                <span id="task25"></span>
                            </label>
                        </div>
                    </div>
                    <div class="media">
                        <div class="list-options">
                            <a href="javascript:void(0);" id="delt26" onclick="deleting2task(this)"
                               class="btn btn-sm"><i class="fa fa-trash-o"></i></a>
                        </div>
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox" checked="checked">
                                <span id="task26"></span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="qntabs">
            <h3 class="block-title">记事查询</h3>
            <div class="tab-container tile media qnquas">
                <ul class="tab pull-left tab-vertical nav nav-tabs qnquas b">
                    <li class="active"><a href="#home3">致使用者</a></li>
                    <li><a href="#a1">待建1</a></li>
                    <li><a href="#a2">待建2</a></li>
                    <li><a href="#a3">待建3</a></li>
                    <li><a href="#a4">待建4</a></li>
                    <li><a href="#a5">待建5</a></li>
                    <li><a href="#a6">待建6</a></li>
                    <li><a href="#a7">待建7</a></li>
                </ul>

                <div class="tab-content media-body s">
                    <div class="tab-pane active" id="home3">
                        <div class="qntimeing">MoreTime团队：</div>
                        <button type="button" class="close qnbuttondelete" data-dismiss="modal" aria-hidden="true">
                        </button>
                        <br/><br/>
                        <p>使用者您好！
                            <br/><br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;在此页面的左下角是速记笔记，可用于记录任何您想记录的事情，点击保存可以将笔记保存在上方的记事查询中，记事查询最多可以现实7条笔记，点击每个笔记页面的右上角
                            x
                            按钮可以将笔记删除，只有将从前的笔记删除才能显示最新的笔记哦，请合理利用吧！
                            <br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;右侧的待办事项最多可以保存7条事项，已办事项最多可以保存6条事项，点击右上角的 …
                            可以选择添加一条新的事项到待办事项中，选中待办事项中已经结束的事项，再点击 …
                            中的刷新待办事项，就可以把它放在下面的完成事项中里啦，如果你想彻底删除掉这个事项，将鼠标移动到完成事项中，点击显示出的垃圾桶就可以彻底删除一条事项。
                            <br/><br/>
                            祝您使用愉快！</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="qnediter">
            <div class="block-area" id="text-editor">
                <h3 class="block-title qntitlenote">速记笔记</h3>
                <form role="form" class="p-15">
                    <div class="form-group m-b-15">
                        <input type="text" id="inputsavetitle" class="form-control input-sm">
                    </div>

                    <div class="form-group m-b-15">
                        <label>&nbsp;课堂笔记、读后感、开会记录等，这里提供给你用于记录任何事。</label>
                        <div class="wysiwye-editor"></div>
                    </div>

                </form>
            </div>
        </div>

        <!-- Add event -->
        <div class="modal fade" id="addTask">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">添加待办事件</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form">
                            <div class="form-group">
                                <input type="text" class="input-sm form-control validate[required]" id="eventName"
                                       placeholder="TODO">
                            </div>
                        </form>
                    </div>

                    <div class="modal-footer">
                        <input type="submit" class="btn btn-info btn-sm" id="addEvent" onclick="addingTask()"
                               value="添加事件">
                        <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="qnsEvent">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
                        <div id="qnsInfo"></div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">关闭</button>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="tEvent">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">修改头像</h4>
                    </div>
                    <div class="modal-body">
                        <p>图片预览</p>
                        <div class="fileupload fileupload-new" data-provides="fileupload">
                            <div class="fileupload-preview thumbnail form-control"></div>

                            <div>
                            <span class="btn btn-file btn-alt btn-sm">
                                <span class="fileupload-new">选择图片</span>
                                <span class="fileupload-exists">修改</span>
                                <input type="file"/>
                            </span>
                                <a href="#" class="btn fileupload-exists btn-sm" data-dismiss="fileupload">删除</a>
                                <a href="javascript:void(0);" onclick="changeImage()"
                                   class="btn fileupload-exists btn-sm" data-dismiss="fileupload">确认更换</a>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">关闭</button>
                        </button>
                    </div>
                </div>
            </div>
        </div>

    </section>
</section>

</body>
<script>
    $(document).ready(function () {
        var str = "<div class=\"qnsavenotepad btn-group\"><button type=\"button\" class=\"btn btn-default btn-sm btn-small\" title=\"\"  tabindex=\"-1\" onclick='savenotepad()'><span>保存</span></button></div>";
        $(".qnediter .note-help").after(str);
        flashNotepad();
        updateTask();
    });


    function flashNotepad() {

        $.ajax({
            url: '/notepad/loading',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {},
            dataType: "json",
            async: false,
            success: function (data) {
                var not = data.object.not_list;
                for (var i = 0; i < not.length; i++) {
                    var ass = "<div class=\"tab-pane\" id=\"a" + (i + 1) + "\">\n" +
                        "<div class=\"qntimeing\">" + not[i].time + "</div><button type=\"button\" id=\"" + (i + 1) +
                        "d\" class=\"close qnbuttondelete\" onclick='deleteNotpad(this)' data-dismiss=\"modal\" aria-hidden=\"true\">\n" +
                        "&times;</button><br/><p>" + not[i].inners + "</p>\n" +
                        "                    </div>";
                    $(".s").append(ass);
                    $(".b").children().each(function () {
                        if ($(this).children().attr("href") == "#a" + (i + 1))
                            $(this).children().text(not[i].titles);
                    });
                }
            }
        });
    }

    var titles = "";

    function deleteNotpad(obj) {
        var ids = obj.id;
        $(".b").children().each(function () {
            if ($(this).children().attr("href") + "d" == "#a" + ids)
                titles = $(this).children().text();
        });
        if (titles + "d" == "待建" + ids) return;
        $.ajax({
            url: '/notepad/delete',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                titles: titles
            },
            dataType: "json",
            success: function (data) {
                location.reload(true);
            }
        });
    }

    function deleting2task(obj) {
        var ids = obj.id;
        for (var i = 1; i <= 6; i++) {
            if (ids == "delt2" + i) {
                var task = $("#task2" + i).text();
                $.ajax({
                    url: '/task/delete',
                    type: 'post',
                    contentType: 'application/x-www-form-urlencoded',
                    data: {
                        task: task
                    },
                    dataType: "json",
                    success: function (data) {
                        location.reload(true);
                    }
                });
            }
        }
    }


    function savenotepad() {

        var ins = $(".note-editable").children("p");
        var inner = "";
        for (var i = 0; i < ins.length; i++)
            inner += "<p>" + $(ins[i]).html() + "</p>";
        var titles = $("#inputsavetitle").val();
        if (titles == null || titles == "") {
            $('#qnsEvent').modal('show');
            $('#qnsInfo').html('请填写标题');
            return;
        } else if (inner == null || inner == "") {
            $('#qnsEvent').modal('show');
            $('#qnsInfo').html('正文内容不能为空');
            return;
        }
        $.ajax({
            url: '/notepad/save',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                inners: inner,
                titles: titles,
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "1") {
                    $('#qnsEvent').modal('show');
                    $('#qnsInfo').html('该标题与已存在标题重复，请修改后重新保存');
                } else {
                    $('#qnsEvent').modal('show');
                    $('#qnsInfo').html('笔记保存成功');
                    flashNotepad();
                }
            }
        });
    }

    function addNewTask() {
        $('#addTask').modal('show');
    }

    function addingTask() {
        var task = $("#eventName").val();
        $.ajax({
            url: '/task/add',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                task: task
            },
            dataType: "json",
            success: function (data) {
                $('#addTask form')[0].reset();
                $('#addTask').modal('hide');
                updateTask();
            }
        });
    }

    function updateTask() {
        $.ajax({
            url: '/task/loading',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {},
            dataType: "json",
            success: function (data) {
                var task1 = data.object.task1_list;
                var task2 = data.object.task2_list;
                for (var i = 0; i < task1.length; i++)
                    $("#task1" + (i + 1)).html(task1[i]);
                for (var i = 0; i < task2.length; i++)
                    $("#task2" + (i + 1)).html(task2[i]);
            }
        });
    }

    function refreshTask() {

        $.each($('input:checkbox:checked'), function () {
            for (var i = 1; i <= 7; i++) {
                if ($(this).parent().next().attr("id") == "task1" + i) {
                    var task = $(this).parent().next().text();
                    $.ajax({
                        url: '/task/refresh',
                        type: 'post',
                        contentType: 'application/x-www-form-urlencoded',
                        data: {
                            task: task
                        },
                        dataType: "json",
                        success: function (data) {
                            location.reload(true);
                        }
                    });
                }

            }
        });

    }

    function showchangeImage() {
        $('#tEvent').modal('show');
    }

    function changeImage() {
        var headp = $(".thumbnail").children().attr("src");
        var formData = new FormData();
        formData.append("headp", convertBase64UrlToBlob(headp));
        $.ajax({
            url: '/changeHeadp',
            type: 'post',
            contentType:false,
            processData:false,
            /*contentType: 'application/x-www-form-urlencoded',*/
            data: formData,
            dataType: "json",
            async: false,
            success: function (data) {
                location.reload(true);
            }
        });
    }

    function convertBase64UrlToBlob(urlData){

        var bytes=window.atob(urlData.split(',')[1]);        //去掉url的头，并转换为byte

        //处理异常,将ascii码小于0的转换为大于0
        var ab = new ArrayBuffer(bytes.length);
        var ia = new Uint8Array(ab);
        for (var i = 0; i < bytes.length; i++) {
            ia[i] = bytes.charCodeAt(i);
        }

        return new Blob( [ab] , {type : 'image/jpeg'});
    }

</script>
</html>

