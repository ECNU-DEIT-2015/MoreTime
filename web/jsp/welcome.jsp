<%--
  Created by IntelliJ IDEA.
  User: quinn_norris
  Date: 2017/10/23
  Time: 下午6:53
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
    <title>MoreTime——首页</title>
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
    <script src="${pageContext.request.contextPath}/js/functions.js"></script><!-- Flot Pie chart -->
    <script src="${pageContext.request.contextPath}/js/sparkline.min.js"></script> <!-- Sparkline - Tiny charts -->
    <script src="${pageContext.request.contextPath}/js/easypiechart.js"></script>
    <script src="${pageContext.request.contextPath}/js/scroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
    <script src="${pageContext.request.contextPath}/js/icheck.js"></script>
    <script src="${pageContext.request.contextPath}/js/scroll.min.js"></script>
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
                    <img class="profile-pic animated"
                         src="${pageContext.request.contextPath}<%= session.getAttribute("headp")%>"/>
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
                <h4 class="m-0"><%= session.getAttribute("username")%>
                </h4>
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
                            <a id="barpl1" href="#" data-toggle="tooltip" title=""
                               class="progress-bar tooltips progress-bar-danger"
                               style="width: 0%;" data-original-title="60%">
                                <span class="sr-only">60% Complete</span>
                            </a>
                        </div>
                    </div>
                    <div id="barpro2" class="side-border" hidden>
                        <small id="barp2">B项目</small>
                        <div class="progress progress-small">
                            <a id="barpl2" href="#" data-toggle="tooltip" title=""
                               class="tooltips progress-bar progress-bar-info"
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
            <li class="active">
                <a href="/welcome"><span class="icon qnicon">&#61713;</span>
                    <span class="menu-item">首页</span>
                </a>
            </li>
            <li>
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
        <!-- Messages Drawer -->
        <!-- Notification Drawer -->

        <div class="block-area" id="jumbotron" style="padding-top:50px">
            <div class="jumbotron tile-light">
                <div class="container">
                    <h1 style="padding-bottom: 20px">不辜负自己在每一天。</h1>
                    <div class="qninfo" style="width: 48%;float: left;">
                        <p style="padding-bottom:20px; padding-top:30px;">
                            在这里你可以规划学习工作计划、创建项目、查看团队的进度、记录生活点滴。用一种全新、简洁且有效的方式，提高工作效率。在这里，我们帮助你达到更高的效率，而更高的效率会给予你更多的时间。</p>
                        <p><a href="/profile" class="btn btn-alt btn-lg" style="margin-left: 180px">进入个人中心</a></p>
                    </div>
                    <div class="qndata" style="width: 49%;float: right;">
                        <div class="listview narrow">
                            <div class="media">
                                <div class="pull-right">
                                    <div class="counts">${days}&nbsp;天</div>
                                </div>
                                <div class="media-body">
                                    <h4>你与MoreTime一起经历了</h4>
                                </div>
                            </div>
                            <div class="media">
                                <div class="pull-right">
                                    <div class="counts">${taskcount}&nbsp;件</div>
                                </div>
                                <div class="media-body">
                                    <h4>MoreTime提醒过你待办事项</h4>
                                </div>
                            </div>
                            <div class="media">
                                <div class="pull-right">
                                    <div class="counts">${cals}&nbsp;项</div>
                                </div>
                                <div class="media-body">
                                    <h4>在这里你一共制定过日程</h4>
                                </div>
                            </div>
                            <div class="media">
                                <div class="pull-right">
                                    <div class="counts">${pros}&nbsp;个</div>
                                </div>
                                <div class="media-body">
                                    <h4>在MoreTime的监督下你工作过项目</h4>
                                </div>
                            </div>
                            <div class="media">
                                <div class="pull-right">
                                    <div class="counts">${subs}&nbsp;条</div>
                                </div>
                                <div class="media-body">
                                    <h4>在这里你提交过项目进度一共有</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="block-area qnpro">
            <div class="tile text-center">
                <div class="p-20">
                    <div id="pros1" class="pie-chart-tiny" data-percent="0">
                        <span class="percent"></span>
                        <span class="pie-title" id="prosn1">待建项目 </span>
                    </div>
                    <div id="pros2" class="pie-chart-tiny" data-percent="0">
                        <span class="percent"></span>
                        <span class="pie-title" id="prosn2">待建项目</span>
                    </div>
                    <div id="pros3" class="pie-chart-tiny" data-percent="0">
                        <span class="percent"></span>
                        <span class="pie-title" id="prosn3">待建项目</span>
                    </div>
                    <div id="pros4" class="pie-chart-tiny" data-percent="0">
                        <span class="percent"></span>
                        <span class="pie-title" id="prosn4">待建项目</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="block-area">
            <div class="tile qnproinner">
                <h2 class="tile-title">最近待办事项 Todo</h2>
                <div class="listview todo-list sortable">
                    <div class="media">
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox">
                                ${tasks.get(0).task}
                            </label>
                        </div>
                    </div>
                    <div class="media">
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox">
                                ${tasks.get(1).task}
                            </label>
                        </div>
                    </div>
                    <div class="media">
                        <div class="checkbox m-0">
                            <label class="t-overflow">
                                <input type="checkbox">
                                ${tasks.get(2).task}
                            </label>
                        </div>
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

