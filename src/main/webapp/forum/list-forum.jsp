<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>main</title>
    <base target="_self">
    <link href="../css/bootstrap.min14ed.css" rel="stylesheet">
    <link href="../css/font-awesome.min93e3.css" rel="stylesheet">
    <link href="../css/animate.min.css" rel="stylesheet">
    <link href="../css/style.min862f.css" rel="stylesheet">
    <link href="../css/customer.css" rel="stylesheet">

    <script src="../js/jquery.min.js?v=2.1.4"></script>
    <script src="../js/bootstrap.min.js?v=3.3.6"></script>
    <script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../js/plugins/layer/layer.min.js"></script>
    <script src="../js/hplus.min.js?v=4.1.0"></script>
</head>
<body leftmargin="8" topmargin='8'>

<table class="table table-striped list-table">
    <thead>
        <tr>
            <td colspan="3" class='title'>
                <span>论坛分类</span> &nbsp; &nbsp;&nbsp;|<span>生活广场</span> |<span>租房信息</span><a href='save-forum.jsp' style='padding-left: 1000px'><font size="3">发帖</font></a>
            </td>
        </tr>
    </thead>
    <tbody id="forumBody">

    </tbody>
</table>
    <script type="text/javascript">
        $(function () {
            showForum(1);
        })
        
        //加载帖子列表
        function showForum(num) {
            $.ajax({
                url:"list-forum.do",
                data:"currentPage="+num,
                dataType:"json",
                success:function (obj) {
                    console.log(obj);
                    $("#forumBody").empty();
                    var bodyStr = '';
                    $.each(obj.list,function (i, forum) {
                        var ms = forum.fdate;
                        var day = new Date(ms);
                        var y = day.getFullYear();
                        var m = day.getMonth() + 1;
                        var d = day.getDate();
                        var h = day.getHours();
                        var mi = day.getMinutes();
                        var se = day.getSeconds();
                        var fd = y + "-" + m + "-" + d + " " + h + ":" + mi + ":" + se;

                        //alert(i % 3)
                        var bs = '<tr bgcolor="#FFFFFF">';
                        var es = '';
                        if(i % 3 != 0){
                            bs = '';
                        }
                        if(i % 3 == 2){
                            es = '</tr>';
                        }
                        var ss = bs+
                            '<td>'+
                                '<ul class="notice-list">'+
                                    '<li class="ue-clear">'+
                                        '<span><img src="../images/tx.png" height="50px" width="50px"/></span> 发布时间：'+fd+
                                        '<a href="reply-forum.jsp?fid='+forum.fid+'"class="notice-title">'+forum.fcaption+'</a>'+
                                    '</li>'+
                                '</ul>'+
                            '</td>'+
                            es

                        bodyStr += ss;
                    })
                    $("#forumBody").append(bodyStr);
                    $("#forumBody").append('</tr>');
                }
            });
        }
    </script>
</body>
</html>