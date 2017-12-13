<%--
  Created by IntelliJ IDEA.
  User: quinn_norris
  Date: 2017/10/31
  Time: 上午8:02
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
    <title>MoreTime-我的项目</title>
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
    <script src="${pageContext.request.contextPath}/js/validation/validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/validation/validationEngine.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/calendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/feeds.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sparkline.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/fileupload.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/easypiechart.js"></script>
    <%--<script src="${pageContext.request.contextPath}/js/charts.js"></script>--%>
    <script src="${pageContext.request.contextPath}/js/changeproing.js"></script>
    <script src="${pageContext.request.contextPath}/js/select.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/charts/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/js/charts/jquery.flot.pie.min.js"></script>

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
            <li>
                <a href="/project"><span class="icon qnicon">&#61804;</span>
                    <span class="menu-item">项目中心</span>
                </a>
            </li>
            <li class="dropdown active">
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
    <section id="content" class="container qnbigb">
        <input type="hidden" value="${pronumber}" id="pronumber">
        <input type="hidden" value="${phone}" id="phone">
        <input type="hidden" value="${count}" id="count">
        <input type="hidden" value="${toteltimes}" id="toteltimes">
        <input type="hidden" value="${persons}" id="persons">
        <div class="jumbotron tile-light">
            <div class="container">
                <h2 style="display:inline-block;">${name}</h2>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small>人数:&nbsp;&nbsp;${count}</small>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small>时间:&nbsp;&nbsp;${begtime}&nbsp;&nbsp; 至
                &nbsp;&nbsp;${endtime}</small>
            </div>
            <small id="processs" style="display:inline-block;">当前进度: 90%</small>
            <div id="prosing" class="progress progress-striped active" style="display:inline-block;">
                <div id="progressgin" class="progress-bar progress-bar-${color}" role="progressbar" aria-valuenow="45"
                     aria-valuemin="0" aria-valuemax="100"
                     style="width: 0%">
                    <span class="sr-only">45% Complete</span>
                </div>
            </div>
        </div>

        <div class="text-center profile-summary">
            <button class="btn btn-sm" onclick="subnewproess()">提交新的项目进度</button>&nbsp;&nbsp;
            <button class="btn btn-sm" onclick="endprocess()">项目已完成结项</button>&nbsp;&nbsp;
            <button class="btn btn-sm hidden-xs" onclick="delprocess()">删除并回收此项目</button>
        </div>

        <div class="row">
            <div class="col-md-8">
                <div class="tile" style="margin: 20px;height: 277px">
                    <h2 class="tile-title">近期效率</h2>
                    <div class="tile-config dropdown">
                        <a data-toggle="dropdown" href="" class="tooltips tile-menu" title="Options"></a>
                        <ul class="dropdown-menu pull-right text-right" id="workslistper">
                            <li><a href="javascript:void(0);" onclick="drawLines(null)">全部</a></li>
                            <li hidden><a href="javascript:void(0);" onclick="drawLines(this)">合作者1</a></li>
                            <li hidden><a href="javascript:void(0);" onclick="drawLines(this)">合作者2</a></li>
                            <li hidden><a href="javascript:void(0);" onclick="drawLines(this)">合作者3</a></li>
                            <li hidden><a href="javascript:void(0);" onclick="drawLines(this)">合作者4</a></li>
                            <li hidden><a href="javascript:void(0);" onclick="drawLines(this)">合作者5</a></li>
                            <li hidden><a href="javascript:void(0);" onclick="drawLines(this)">合作者6</a></li>
                            <li hidden><a href="javascript:void(0);" onclick="drawLines(this)">合作者5</a></li>
                            <li hidden><a href="javascript:void(0);" onclick="drawLines(this)">合作者6</a></li>

                        </ul>
                    </div>
                    <div class="p-10">
                        <div id="line-chart" class="main-chart" style="height: 230px"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="tile" style="margin: 20px; height: 277px;overflow: auto;">
                    <h2 class="tile-title">项目信息</h2>
                    <div class="p-10 qnbhk">
                        <div><h4>名称: </h4>&nbsp;&nbsp;&nbsp;<p>${name}</p></div>
                        <div><h4>简介: </h4>&nbsp;&nbsp;&nbsp;<p>${info}</p>
                        </div>
                        <div><h4>队伍: </h4>&nbsp;&nbsp;&nbsp;<p id="coofriend"></p></div>
                        <div><h4>时限: </h4>&nbsp;&nbsp;&nbsp;<p>${begtime}&nbsp;&nbsp; 至 &nbsp;&nbsp;${endtime}</p></div>
                    </div>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
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
            <div class="col-md-4">
                <div class="tile" style="margin: 20px; height: 257px;overflow: auto;">
                    <h2 class="tile-title">成员贡献</h2>
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
            <div class="col-md-4">
                <div class="tile" style="margin: 20px; height: 257px;overflow: auto;">
                    <h2 class="tile-title">历史提交</h2>
                    <div class="listview narrow" id="hispush">
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

        <div class="modal fade" id="subeve">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">提交新的项目进度</h4>
                    </div>
                    <div class="modal-body">
                        <div>
                            <div class="form-horizontal" role="form">
                                <div class="row qnlist">
                                    <label for="inputName1" class="col-md-2 control-label">完成工作量</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control input-sm" id="times" placeholder="">
                                    </div>
                                </div>
                                <div class="row qnlist" id="custom-select">
                                    <label for="inputName1" class="col-md-2 control-label">完成成员</label>
                                    <div class="col-md-9">
                                        <select class="select">
                                            <option  id="sel1" style="display: none;"></option>
                                            <option selected="selected" id="sel2" style="display: none;"></option>
                                            <option id="sel3" style="display: none;"></option>
                                            <option id="sel4" style="display: none;"></option>
                                            <option id="sel5" style="display: none;"></option>
                                            <option id="sel6" style="display: none;"></option>
                                            <option id="sel7" style="display: none;"></option>
                                            <option id="sel8" style="display: none;"></option>
                                        </select>
                                    </div>
                                    <%--<label for="inputName1" class="col-md-2 control-label">完成此工作的成员名称</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control input-sm" id="oneperson"
                                               placeholder="限填1人">
                                    </div>--%>
                                </div>
                                <div class="row qnlist ">
                                    <label for="inputName1" class="col-md-2 control-label">工作内容</label>
                                    <div class="col-md-9">
                                        <textarea rows="5" class="form-control auto-size input-sm" id="hisinfo"
                                                  placeholder=""></textarea>
                                    </div>
                                </div>

                                <input type="hidden" value="">
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-info btn-sm" data-dismiss="modal" onclick="subevebut()">
                            提交
                        </button>
                        <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">关闭</button>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="erreve">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
                        <div id="errinfo"></div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-info btn-sm"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="endeve">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">项目已完成结项</h4>
                    </div>
                    <div class="modal-body">
                        <div id="endinfo"></div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-info btn-sm" onclick="endevebut()"
                                data-dismiss="modal">确认结项
                        </button>
                        <button type="button" class="btn btn-info btn-sm"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="deleve">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">删除并回收此项目</h4>
                    </div>
                    <div class="modal-body">
                        <div id="delinfo"></div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-info btn-sm" onclick="delevebut()"
                                data-dismiss="modal">确认删除
                        </button>
                        <button type="button" class="btn btn-info btn-sm"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </div>
            </div>
        </div>

    </section>