<script type="text/javascript">
    $(document).ready(function () {

        $.ajax({
            url: '/getpropes',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {},
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/login";
                else {
                    var sizes = data.object.sizes;
                    var propes = data.object.propes;
                    var pronames = data.object.pronames;

                    for (var i = 0; i < sizes; i++) {
                        $('#prosn' + (i + 1)).html('项目' + (i + 1));
                        $('#pros' + (i + 1)).attr('data-percent', propes[i]);
                    }

                    $('.pie-chart-tiny').easyPieChart({
                        easing: 'easeOutBounce',
                        barColor: 'rgba(255,255,255,0.75)',
                        trackColor: 'rgba(0,0,0,0.3)',
                        scaleColor: 'rgba(255,255,255,0.3)',
                        lineCap: 'square',
                        lineWidth: 4,
                        size: 100,
                        animate: 3000,
                        onStep: function (from, to, percent) {
                            $(this.el).find('.percent').text(Math.round(percent));
                        }
                    });

                    var chart = window.chart = $('.pie-chart-tiny').data('easyPieChart');
                    $('.pie-chart-tiny .pie-title > i').on('click', function () {
                        $(this).closest('.pie-chart-tiny').data('easyPieChart').update(Math.random() * 200 - 100);
                    });

                }
            }
        });


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
            events: [
                {
                    title: 'Hangout with friends',
                    start: new Date(y, m, 1),
                    end: new Date(y, m, 2)
                },
                {
                    title: 'Meeting with client',
                    start: new Date(y, m, 10),
                    allDay: true
                },
                {
                    title: 'Repeat Event',
                    start: new Date(y, m, 18),
                    allDay: true
                },
                {
                    title: 'Semester Exam',
                    start: new Date(y, m, 20),
                    end: new Date(y, m, 23)
                },
                {
                    title: 'Soccor match',
                    start: new Date(y, m, 5),
                    end: new Date(y, m, 6)
                },
                {
                    title: 'Coffee time',
                    start: new Date(y, m, 21),
                },
                {
                    title: 'Job Interview',
                    start: new Date(y, m, 5),
                }
            ],

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
                    "The end date of " + event.title + "has been moved " +
                    dayDelta + " days and " +
                    minuteDelta + " minutes."
                ;

                $('#eventInfo').html(info);


                $('#editEvent #editCancel').click(function () {
                    revertFunc();
                })
            }
        });

        $('body').on('click', '#addEvent', function () {
            var eventForm = $(this).closest('.modal').find('.form-validation');
            eventForm.validationEngine('validate');

            if (!(eventForm).find('.formErrorContent')[0]) {

                //Event Name
                var eventName = $('#eventName').val();

                //Render Event
                $('#calendar').fullCalendar('renderEvent', {
                    title: eventName,
                    start: $('#getStart').val(),
                    end: $('#getEnd').val(),
                    allDay: true,
                }, true); //Stick the event

                $('#addNew-event form')[0].reset()
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
            contentType: false,
            processData: false,
            /*contentType: 'application/x-www-form-urlencoded',*/
            data: formData,
            dataType: "json",
            async: false,
            success: function (data) {
                location.reload(true);
            }
        });
    }

    function convertBase64UrlToBlob(urlData) {

        var bytes = window.atob(urlData.split(',')[1]);        //去掉url的头，并转换为byte

        //处理异常,将ascii码小于0的转换为大于0
        var ab = new ArrayBuffer(bytes.length);
        var ia = new Uint8Array(ab);
        for (var i = 0; i < bytes.length; i++) {
            ia[i] = bytes.charCodeAt(i);
        }

        return new Blob([ab], {type: 'image/jpeg'});
    }

</script>


</body>
</html>

