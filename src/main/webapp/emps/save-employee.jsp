<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
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
                        <h5>员工管理<small>>添加信息</small></h5>
                    </div>
                    <div class="ibox-content">
                        <form id="empform" class="form-horizontal">
                       	<div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-3">
                                    <input name="emp.ename" type="text" class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">用户名</label>
                                <div class="col-sm-3">
                                    <input name="emp.username" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-3">
                                    <input name="emp.password" type="password" class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">性别</label>
                                <div class="col-sm-3">
                                    <select name="emp.esex" class="selectpicker form-control">
										<option>男</option>
										<option>女</option>
									</select>
                                </div>                     
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">身份证号码</label>
                                <div class="col-sm-3">
                                    <input name="emp.pnum" type="text" class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">联系电话</label>
                                <div class="col-sm-3">
                                    <input name="emp.telephone" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <label class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-3">
                                <select id="deptselect" name="emp.dfk" class="selectpicker form-control">
                                    <option>Mustard</option>
                                    <option>Ketchup</option>
                                    <option>Relish</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-offset-1 control-label">入职时间</label>
                                <div class="col-sm-3">
                                    <!--时间控件的id都不能改-->
                                    <input name="emp.hiredate" id="start" class="laydate-icon form-control layer-date">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                              <div class="form-group">
                                <label class="col-sm-2 control-label">年龄</label>
                                <div class="col-sm-3">
                                    <input name="emp.eage" type="text" class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">角色</label>
                                <div class="col-sm-3">
                                    <select id="roleselect" name="role_fk" class="selectpicker form-control">
										<option>管理员</option>
										<option>VIP</option>
									</select>
                                </div>                     
                            </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-9">
                                    <textarea name="emp.remark" class="form-control"></textarea>
                                </div>
                                
                            </div>
                        </div>
                        <%--上传组件--%>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">照片</label>
                                <div class="col-sm-9">
                                    <input type="file" name="upload">
                                </div>

                            </div>
                        </div>
                        
                     	<div class="row">
                     		<div class="hr-line-dashed"></div>
                     	</div>
                          
                         <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-3 text-right">
                                    <a href="javascript:saveEmp()" class="btn btn-primary"><i class="fa fa-save"></i> 保存内容</a>
                                </div>
                                <div class="col-sm-3">
                                	<a href="list-employee.jsp" class="btn btn-white"><i class="fa fa-reply"></i> 返回</a>
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
		//初始化日期控件
		laydate({elem: "#start"});
	
		
		
		
		//--------------------下面是常用代码模版---------------------------------------
		
		//下拉列表使用ajax加载说明例子
		function loadSelect(){
			var option='<option value="0">-------请选择------</option><option value="4">用友软件</option><option selected value="5">浪潮软件</option>';
			$("#company").html(option);
			//ajax填充数据后需调用下面的方法来刷新下拉列表
			$("#company").selectpicker('refresh');
		}
		loadSelect();
		
		//点击按钮，消息提示框
		$("#demo1").click(function() {
			//基本消息框－留着备用
			swal({
				title: "恭喜，添加成功",
				text: "数据添加成功，为您返回列表页！"
			})
		});
		
		// 选择客户公司名称时自动选对应的客户方负责人
		$("#company").change(function(){
			var thisVal=$(this).val();
			//val指value属性,选中value属性＝thisVal的选项
			$('#customer').selectpicker('val',thisVal);
		});
		
	});
   </script>
    <script type="text/javascript">
        $(function () {
            //加载部门信息
            showDept();
            //加载角色信息
            showRole();
        })

        //异步获取部门信息的函数
        function showDept() {
            $.ajax({
                url:"../dept/ajax-empsave-deptshow.do",
                dataType:"json",
                success:function (obj) {
                    console.log(obj);
                    $("#deptselect").empty();
                    //遍历
                    $.each(obj,function (i,dept) {
                        $("#deptselect").append("<option value='"+dept.deptno+"'>"+dept.dname+"</option>");
                    });
                    //下拉列表刷新
                    $("#deptselect").selectpicker('refresh');
                }
            });
        }

        //异步角色显示
        function showRole() {
            $.ajax({
                url:"../role/ajax-empsave-roleshow.do",
                dataType:"json",
                success:function (obj) {
                    console.log(obj);
                    $("#roleselect").empty();
                    $.each(obj,function (i,role) {
                        $("#roleselect").append("<option value='"+role.roleid+"'>"+role.rolename+"</option>");
                    })
                    //下拉列表刷新
                    $("#roleselect").selectpicker('refresh');
                }
            });
        }

        //异步保存--提交数据到controller
        function saveEmp() {
           //数据还是表单中的数据
            //获取到表单---原生的js方式
            var form = document.getElementById("empform");
            //获取到表单中数据
            var data = new FormData(form);
           $.ajax({
               url:"save-employee.do",
               data:data,
               type:"post",
               contentType:false,//false表示由jQuery框架自适应
               processData:false,//false表示由jQuery框架自适应
               dataType:"json",
               success:function (obj) {
                   console.log(obj);
                   if(obj.keyS == "200"){
                       location.href = "list-employee.jsp";
                   }
               }
           });
        }
    </script>
</body>


</html>
    