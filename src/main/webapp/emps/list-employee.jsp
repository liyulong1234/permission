<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>


<!-- Mirrored from www.gzsxt.cn/theme/hplus/table_basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:01 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>绿地中央广场综合物业办公系统 - 基础表格</title>
    <meta name="keywords" content="综合办公系统">
    <meta name="description" content="综合办公系统">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="../css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="../css/animate.min.css" rel="stylesheet">
    <link href="../css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="../css/plugins/select/bootstrap-select.min.css" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper2 wrapper-content2 animated fadeInRight">
        <div class="ibox float-e-margins">
           <div class="ibox-content">
                <div class="row">
                        <div class="col-sm-3 col-sm-offset-2 text-right">
                            <h3><small>搜索条件:</small></h3>
                        </div>
                    <div class="col-sm-2">
                        <select class="selectpicker form-control" name="xxx" id="caption">
                            <option value="">选择类型</option>
                            <option value="ename">员工姓名</option>
                            <option value="esex">员工性别</option>
                            <option value="hiredate">入职时间</option>
                        </select>
                    </div>

                    <div class="col-sm-3">
                        <div class="input-group">
                            <input name="xxx" id="keyword" type="text" placeholder="请输入关键词" class="input-sm form-control">
                            <span class="input-group-btn">
                                <button onclick="showList(1)" type="button" class="btn btn-sm btn-primary"><i class="fa fa-search"></i>搜索</button>
                            </span>
                        </div>
                    </div>
                    <div class="col-sm-2 text-right">
                         <a href="save-employee.jsp" class="btn btn-sm btn-primary" type="button"><i class="fa fa-plus-circle"></i> 添加员工</a>
                    </div>
                </div>
                <div class="hr-line-dashed2"></div>
                <div class="table-responsive">
                    <form id="deleteManyForm" action="exportToExcel.xlsx" method="post">
                        <table class="table table-striped list-table">
                            <thead>
                                <tr>
                                    <th>选择</th>
                                    <th>序号</th>
                                    <th>姓名</th>
                                    <th>职位</th>
                                    <th>性别</th>
                                    <th>年龄</th>
                                    <th>电话</th>
                                    <th>入职时间</th>
                                    <th class="text-center">操作</th>
                                </tr>
                            </thead>
                            <tbody id="employeebody">
                                <%--数据展示区域--%>
                                <tr>
                                    <td><input  type="checkbox" checked=""></td>
                                    <td>1</td>
                                    <td>李晓明</td>
                                    <td>初级开发工程师</td>
                                    <td>男</td>
                                    <td>24</td>
                                    <td>13288888888</td>
                                    <td>2015-01-03</td>
                                    <td class="text-right">
                                       <a href="show-employee.jsp" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>编辑</a>
                                       <button class="btn btn-danger btn-xs btndel"><i class="fa fa-close"></i>删除</button>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </form>
                </div>

                <div class="row">
                    <div class="col-sm-5">
                        <button onclick="checkAll()" class="btn btn-sm btn-primary" type="button"><i class="fa fa-check-square-o"></i> 全选</button>
                        <button onclick="unCheck()" class="btn btn-sm btn-primary" type="button"><i class="fa fa-square-o"></i> 反选</button>
                        <button onclick="deleteMany()" class="btn btn-sm btn-primary" type="button"><i class="fa fa-times-circle-o"></i> 删除</button>
                        <button onclick="exportToExcel()" id="demo1" class="btn btn-sm btn-primary" type="button"><i class="fa fa-table"></i> 导出Excel</button>
                    </div>
                    <div class="col-sm-7 text-right" id="pagediv">

                            <span>共有50页,当前是第3页</span>
                            <a href=''>首页</a>
                            <a href=''>上一页</a>
                            [ 1 2 3 ]
                            <a href=''>下一页</a>
                            <a href=''>尾页</a>

                    </div>
                </div>

            </div>
        </div>
    </div>
    <script src="../js/jquery.min.js?v=2.1.4"></script>
    <script src="../js/bootstrap.min.js?v=3.3.6"></script>
    <script src="../js/plugins/select/bootstrap-select.min.js"></script>
    <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="../js/permission.js"></script>

   <script>
	$(document).ready(function() {
		// 设置按钮的样式
		$('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');
		
		//点击删除
		$('.btndel').click(function () {
		    swal({
		        title: "您确定要删除这条信息吗",
		        text: "删除后将无法恢复，请谨慎操作！",
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
        /*预加载*/
        $(function () {
           //异步请求--封装成函数
           showList(1);//调用
        })

        //定义
        function showList(num) {
            //获取搜索下拉列表框中的值
            var caption = $("#caption").val();

            //获取搜索关键字框中的值
            var keyword = $("#keyword").val();


            $.ajax({
                url:"list-employee.do",
                data:"currentPage="+num+"&caption="+caption+"&keyword="+keyword,
                // data:{
                //     currentPage:num,
                //     caption:caption,
                //     keyword:keyword
                // },
                dataType:"json",
                success:function (obj) {
                    console.log(obj)
                    //清空
                    $("#employeebody").empty();
                    //循环遍历集合
                    $.each(obj.list,function (i,emp) {
                        //毫秒值改日期
                        var ms = emp.hiredate;
                        var da = new Date(ms);
                        var y = da.getFullYear();
                        var m = da.getMonth() + 1;
                        var d = da.getDate();
                        var s = y + "-" + m + "-" + d;

                        var j = i + 1;
                        $("#employeebody").append('<tr>'+
                                '<td><input name="ids" type="checkbox" value="'+emp.eid+'"></td>'+
                                '<td>'+j+'</td>'+
                                '<td>'+emp.ename+'</td>'+
                                '<td>初级开发工程师</td>'+
                                '<td>'+emp.esex+'</td>'+
                                '<td>'+emp.eage+'</td>'+
                                '<td>'+emp.telephone+'</td>'+
                                '<td>'+s+'</td>'+
                                '<td class="text-right">'+
                                    '<a href="show-employee.jsp?eid='+emp.eid+'" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>编辑</a>'+
                                    '<a href="javascript:deleteOne('+emp.eid+')" class="btn btn-danger btn-xs btndel"><i class="fa fa-close"></i>删除</a>'+
                                '</td>'+
                            '</tr>'
                        );
                    });

                    //添加分页 System.out.println("jieguo:"+(i + 1));
                    var ns = obj.navigatepageNums;
                    var s = "";
                    for(var i = 0;i < ns.length;i++){
                        var n = ns[i];
                        if(n == obj.pageNum){
                            s += "<a href='javascript:showList("+n+")'><span style='color:red;'>" + n + "</span></a> ";
                        }else{
                            s += "<a href='javascript:showList("+n+")'>" + n + "</a> ";
                        }
                    }
                    $("#pagediv").empty();
                    $("#pagediv").append('<span>共有'+obj.pages+'页,当前是第'+obj.pageNum+'页</span>'+
                        '<a href="javascript:showList(1)">首页</a>'+
                        '<a href="javascript:showList('+(obj.pageNum - 1)+')">上一页</a>'+
                        '[ '+s+']'+
                        '<a href="javascript:showList('+(obj.pageNum + 1)+')">下一页</a>'+
                        '<a href="javascript:showList('+obj.pages+')">尾页</a>'
                    )
                }
            });
        }


        //删除一项数据
        function deleteOne(eid) {
            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false
            }, function () {//此函数是点击删除执行的函数
                //这里写ajax代码
                $.ajax({
                    url:"deleteone.do",
                    data:"eid="+eid,
                    dataType:"json",
                    success:function (obj) {
                        console.log(obj);
                        if(obj.keyS == "200"){
                            location.href = "list-employee.jsp";
                        }
                    }
                });

            });
        }

        //批量删除
        function deleteMany() {
            var cs = $("input[type='checkbox']:checked");
            if(cs.length > 0) {
                swal({
                    title: "您确定要删除这些信息吗",
                    text: "删除后将无法恢复，请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "删除",
                    closeOnConfirm: false
                }, function () {//此函数是点击删除执行的函数
                    $.ajax({
                        url: "deletemany.do",
                        data: $("#deleteManyForm").serialize(),//函数作用是将表单中的数据以键值对格式传输，不能上传文件
                        dataType: "json",
                        success: function (obj) {
                            console.log(obj);
                            if (obj.keyS == "200") {
                                location.href = "list-employee.jsp";
                            }
                        }
                    });
                });

            }else{
                alert("请先选中再删除")
            }
        }

        //导出到Excel
        function exportToExcel() {
            //采用同步
            //执行表单提交
            //是否有选中的复选框
            var cs = $("input[type='checkbox']:checked");
            if(cs.length > 0){
                $("#deleteManyForm").submit();
            }else {
                alert("请先选中再导出")
            }
        }
    </script>
</body>


</html>
    