</section>

</body>
<script>
    var personlist = [];
    $(document).ready(function () {
        personlist = $.trim($('#persons').val()).split('#');
        var drawser = $('#workslistper').children();
        var coostr = "";
        for (var i = 0; i < personlist.length; i++) {
            if (personlist[i] != " " && personlist[i] != "") {
                drawser.eq(i + 1).children().html(personlist[i]);
                drawser.eq(i + 1).removeAttr('hidden');
                $('#sel' + (i + 1)).html(personlist[i]);
                $('#sel' + (i + 1)).css('display', '');
                coostr += personlist[i] + ' ';
            }
        }
        $('#coofriend').html(coostr);

        getProcessdoing();
        drawLines(null);
        drawpies();
        showhissubmit();

    });

    function getProcessdoing() {
        $.ajax({
            url: '/getProcessdoing',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                pronumber: $("#pronumber").val(),
                toteltimes: $("#toteltimes").val()
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/login";
                else {
                    $("#processs").html("当前进度: " + data.object + "%");
                    $("#progressgin").attr("style", "width:" + data.object + "%");
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

    function subnewproess() {
        $('#subeve').modal('show');
    }

    function subevebut() {
        var hasperoson = false;
        var times = $("#times").val();
        var persons = $(".select").find("option:selected").text();
        var hisinfo = $("#hisinfo").val();
        var pronumber = $("#pronumber").val();
        for (var i = 0; i < personlist.length; i++)
            if (personlist[i] == persons) hasperoson = true;
        if (!(times >= 0 && times <= 99999)) {
            $('#erreve').modal('show');
            $('#errinfo').html('提交失败，请正确填写工作量。');
        } else if (hasperoson == false) {
            $('#erreve').modal('show');
            $('#errinfo').html('提交失败，' + persons + '不是此小组的成员，请正确填写成员名称。');
        } else {
            $.ajax({
                url: '/addProcess',
                type: 'post',
                contentType: 'application/x-www-form-urlencoded',
                data: {
                    times: times,
                    persons: persons,
                    hisinfo: hisinfo,
                    pronumber: pronumber,
                },
                dataType: "json",
                success: function (data) {
                    if (data.errorCode == "login")
                        window.location.href = "/login";
                    else {
                        $('#erreve').modal('show');
                        $('#errinfo').html('提交成功。');
                        getProcessdoing();
                        drawLines(null);
                        drawpies();
                        showhissubmit();
                    }
                }
            });
        }
    }

    function endprocess() {
        $('#endeve').modal('show');
        $('#endinfo').html('是否确认完成并结束此项目？');
    }

    function endevebut() {
        $.ajax({
            url: '/endProcess',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                pronumber: $("#pronumber").val()
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/login";
                else {
                    window.location.href = "/project";
                }
            }
        });
    }

    function delprocess() {
        $('#deleve').modal('show');
        $('#delinfo').html('是否确认删除此项目？所有数据将会被删除。')
    }

    function delevebut() {
        $.ajax({
            url: '/delProcess',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                pronumber: $("#pronumber").val()
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/login";
                else {
                    window.location.href = "/project";
                }
            }
        });
    }

    function drawLines(obj) {
        var person = "";
        if (obj == null) person = "all";
        else person = $(obj).html();
        $.ajax({
            url: '/weekdayswork',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                pronumber: $("#pronumber").val(),
                person: person,
            },
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
                    //xlines.eq(6).css("left", "700px");
                }
            }
        });

    }

    function drawpies() {
        $.ajax({
            url: '/personspie',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                pronumber: $("#pronumber").val()
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
                    for (var i = 0; i < sizs; i++) {
                        showperson.eq(i).removeAttr('hidden');
                        showperson.eq(i).html(data.object.pernames[i] + ': ' + data.object.pes[i] + '%');
                    }

                }
            }
        });
    }

    function showhissubmit() {
        $.ajax({
            url: '/gethissubmit',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                pronumber: $("#pronumber").val()
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "login")
                    window.location.href = "/login";
                else {
                    var sizes = data.object.size;
                    var medias = $('#hispush');
                    medias.empty();
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
    }


</script>
<script src="${pageContext.request.contextPath}/js/functions.js"></script>
</html>

