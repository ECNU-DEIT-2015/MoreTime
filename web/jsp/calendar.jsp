<%--
  Created by IntelliJ IDEA.
  User: quinn_norris
  Date: 2017/10/22
  Time: 下午7:30
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
    <script src="${pageContext.request.contextPath}/js/validation/validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/validation/validationEngine.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/calendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/feeds.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/functions.js"></script>
    <script src="${pageContext.request.contextPath}/js/easypiechart.js"></script>
    <script src="${pageContext.request.contextPath}/js/charts.js"></script>
    <script src="${pageContext.request.contextPath}/js/sparkline.min.js"></script>
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
            <li class="active">
                <a class="sa-side-calendar" href="/calendar">
                    <span class="menu-item">今日计划</span>
                </a>
            </li>
            <li>
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

        <div class="block-area" style="height:100px;" id="rememberth">
            <div class="alert alert-dismissable fade in" style="color:#000;">
                <button type="button" class="close" data-dismiss="alert" onclick="disnone()">&times;</button>
                点击某个日期或按压连选多个日期可以在日历上建立日程，点击日历右上角其他按钮可以切换到周／天日历。<br/>
                在周／天日历中将日程拖拽下来即可设置时间。日程不能被删除，当天之后尚未发生的日程会显示在右侧临近事件中。
            </div>
        </div>

        <!-- Breadcrumb -->

        <div style="height: 60px"></div>

        <div class="col-md-8 clearfix">
            <div id="calendar" class="p-relative p-10 m-b-20">
                <!-- Calendar Views -->
                <ul class="calendar-actions list-inline clearfix">
                    <li class="p-r-0">
                        <a data-view="month" href="#" class="tooltips" title="Month">
                            <i class="sa-list-month"></i>
                        </a>
                    </li>
                    <li class="p-r-0">
                        <a data-view="agendaWeek" href="#" class="tooltips" title="Week">
                            <i class="sa-list-week"></i>
                        </a>
                    </li>
                    <li class="p-r-0">
                        <a data-view="agendaDay" href="#" class="tooltips" title="Day">
                            <i class="sa-list-day"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-md-4">
            <h4 class="m-l-5">临近事件 Coming</h4>
            <div class="listview narrow comingeve">
            </div>
        </div>

        <!-- Add event -->
        <div class="modal fade" id="addNew-event">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">添加日程</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-validation" role="form">
                            <div class="form-group">
                                <label for="eventName">日程名称：</label>
                                <input type="text" class="input-sm form-control validate[required]" id="eventName"
                                       placeholder="">
                            </div>

                            <input type="hidden" id="getStart"/>
                            <input type="hidden" id="getEnd"/>
                        </form>
                    </div>

                    <div class="modal-footer">
                        <input type="submit" class="btn btn-info btn-sm" id="addEvent" value="添加事件">
                        <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Resize alert -->
        <div class="modal fade" id="editEvent">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">编辑时间</h4>
                    </div>
                    <div class="modal-body">
                        <div id="eventInfo"></div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">确定</button>
                        <button type="button" class="btn btn-info btn-sm" id="editCancel" data-dismiss="modal">取消
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="qnEvent">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">操作失败</h4>
                    </div>
                    <div class="modal-body">
                        <div id="qnInfo"></div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">关闭</button>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="qnsEvent">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">操作成功</h4>
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

        <br/><br/>

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

