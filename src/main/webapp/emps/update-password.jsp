<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>


<!-- Mirrored from www.gzsxt.cn/theme/hplus/table_basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:01 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>办公系统 - 基础表格</title>
    <meta name="keywords" content="办公系统">
    <meta name="description" content="办公系统">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="../css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="../css/animate.min.css" rel="stylesheet">
    <link href="../css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="../css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
	<link href="../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <!-- 修复日期控件长度-->
    <link href="../css/customer.css" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        
      <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>个人资料<small>>修改密码</small></h5>
                    </div>
                    <div class="ibox-content">
                        <form target="_parent" id="updatepasswordform" method="post" action="updatepwd.do" class="form-horizontal">
                       	<div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">原密码</label>
                                <div class="col-sm-3">
                                    <input id="oldpassword" name="oldpassword" type="password" onblur="checkOldPassword()" class="form-control input-sm">
                                    <span style="color: red;" id="msgSpan"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">新密码</label>
                                <div class="col-sm-3">
                                    <input id="newpassword" name="newpassword" type="password" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">确认密码</label>
                                <div class="col-sm-3">
                                    <input id="truepassword" name="truepassword" type="password" onblur="repeatPassword()" class="form-control input-sm">
                                    <span style="color: red;" id="msg2Span"></span>
                                </div>
                            </div>
                        </div>
                        
                        
                     	<div class="row">
                     		<div class="hr-line-dashed"></div>
                     	</div>
                          
                         <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-3 text-right">
                                    <a href="javascript:updatePassword()" class="btn btn-primary">保存内容</a>
                                </div>
                                <div class="col-sm-3">
                                	<a href="list-project.html" class="btn btn-white">返回</a>
                                </div>
                            </div>
                       </div>
                       </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

 
    
    <script src="../js/jquery.min.js?v=2.1.4"></script>
    <script src="../js/bootstrap.min.js?v=3.3.6"></script>
    <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="../js/plugins/select/bootstrap-select.min.js"></script>
	<script src="../js/plugins/layer/laydate/laydate.js"></script>
    <script>
        $(document).ready(function() {
            // 设置按钮的样式
            $('.selectpicker').selectpicker('setStyle', 'btn-white');
        });
    </script>

    <script type="text/javascript">
        var bo = false;
        //定义函数 --- 实现旧密码的验证
        function checkOldPassword() {
            //获取到框中输入的密码
            var op = $("#oldpassword").val();
            $.ajax({
                url:"checkOldPassword.do",
                data:"oldpassword="+op,
                type:"post",
                dataType:"json",
                success:function (obj) {
                    console.log(obj);
                    if(obj.chpassword){
                        $("#msgSpan").text("");
                        window.bo = true;
                    }else{
                        $("#msgSpan").text("旧密码有误");
                    }
                }
            });

            return bo;
        }

        //两次密码是否一致判断
        function repeatPassword() {
            var newp = $("#newpassword").val();
            var truep = $("#truepassword").val();
            if(newp == truep){
                $("#msg2Span").text("");
                return true;
            }else {
                $("#msg2Span").text("两次密码不一致");
                return false;
            }
        }


        //修改密码
        function updatePassword() {
            var boo = checkOldPassword();
            var boo2 = repeatPassword();

            //console.log(boo)
            if(boo && boo2){
                //alert(1234)
                $("#updatepasswordform").submit();
            }
        }
    </script>
</body>


</html>
    