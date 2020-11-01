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
<body leftmargin="8" topmargin="8">

	<!--  内容列表   -->
	<form name="form2">

		<table class="table table-striped list-table">
			<thead>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<th width="4%">选择</th>
					<th width="6%">序号</th>
					<th width="10%">姓名</th>
					<th width="10%">年龄</th>
					<th width="10%">毕业院校</th>
					<th width="8%">入职时间</th>
					<th width="5%">联系方式</th>
					<th width="8%">学历</th>
					<th width="6%">邮箱</th>
					<th width="8%">政治面貌</th>
					<th width="8%">民族</th>
					<th width="10%" class="text-center">操作</th>
				</tr>
			</thead>

			<tbody id="archivebody">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
					<td><input name="id" type="checkbox" id="id" value="101" class="np"></td>
					<td>1</td>
					<td align="left"><a href=''><u>农业银行自助管理系统</u></a></td>
					<td>中国农业银行</td>
					<td>张云</td>
					<td>苏鑫超</td>
					<td>6</td>
					<td>2015-01-03</td>
					<td>2015-02-03</td>
					<td>2015-06-03</td>
					<td>进行中</td>
					<td><a href="project-base-edit.jsp">编辑</a> | <a href="project-base-look.jsp">查看详情</a></td>
				</tr>
			</tbody>

			<tfoot>
				<tr bgcolor="#FAFAF1">
					<td height="28" colspan="12">
						<a href="" class="coolbg">全选</a>
						<a href="" class="coolbg">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="" class="coolbg">&nbsp;删除&nbsp;</a>
						<a href="" class="coolbg">&nbsp;导出Excel&nbsp;</a>
						<a href="save-archives.jsp" class="coolbg">&nbsp;添加档案信息&nbsp;</a>
					</td>
				</tr>
				<tr align="right" bgcolor="#EEF4EA">
					<td height="36" colspan="12" align="center"><!--翻页代码 --></td>
				</tr>
			</tfoot>
		</table>

	</form>

	<script src="../js/jquery.min.js?v=2.1.4"></script>
	<script src="../js/bootstrap.min.js?v=3.3.6"></script>
	<script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../js/plugins/layer/layer.min.js"></script>
	<script src="../js/hplus.min.js?v=4.1.0"></script>
	<script type="text/javascript">
		$(function () {
			showArchive(1);
		})

		//显示档案信息--同时还有员工信息
		function showArchive(num) {
			$.ajax({
				url:"list-archive.do",
				data:"currentPage="+num,
				dataType:"json",
				success:function (obj) {
					console.log(obj);
					$("#archivebody").empty();
					$.each(obj.list,function (i, archive) {
						var ms = archive.employee.hiredate;
						var dd = new Date(ms);
						var y = dd.getFullYear();
						var m = dd.getMonth() + 1;
						var d = dd.getDate();
						var s = y + "-" + m + "-" + d;

						var j = i + 1;
						$("#archivebody").append('<tr align="center" bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor=\'#FCFDEE\';" onMouseOut="javascript:this.bgColor=\'#FFFFFF\';" height="22" >'+
								'<td><input name="id" type="checkbox" id="id" value="'+archive.aid+'" class="np"></td>'+
								'<td>'+j+'</td>'+
								'<td align="left"><a href=""><u>'+archive.employee.ename+'</u></a></td>'+
								'<td>'+archive.employee.eage+'</td>'+
								'<td>'+archive.school+'</td>'+
								'<td>'+s+'</td>'+
								'<td>'+archive.employee.telephone+'</td>'+
								'<td>'+archive.degree+'</td>'+
								'<td>'+archive.email+'</td>'+
								'<td>'+archive.politicc+'</td>'+
								'<td>'+archive.nation+'</td>'+
								'<td><a href="project-base-edit.jsp">编辑</a> | <a href="project-base-look.jsp">查看详情</a></td>'+
							'</tr>'
						);
					})
				}
			});
		}
	</script>
</body>
</html>