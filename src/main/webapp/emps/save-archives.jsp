<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>档案管理</title>
    <link href="../css/bootstrap.min14ed.css" rel="stylesheet">
    <link href="../css/font-awesome.min93e3.css" rel="stylesheet">
    <link href="../css/animate.min.css" rel="stylesheet">
    <link href="../css/style.min862f.css" rel="stylesheet">
    <link href="../css/customer.css" rel="stylesheet">
</head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>
    <form id="archiveForm">
        <table class="table table-striped list-table">
            <tbody>
                <tr>
                    <td align="right" bgcolor="#FAFAF1" height="22">附件：</td>
                    <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                        <input type="file" name="files"/>
                    </td>
                </tr>
                <tr bgcolor="#FAFAF1">
                    <td height="28" colspan=4 align=center>
                        <a href="javascript:commit()" class="coolbg">添加</a>
                        <a href="list-archives.jsp" class="coolbg">返回</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>

    <script src="../js/jquery.min.js?v=2.1.4"></script>
    <script src="../js/bootstrap.min.js?v=3.3.6"></script>
    <script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../js/plugins/layer/layer.min.js"></script>
    <script src="../js/hplus.min.js?v=4.1.0"></script>

    <script type="text/javascript">
        //表单数据提交 -- 异步
        function commit() {
            var form = document.getElementById("archiveForm");
            var data = new FormData(form);
            $.ajax({
                url:"save-archive.do",
                type:"post",
                data:data,
                contentType:false,
                processData:false,
                dataType:"",
                success:function (obj) {
                    console.log(obj);
                    if(obj.keyS == "200"){
                        location.href = "list-archives.jsp";
                    }
                }
            });
        }
    </script>
</body>
</html>