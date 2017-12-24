<%--
  Created by IntelliJ IDEA.
  User: quinn_norris
  Date: 2017/10/31
  Time: 下午1:18
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
    <title>MoreTime——项目中心</title>
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
    <script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/calendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/feeds.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/functions.js"></script>
    <script src="${pageContext.request.contextPath}/js/sparkline.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/icheck.js"></script>
    <script src="${pageContext.request.contextPath}/js/fileupload.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/easypiechart.js"></script>
    <script src="${pageContext.request.contextPath}/js/charts/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/js/charts/jquery.flot.time.js"></script>
    <script src="${pageContext.request.contextPath}/js/charts/jquery.flot.animator.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/charts/jquery.flot.resize.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/charts/jquery.flot.orderBar.js"></script>
    <script src="${pageContext.request.contextPath}/js/charts/jquery.flot.pie.min.js"></script>
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
            <li>
                <a href="/notepad"><span class="icon qnicon">&#61840;</span>
                    <span class="menu-item">记事笔记</span>
                </a>
            </li>
            <li class="active">
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
        <div class="row">
            <div class="col-md-8">
                <div class="tile" style="margin: 20px;">
                    <h2 class="tile-title">项目进度</h2>
                    <div class="p-10">
                        <div class="m-b-10">
                            <span id="p1">待建项目</span>
                            <div class="progress progress-striped active">
                                <div class="progress-bar" role="progressbar" aria-valuenow="45"
                                     aria-valuemin="0" aria-valuemax="100" id="pl1" style="width: 0%">
                                    <span class="sr-only">45% Complete</span>
                                </div>
                            </div>
                        </div>

                        <div class="m-b-10">
                            <span id="p2">待建项目</span>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-warning" role="progressbar"
                                     aria-valuenow="45" aria-valuemin="0" id="pl2" aria-valuemax="100"
                                     style="width: 0%">
                                    <span class="sr-only">45% Complete</span>
                                </div>
                            </div>
                        </div>

                        <div class="m-b-10">
                            <span id="p3">待建项目</span>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-success" role="progressbar"
                                     aria-valuenow="45" aria-valuemin="0" id="pl3" aria-valuemax="100"
                                     style="width: 0%">
                                    <span class="sr-only">45% Complete</span>
                                </div>
                            </div>
                        </div>

                        <div class="m-b-10">
                            <span id="p4">待建项目</span>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar"
                                     aria-valuenow="45" aria-valuemin="0" id="pl4" aria-valuemax="100"
                                     style="width: 0%">
                                    <span class="sr-only">45% Complete</span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="tile" style="margin: 20px;">
                            <h2 class="tile-title">一周内每日效率</h2>
                            <div class="p-10">
                                <div id="line-chart" class="main-chart" style="height: 190px"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="tile" style="margin: 20px;">
                            <h2 class="tile-title">一周内各项目工作量占比</h2>
                            <div class="p-10">
                                <div id="bar-chart" class="main-chart" style="height: 190px"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="tile" style="margin: 20px; height: 257px;overflow: auto;">
                            <h2 class="tile-title">记事备忘</h2>
                            <div class="tile-config dropdown">
                                <a data-toggle="dropdown" href="" class="tooltips tile-menu" title="Options"></a>
                                <ul class="dropdown-menu pull-right text-right">
                                    <li><a href="">修改备忘录</a></li>
                                </ul>
                            </div>
                            <div class="block-area" id="Panel">
                                <div class="panel panel-default tile">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">在这里写需要记事备忘的名称</h3>
                                    </div>
                                    <div class="panel-body" style="height: 135px;overflow: auto;">
                                        在这里写下你项目中非常重要需要被提醒的事件。 <br/> MoreTime团队会在您下面填写的时间时向您发送短信来提醒您。
                                        <br/><span style="color: #d9534f">此功能暂不开放,请等待更新</span>
                                    </div>
                                    <div class="panel-footer">2017-11-24 16:30</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="tile" style="margin: 20px; height: 257px;overflow: auto;">
                            <h2 class="tile-title">成员贡献</h2>
                            <div class="tile-config dropdown">
                                <a data-toggle="dropdown" href="" class="tooltips tile-menu" title="Options"></a>
                                <ul class="dropdown-menu pull-right text-right" id="piepros">
                                    <li style="cursor: pointer" hidden><a href="javascript:void(0);" onclick="">aaa</a>
                                    </li>
                                    <li style="cursor: pointer" hidden><a href="javascript:void(0);" onclick="">aaa</a>
                                    </li>
                                    <li style="cursor: pointer" hidden><a href="javascript:void(0);" onclick="">aaa</a>
                                    </li>
                                    <li style="cursor: pointer" hidden><a href="javascript:void(0);" onclick="">aaa</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="row">
                                <div class="col-md-8">
                                    <div id="pie-chart" class="main-chart"
                                         style="height: 215px; margin: 7px; margin-left:15px"></div>
                                </div>
                                <div class="col-md-4">
                                    <div style="margin-top: 30px; margin-left:10px" id="cooperson">
                                        <p hidden>合作者1: 28%</p>
                                        <p hidden>合作者2: 28%</p>
                                        <p hidden>合作者3: 28%</p>
                                        <p hidden>合作者4: 28%</p>
                                        <p hidden>合作者5: 28%</p>
                                        <p hidden>合作者6: 28%</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 qnallpro">
                <div class="tile" style="margin: 20px; height: 257px;overflow: auto;">
                    <h2 class="tile-title">我的所有项目</h2>
                    <div class="listview narrow" id="allyourpros">
                    </div>
                </div>
                <div class="tile" style="margin: 20px; height: 503px;overflow: auto;">
                    <h2 class="tile-title">历史提交</h2>
                    <div class="listview narrow" id="hispush">
                    </div>
                </div>
            </div>
        </div>

    </section>
