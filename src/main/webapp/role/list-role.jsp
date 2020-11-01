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
    <link href="../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../css/animate.min.css" rel="stylesheet">
    <link href="../css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="../css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
    <link href="../css/plugins/zTreeStyle/zTreeStyle.css" rel="stylesheet" />

</head>

<body class="gray-bg">
	<div class="wrapper2 wrapper-content2 animated fadeInRight">
	       <div class="row">
	    		<div class="col-sm-5">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>添加角色</h5>
                    </div>
                    <div class="ibox-content">
                        <form id="roleform" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">角色名称：</label>

                                <div class="col-sm-8">
                                    <input name="rolename" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">角色描述：</label>

                                <div class="col-sm-8">
                                    <input name="roledis" class="form-control">
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
                                    <a href="javascript:saveRole()" class="btn btn-sm btn-white"><i class="fa fa-save"></i> 保存</a>
                                    <button class="btn btn-sm btn-white" type="reset"><i class="fa fa-undo"></i> 重置</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
	    		<div class="col-sm-7">
                  <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>角色列表 <small>点击修改信息将显示在左边表单</small></h5>
                    </div>
                    <div class="ibox-content">                   		
                        <div class="hr-line-dashed2"></div>
                        <div class="row">
                            <div class="table-responsive">
                            <table class="table table-striped list-table">
                                <thead>
                                    <tr>		
                                        <th>选择</th>
                                        <th>角色名称</th>
                                        <th>角色描述：</th>
                                        <th>是否启用</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody id="rolebody">
                                    <tr>
                                        <td><input name="ids" type="checkbox"></td>
										<td>财务</td>
										<td>财务</td>
										<td>
											是
										</td>
                                        <td>
	                                    <a href="update-role.jsp"><i class="glyphicon glyphicon-edit  text-navy"></i></a>
	                                    <a href="javascript:void(0)" class="btndel"><i class="glyphicon glyphicon-remove text-navy"></i></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
	                        	<div class="col-sm-5">
	                        		<button class="btn btn-sm btn-primary" type="button"><i class="fa fa-check-square-o"></i> 全选</button>
	                        		<button class="btn btn-sm btn-primary" type="button"><i class="fa fa-square-o"></i> 反选</button>
	                        		<button class="btn btn-sm btn-primary" type="button"><i class="fa fa-times-circle-o"></i> 删除</button>
	                        	</div>
							<div class="col-sm-7 text-right">
								<div class="btn-group" id="pagediv">
								    <span>共有50页,当前是第3页</span>
	                                <a href="">首页</a>
	                                <a href="">上一页</a>
	                                <a href="">下一页</a>
	                                <a href="">尾页</a>
	                            </div>
							</div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            
	    	</div>
	
	</div>       
    <script src="../js/jquery.min.js?v=2.1.4"></script>
    <script src="../js/bootstrap.min.js?v=3.3.6"></script>
    <script src="../js/plugins/select/bootstrap-select.min.js"></script>
    <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="../js/plugins/ztree/jquery.ztree.core.min.js"></script>
    <script src="../js/plugins/ztree/jquery.ztree.exedit.js"></script>
    <script src="../js/plugins/ztree/jquery.ztree.excheck.js"></script>

   <script>
	$(document).ready(function() {
		// 设置按钮的样式
		$('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');
		
		//点击删除
		$('.btndel').click(function () {
		    swal({
		        title: "您确定要改修该角色状态吗？",
		        text: "改修后将将，请谨慎操作！",
		        type: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "删除",
		        closeOnConfirm: false
		    }, function () {//此函数是点击删除执行的函数
		    		//这里写ajax代码
		    		// 以下是成功的提示框，请在ajax回调函数中执行
			    swal("删除成功！", "您已经永久删除了这条信息。", "success");
		    });
		});
		
	});
    </script>

    <script type="text/javascript">
        //预加载执行
        $(function () {

            //列表数据展示--函数执行
            showList(1);//默认显示第一页

        })

        //列表数据展示函数--函数定义
        function showList(num) {
            $.ajax({
                url:"list-role.do",
                data:"currentPage="+num,
                dataType:"json",
                success:function (obj) {
                    console.log(obj);

                    $("#rolebody").empty();
                    $.each(obj.list,function (i, role) {
                        var ss = role.staStr;
                        var temp = "否";
                        if(ss == "on"){
                            temp = "是";
                        }
                        $("#rolebody").append('<tr>'+
                                '<td><input name="ids" type="checkbox"></td>'+
                                '<td>'+role.rolename+'</td>'+
                                '<td>'+role.roledis+'</td>'+
                                '<td> '+temp+' </td>'+
                                '<td>'+
                                    '<a href="update-role.jsp?id='+role.roleid+'"><i class="glyphicon glyphicon-edit  text-navy"></i></a>'+
                                    '<a href="javascript:void(0)" class="btndel"><i class="glyphicon glyphicon-remove text-navy"></i></a>'+
                                '</td>'+
                            '</tr>'
                        );
                    });

                    //页码设置
                    $("#pagediv").empty();
                    $("#pagediv").append('<span>共有'+obj.pages+'页,当前是第'+obj.pageNum+'页</span>'+
                        '<a href="javascript:showList(1)">首页</a>'+
                        '<a href="javascript:showList('+(obj.pageNum-1)+')">上一页</a>'+
                        '<a href="javascript:showList('+(obj.pageNum+1)+')">下一页</a>'+
                        '<a href="javascript:showList('+obj.pages+')">尾页</a>'
                    );
                }
            });
        }
        
        //数据添加函数
        function saveRole() {
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

            //异步或者同步实现表单提交即可
            $.ajax({
               url:"save-role.do",
               data:$("#roleform").serialize(),
               type:"post",
               dataType:"json",
               success:function (obj) {
                   console.log(obj);
                   if(obj.keyS == "200"){
                       location.href = "list-role.jsp";
                   }
               }
            })
        }
    </script>

    <SCRIPT type="text/javascript">
        var setting = {
            async: {
                enable: true,
                url: "../resources/list-resources.do",
                autoParam: ["id", "name"]
            },
            check: {
                enable: true
            }
        };

        $(document).ready(function() {
            $.fn.zTree.init($("#treeDemo"), setting);
        });
    </SCRIPT>
</body>


</html>
    
