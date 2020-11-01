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
    <link href="../css/plugins/zTreeStyle/zTreeStyle.css" rel="stylesheet" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        
      <div class="row">
            <div >
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>编辑角色</h5>
                    </div>
                    <div class="ibox-content">
                        <form id="roleform" class="form-horizontal">
                            <input type="hidden" id="roleid" name="roleid">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">角色名称：</label>

                                <div class="col-sm-8">
                                    <input id="rolename" name="rolename" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">角色描述：</label>

                                <div class="col-sm-8">
                                    <input id="roledis" name="roledis" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">角色权限：</label>

                                <div class="col-sm-8">
                                    <div class="zTreeDemoBackground left" style="font-size: 16px">
                                        <ul id="treeDemo" class="ztree"></ul>
                                    </div>
                                </div>
                                <input type="hidden" id="sids" name="sids">
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">是否启用：</label>
                                <div class="col-sm-8">
                                    <div class="switch">
			                            <div class="onoffswitch">
			                                <input name="staStr" type="checkbox" checked class="onoffswitch-checkbox" id="status">
			                                <label class="onoffswitch-label" for="status">
			                                    <span class="onoffswitch-inner"></span>
			                                    <span class="onoffswitch-switch"></span>
			                                </label>
			                            </div>
			                        </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-8">
                                    <a href="javascript:updateRole()" class="btn btn-sm btn-white" ><i class="fa fa-save"></i> 保存</a>
                                    <button class="btn btn-sm btn-white" type="reset"><i class="fa fa-undo"></i> 重置</button>
                                    <a href="list-role.jsp" class="btn btn-sm btn-white"><i class="fa fa-undo"></i> 返回</a>
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
    <script src="../js/plugins/ztree/jquery.ztree.core.min.js"></script>
    <script src="../js/plugins/ztree/jquery.ztree.exedit.js"></script>
    <script src="../js/plugins/ztree/jquery.ztree.excheck.js"></script>
   
   <script type="text/javascript">
       //预加载
       $(function () {
           //调用函数 --- 显示当前要修改的角色信息 -- 数据回显
           showOneRole();
       })

       //函数定义 -- 实现查询一个角色信息，包括当前角色对应的资源
       function showOneRole() {
           $.ajax({
               url:"show-role.do",
               data:"rid=${param.id}",
               dataType:"json",
               success:function (obj) {
                   console.log(obj);
                   $("#roleid").val(obj.roleid);
                   $("#rolename").val(obj.rolename);
                   $("#roledis").val(obj.roledis);
                   //$("#status").val(obj.staStr);
                   if(obj.status == 1){
                       $("#status").prop("checked",true);
                   }else {
                       $("#status").prop("checked",false);
                   }


                   //显示资源树
                   var setting = {
                       async: {
                           enable: true,
                           url: "../resources/list-resources.do",
                           autoParam: ["id", "name"]
                       },
                       check: {
                           enable: true
                       },
                       callback: {
                           onAsyncSuccess: function () {
                               //把tree中某些节点选中--打勾
                               //获取树对象
                               var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                               $.each(obj.list,function (i,rs) {
                                   var id = rs.resources_fk;
                                   //获取到某个节点 -- 通过id获取到某个节点
                                   var node = treeObj.getNodeByParam("id", id, null);
                                   if(node != null){
                                       //给指定id的节点打勾
                                       treeObj.checkNode(node, true);
                                   }

                               })

                           }
                       }
                   };

                   $(document).ready(function() {
                       $.fn.zTree.init($("#treeDemo"), setting);
                   });

               }
           });
       }


       //修改功能
       function updateRole() {
           //测试获取到树节点的id值
           var treeObj = $.fn.zTree.getZTreeObj("treeDemo");//获取树对象
           var nodes = treeObj.getCheckedNodes(true);//获取树中被选中的节点

           //字符串变量
           var s = "";
           //集合-数组遍历
           for(var i = 0;i < nodes.length;i++){
               var node = nodes[i];
               //alert(node.id)
               s += node.id + ",";
           }
           $("#sids").val(s);

           $.ajax({
               url:"update.do",
               type:"post",
               data:$("#roleform").serialize(),
               dataType:"json",
               success:function (obj) {
                   console.log(obj);
                   if(obj.keyS == "200"){
                       location.href = "list-role.jsp"
                   }
               }
           })
       }
   </script>
</body>


</html>