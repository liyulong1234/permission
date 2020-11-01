<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>


<!-- Mirrored from www.gzsxt.cn/theme/hplus/table_basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:01 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>绿地中央广场综合物业办公系统 - 基础表格</title>
    <meta name="keywords" content="绿地中央广场综合物业办公系统">
    <meta name="description" content="绿地中央广场综合物业办公系统">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="../css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="../css/animate.min.css" rel="stylesheet">
    <link href="../css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="../css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../css/customer.css" />
	<link href="../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        
      <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>员工管理<small>>修改员工</small></h5>
                    </div>
                    <div class="ibox-content">
                        <form id="empform" class="form-horizontal">
                            <input type="hidden" id="eid" name="emp.eid">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-3">
                                        <input id="ename" name="emp.ename" type="text" class="form-control input-sm">
                                    </div>
                                    <label class="col-sm-2 col-sm-offset-1 control-label">用户名</label>
                                    <div class="col-sm-3">
                                        <input id="username" name="emp.username" type="text" class="form-control input-sm">
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
                                        <select id="esex" name="emp.esex" class="selectpicker form-control">
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">身份证号码</label>
                                    <div class="col-sm-3">
                                        <input id="pnum" name="emp.pnum" type="text" class="form-control input-sm">
                                    </div>
                                    <label class="col-sm-2 col-sm-offset-1 control-label">联系电话</label>
                                    <div class="col-sm-3">
                                        <input id="telephone" name="emp.telephone" type="text" class="form-control input-sm">
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
                                            <input id="eage" name="emp.eage" type="text" class="form-control input-sm">
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
                                        <textarea id="remark" name="emp.remark" class="form-control"></textarea>
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
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <img id="imgpic" style="margin-left: 200px">
                                        <input type="hidden" name="emp.pic" id="pic">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="hr-line-dashed"></div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <div class="col-sm-3 col-sm-offset-3 text-right">
                                        <a href="javascript:updateEmp()" class="btn btn-primary"><i class="fa fa-save"></i> 保存内容</a>
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

        });
    </script>
  <script type="text/javascript">
      $(function () {
          $.ajax({
              url:"show-employee.do",
              data:"eid="+${param.eid},//等价于request.getParameter("eid")
              dataType:"json",
              success:function (obj) {
                  console.log(obj);

                  //毫秒转日期
                  var ms = obj.emp.hiredate;
                  var da = new Date(ms);
                  var y = da.getFullYear();
                  var m = da.getMonth() + 1;
                  var d = da.getDate();
                  var s = y + "-" + m + "-" + d;

                  $("#eid").val(obj.emp.eid);
                  $("#ename").val(obj.emp.ename);
                  $("#username").val(obj.emp.username);
                  $("#pnum").val(obj.emp.pnum);
                  $("#telephone").val(obj.emp.telephone);
                  $("#start").val(s);
                  $("#eage").val(obj.emp.eage);
                  $("#remark").val(obj.emp.remark);
                  $("#imgpic").prop("src","/upload/"+obj.emp.pic);//src="/upload/xxxx.jpg";
                  $("#pic").val(obj.emp.pic);

                  //三个下拉列表的实现
                  var ar = new Array("男","女");
                  console.log(ar)
                  //性别
                  $("#esex").empty();
                  $.each(ar,function (i,sex) {
                      if(sex == obj.emp.esex){
                        $("#esex").append("<option selected value='"+sex+"'>"+sex+"</option>")
                      } else{
                        $("#esex").append("<option value='"+sex+"'>"+sex+"</option>")
                      }
                  })
                  $("#esex").selectpicker('refresh');


                  //部门
                  $.ajax({
                      url:"../dept/ajax-empsave-deptshow.do",
                      dataType:"json",
                      success:function (objd) {
                          $("#deptselect").empty();
                          //遍历
                          $.each(objd,function (i,dept) {
                              if(dept.deptno == obj.emp.dfk){
                                $("#deptselect").append("<option selected value='"+dept.deptno+"'>"+dept.dname+"</option>");
                              } else {
                                $("#deptselect").append("<option value='"+dept.deptno+"'>"+dept.dname+"</option>");
                              }
                          });
                          //下拉列表刷新
                          $("#deptselect").selectpicker('refresh');
                      }
                  });


                  //角色
                  $.ajax({
                      url:"../role/ajax-empsave-roleshow.do",
                      dataType:"json",
                      success:function (objr) {
                          $("#roleselect").empty();
                          $.each(objr,function (i,role) {
                              if(role.roleid == obj.role_fk){
                                $("#roleselect").append("<option selected value='"+role.roleid+"'>"+role.rolename+"</option>");
                              }else {
                                $("#roleselect").append("<option value='"+role.roleid+"'>"+role.rolename+"</option>");
                              }
                          })
                          //下拉列表刷新
                          $("#roleselect").selectpicker('refresh');
                      }
                  });
              }
          });
      })

      //修改函数
      function updateEmp() {
          //id选择器选中form表单
          var form = document.getElementById("empform");
          //表单封装--获取数据
          var data = new FormData(form);

          $.ajax({
              url:"update-employee.do",
              data:data,
              type:"post",
              contentType:false,
              processData:false,
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