<script type="text/javascript">
    var eve = new Array();
    $(document).ready(function () {

        updatingflush();

        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        $('#calendar').fullCalendar({
            header: {
                center: 'title',
                left: 'prev, next',
                right: ''
            },

            selectable: true,
            selectHelper: true,
            editable: true,
            events: eve,

            //On Day Select
            select: function (start, end, allDay) {
                $('#addNew-event').modal('show');
                $('#addNew-event input:text').val('');
                $('#getStart').val(start);
                $('#getEnd').val(end);
            },

            eventResize: function (event, dayDelta, minuteDelta, revertFunc) {
                $('#editEvent').modal('show');

                var info =
                    "日程： " + event.title + " 将会被移动" +
                    dayDelta + "天和" +
                    minuteDelta + "分钟。"
                ;

                $('#eventInfo').html(info);
                updatingflushcome();


                $('#editEvent #editCancel').click(function () {
                    revertFunc();
                })
            },

            eventDrop: function (event, dayDelta, minuteDelta, allDay, revertFunc) {
                //mstp_105_SuperAdmin-150607223311
                $.ajax({
                    url: '/calendar/update',
                    type: 'post',
                    contentType: 'application/x-www-form-urlencoded',
                    data: {
                        inner: event.title,
                        dayup: dayDelta,
                        timeup: minuteDelta
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data.errorCode == "0") {
                            $('#qnsEvent').modal('show');
                            $('#qnsInfo').html('成功修改日程时间');
                            updatingflushcome();
                        }
                        else if (data.errorCode == "1") {
                            $('#qnEvent').modal('show');
                            $('#qnInfo').html('修改日程时间失败');
                            revertFunc();
                        }
                    }
                });


            }

        });

        $('body').on('click', '#addEvent', function () {
            var eventForm = $(this).closest('.modal').find('.form-validation');
            eventForm.validationEngine('validate');
            if (!(eventForm).find('.formErrorContent')[0]) {

                //Event Name
                var eventName = $('#eventName').val();

                //Render Event
                //在这里添加新内容
                $.ajax({
                    url: '/calendar/put',
                    type: 'post',
                    contentType: 'application/x-www-form-urlencoded',
                    data: {
                        inner: eventName,
                        s_day: $('#getStart').val(),
                        e_day: $('#getEnd').val(),
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data.errorCode == "0") {
                            $('#calendar').fullCalendar('renderEvent', {
                                title: eventName,
                                start: $('#getStart').val(),
                                end: $('#getEnd').val(),
                                allDay: true
                            }, true);
                            updatingflushcome();
                        }
                        else if (data.errorCode == "1") {
                            $('#qnEvent').modal('show');
                            $('#qnInfo').html('创建失败，该日程的名称与已存在的日程重复。');
                        }
                    }
                });

                $('#addNew-event form')[0].reset();
                $('#addNew-event').modal('hide');
            }
        });
    });

    //Calendar views
    $('body').on('click', '.calendar-actions > li > a', function (e) {
        e.preventDefault();
        var dataView = $(this).attr('data-view');
        $('#calendar').fullCalendar('changeView', dataView);

        //Custom scrollbar
        var overflowRegular, overflowInvisible = false;
        overflowRegular = $('.overflow').niceScroll();
    });

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

    function disnone() {
        $('#rememberth').css('display','none');
    }

    function updatingflush() {
        $.ajax({
            url: '/calendar',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {},
            dataType: "json",
            async: false,
            success: function (data) {
                var cal = data.object.cal_list;
                for (i = 0; i < cal.length; i++) {
                    eve[i] = {
                        title: cal[i].inners,
                        start: new Date(cal[i].syear, cal[i].smonth, cal[i].sday),
                        end: new Date(cal[i].eyear, cal[i].emonth, cal[i].eday)
                    };
                }
                var com = data.object.com_list;
                for (i = 0; i < com.length; i++) {
                    var htmlIn = "<div class=\"media p-l-5\">\<div class=\"media-body\">\n" +
                        "<small class=\"text-muted\">" + com[i].syear + "/" + com[i].smonth + "/" +
                        com[i].sday + " at " + com[i].shour + ":" + com[i].smin + "</small>\n" +
                        "<br><a class=\"t-overflow\">" + com[i].inners + "</a></div></div>";
                    $(".comingeve").append(htmlIn);
                }
            }
        });
    }

    function updatingflushcome() {
        $.ajax({
            url: '/calendar',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {},
            dataType: "json",
            async: false,
            success: function (data) {
                var com = data.object.com_list;
                $(".comingeve").empty();
                for (i = 0; i < com.length; i++) {
                    var htmlIn = "<div class=\"media p-l-5\">\<div class=\"media-body\">\n" +
                        "<small class=\"text-muted\">" + com[i].syear + "/" + com[i].smonth + "/" +
                        com[i].sday + " at " + com[i].shour + ":" + com[i].smin + "</small>\n" +
                        "<br><a class=\"t-overflow\">" + com[i].inners + "</a></div></div>";
                    $(".comingeve").append(htmlIn);
                }
            }
        });
    }

</script>
</body>
</html>