</section>

</body>
<script>

    $(document).ready(function () {

        $.ajax({
            url: '/calendar',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {},
            dataType: "json",
            success: function (data) {
                var com = data.object.com_list;
                for (i = 0; i < 4; i++) {
                    var htmlIn = "<div class=\"media\">\<div class=\"media-body\">\n" +
                        "<small class=\"text-muted\">" + com[i].syear + "/" + com[i].smonth + "/" +
                        com[i].sday + " at " + com[i].shour + ":" + com[i].smin + "</small>\n" +
                        "<br><a class=\"t-overflow\">" + com[i].inners + "</a></div></div>";
                    $(".comingeve").append(htmlIn);
                }
            }
        });

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
                    var colors = data.object.colors;
                    var pronames = data.object.pronames;
                    var pronumbers = data.object.pronumbers;

                    for (var i = 0; i < sizes; i++) {
                        $('#p' + (i + 1)).html(pronames[i] + ' - ' + propes[i] + '%');
                        $('#pl' + (i + 1)).attr('class', 'progress-bar ' + 'progress-bar-' + colors[i]);
                        $('#pl' + (i + 1)).css('width', propes[i] + '%');
                        $('#piepros').children().eq(i).removeAttr('hidden');
                        $('#piepros').children().eq(i).html(pronames[i]);
                        $('#piepros').children().eq(i).attr('onclick', 'drawpies(' + pronumbers[i] + ')');
                    }
                    drawpies(pronumbers[0]);

                }
            }
        });

        $.ajax({
            url: '/getallhissubmit',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {},
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/login";
                else {
                    var sizes = data.object.size;
                    var medias = $('#hispush');
                    for (var i = sizes - 1; i >= 0; i--) {
                        medias.append('<div class="media">\n' +
                            '                            <div class="media-body">\n' +
                            '                                <a class="news-title">' + data.object.time[i] + '&nbsp;&nbsp;&nbsp;&nbsp;' + data.object.person[i] + '&nbsp;&nbsp;&nbsp;&nbsp;工作量:' + data.object.works[i] + '</a>\n' +
                            '                                <div class="clearfix"></div>\n' +
                            '                                <small class="muted">' + data.object.inner[i] + '</small>\n' +
                            '                            </div>\n' +
                            '                        </div>');
                    }
                }
            }
        });

        $.ajax({
            url: '/getallhispro',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {},
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/login";
                else {
                    var sizes = data.object.size;
                    var medias = $('#allyourpros');
                    for (var i = sizes - 1; i >= 0; i--) {
                        medias.append('<div class="media">\n' +
                            '                            <div class="media-body">\n' +
                            '                                <a class="news-title">名称: ' + data.object.names[i] + '</a>\n' +
                            '                                <div class="clearfix"></div>\n' +
                            '                                <small class="muted">人数: ' + data.object.count[i] + '</small>\n' +
                            '                                <small class="muted">时间: ' + data.object.begtime[i] + ' 至 ' + data.object.endtime[i] + '</small>\n' +
                            '                                <small class="muted">状态: ' + data.object.status[i] + '</small>\n' +
                            '                                <small class="muted">\n' +
                            '                                    ' + data.object.info[i] + '\n' +
                            '                                </small>\n' +
                            '                            </div>\n' +
                            '                        </div>');
                    }
                }
            }
        });

        $.ajax({
            url: '/weekdaysallwork',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {},
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/login";
                else {
                    var minpre = data.object.minpre;
                    var maxpre = data.object.maxpre;
                    var olds = data.object.olds;
                    var dates = data.object.dates;
                    var pre = data.object.pre;

                    if ($('#line-chart')[0]) {
                        var d1 = [
                            ["1", olds[6]],
                            ['2', olds[5]],
                            ['3', olds[4]],
                            ['4', olds[3]],
                            ['5', olds[2]],
                            ['6', olds[1]],
                            ['7', olds[0]]
                        ];

                        $.plot('#line-chart', [{
                                data: d1,
                                label: "Data",

                            },],

                            {
                                series: {
                                    lines: {
                                        show: true,
                                        lineWidth: 1,
                                        fill: 0.25,
                                    },

                                    color: 'rgba(255,255,255,0.7)',
                                    shadowSize: 0,
                                    points: {
                                        show: true,
                                    }
                                },

                                yaxis: {
                                    min: minpre,
                                    max: maxpre,
                                    tickColor: 'rgba(255,255,255,0.15)',
                                    tickDecimals: 0,
                                    font: {
                                        lineHeight: 13,
                                        style: "normal",
                                        color: "rgba(255,255,255,0.8)",
                                    },
                                    shadowSize: 0,
                                },
                                xaxis: {
                                    tickColor: 'rgba(255,255,255,0)',
                                    tickDecimals: 0,
                                    font: {
                                        lineHeight: 13,
                                        style: "normal",
                                        color: "rgba(255,255,255,0.8)",
                                    }
                                },
                                grid: {
                                    borderWidth: 1,
                                    borderColor: 'rgba(255,255,255,0.25)',
                                    labelMargin: 10,
                                    hoverable: true,
                                    clickable: true,
                                    mouseActiveRadius: 6,
                                },
                                legend: {
                                    show: false
                                }
                            });

                        $("#line-chart").bind("plothover", function (event, pos, item) {
                            if (item) {
                                var x = item.datapoint[0].toFixed(2),
                                    y = item.datapoint[1].toFixed(2);
                                $("#linechart-tooltip").html(y).css({
                                    top: item.pageY + 5,
                                    left: item.pageX + 5
                                }).fadeIn(200);
                            }
                            else {
                                $("#linechart-tooltip").hide();
                            }
                        });

                        $("<div id='linechart-tooltip' class='chart-tooltip'></div>").appendTo("body");
                    }

                    var xlines = $('#line-chart').children().eq(1).children().eq(0).children();
                    for (var i = 0; i < 7; i++) xlines.eq(i).html(dates[6 - i]);
                    //xlines.eq(6).css("left", "300px");
                    //xlines.eq(5).css("left", "263px");
                }
            }
        });

        barpros();

    });

    function showchangeImage() {
        $('#tEvent').modal('show');
    }

    function changeImage() {
        var headp = $("#headpimage").children().attr("src");
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

    function changeSch() {
        $('#scheve').modal('show');
    }

    function shcevebut() {
        var school = $("#scheveinp").val();
        $.ajax({
            url: '/changeSchool',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                school: school
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/signout";
                else if (data.errorCode == "0")
                    $("#um_school").html(data.object);
            }
        });
    }

    function changeLoc() {
        $('#loceve').modal('show');
    }

    function locevebut() {
        var local = $("#loceveinp").val();
        $.ajax({
            url: '/changeLocal',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                local: local
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/signout";
                else if (data.errorCode == "0")
                    $("#um_local").html(data.object);
            }
        });
    }

    function changeSig() {
        $('#sigeve').modal('show');
    }

    function sigevebut() {
        var sign = $("#sigeveinp").val();
        $.ajax({
            url: '/changeSign',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                sign: sign
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/signout";
                else if (data.errorCode == "0")
                    $("#um_sign").html(data.object);
            }
        });
    }

    function changeEma() {
        $('#emaeve').modal('show');
    }

    function emaevebut() {
        var email = $("#emaeveinp").val();
        $.ajax({
            url: '/changeEmail',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                email: email
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/signout";
                else if (data.errorCode == "0")
                    $("#um_email").html(data.object);
            }
        });
    }

    function changeBgi() {
        $('#bgieve').modal('show');
    }

    function bgievebut() {

        var bgimage = $("#bgimages").children().attr("src");
        var formData = new FormData();
        formData.append("bgimage", convertBase64UrlToBlob(bgimage));
        $.ajax({
            url: '/changeBgimage',
            type: 'post',
            contentType: false,
            processData: false,
            /*contentType: 'application/x-www-form-urlencoded',*/
            data: formData,
            dataType: "json",
            async: false,
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/signout";
                else if (data.errorCode == "0")
                    $("#bgimaging").attr("src", data.object);
            }
        });

    }

    function drawpies(obj) {
        $.ajax({
            url: '/personspie',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                pronumber: obj
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/login";
                else {
                    var sizs = data.object.size;
                    var pieData = [];
                    for (var i = 0; i < sizs; i++)
                        pieData[i] = {data: data.object.pes[i], color: 'rgba(255,255,255,' + (0.15 * (i + 1)) + ')'};
                    if ($('#donut-chart')[0]) {
                        $.plot('#donut-chart', pieData, {
                            series: {

                                pie: {

                                    innerRadius: 0.5,
                                    show: true,
                                    stroke: {
                                        width: 0,

                                    },
                                    fill: 1,
                                    fillColor: {
                                        colors: ['rgba(255, 255, 255, 0.5)', 'rgba(0, 215, 76, 0.8)', 'rgba(255,255,255,0.8)']
                                    }
                                }
                            }
                        });
                    }
                    if ($('#pie-chart')[0]) {
                        $.plot('#pie-chart', pieData, {
                            series: {
                                pie: {
                                    show: true,
                                    stroke: {
                                        width: 0,
                                    },
                                }
                            }
                        });
                    }

                    var showperson = $('#cooperson').children();
                    for (var i = 0; i < 6; i++)
                        showperson.eq(i).attr('hidden', 'hidden');
                    for (var i = 0; i < sizs; i++) {
                        showperson.eq(i).removeAttr('hidden');
                        showperson.eq(i).html(data.object.pernames[i] + ': ' + data.object.pes[i] + '%');
                    }

                }
            }
        });
    }


    function barpros() {

        $.ajax({
            url: '/personsbar',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {},
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/login";
                else {

                    var pronames = data.object.pronames;
                    var allof = data.object.alloftimes;
                    var size = data.object.size;

                    if ($("#bar-chart")[0]) {

                        var data1 = [[0, 0]];
                        for (var i = 1; i <= size; i++)
                            data1[i] = [i, allof[i - 1]];
                        data1[size + 1] = [size + 1, 0];

                        var barData = new Array();

                        barData.push({
                            data: data1,
                            label: 'Product 1',
                            bars: {
                                show: true,
                                barWidth: 0.5,
                                order: 2,
                                fill: 3,
                                lineWidth: 0,
                                fillColor: 'rgba(255,255,255,0.6)'
                            }
                        });

                        //Display graph
                        $.plot($("#bar-chart"), barData, {

                            grid: {
                                borderWidth: 1,
                                borderColor: 'rgba(255,255,255,0.25)',
                                show: true,
                                hoverable: true,
                                clickable: true,
                            },

                            yaxis: {
                                tickColor: 'rgba(255,255,255,0.15)',
                                tickDecimals: 0,
                                font: {
                                    lineHeight: 13,
                                    style: "normal",
                                    color: "rgba(255,255,255,0.8)",
                                },
                                shadowSize: 0,
                            },

                            xaxis: {
                                tickColor: 'rgba(255,255,255,0)',
                                tickDecimals: 0,
                                font: {
                                    lineHeight: 13,
                                    style: "normal",
                                    color: "rgba(255,255,255,0.8)",
                                },
                                shadowSize: 0,
                            },

                            legend: true,
                            tooltip: true,
                            tooltipOpts: {
                                content: "<b>%x</b> = <span>%y</span>",
                                defaultTheme: false
                            }

                        });

                        $("#bar-chart").bind("plothover", function (event, pos, item) {
                            if (item) {
                                var x = item.datapoint[0].toFixed(2),
                                    y = item.datapoint[1].toFixed(2);
                                $("#barchart-tooltip").html(y).css({
                                    top: item.pageY + 5,
                                    left: item.pageX + 5
                                }).fadeIn(200);
                            }
                            else {
                                $("#barchart-tooltip").hide();
                            }
                        });

                        $("<div id='barchart-tooltip' class='chart-tooltip'></div>").appendTo("body");

                    }

                    var xlines = $('#bar-chart').children().eq(1).children().eq(0).children();
                    xlines.eq(0).html("");
                    xlines.eq(size+1).html("");

                }

            }
        });
    }


</script>
</html>

