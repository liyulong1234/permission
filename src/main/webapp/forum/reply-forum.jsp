<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>帖子回复</title>
	<link href="../css/bootstrap.min14ed.css" rel="stylesheet">
	<link href="../css/font-awesome.min93e3.css" rel="stylesheet">
	<link href="../css/animate.min.css" rel="stylesheet">
	<link href="../css/style.min862f.css" rel="stylesheet">
	<link href="../css/customer.css" rel="stylesheet">
	<style type="text/css">
		div{
			width:100%;
		}
	</style>

	<script src="../js/jquery.min.js?v=2.1.4"></script>
	<script src="../js/bootstrap.min.js?v=3.3.6"></script>
	<script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../js/plugins/layer/layer.min.js"></script>
	<script src="../js/hplus.min.js?v=4.1.0"></script>

	<script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.js"> </script>
	<script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>



</head>
<body>
<div>

	<form id="form15">
		<input type="hidden" id="forum_fk" name="forum_fk">
		<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
			<thead>
				<%--帖子信息展示--%>
				<tr>
					<td align="right" bgcolor="#FAFAF1" height="22">
						<span >
							<img src='${pageContext.request.contextPath}/images/tx.png' height='50px' width='50px'/>
						</span>
					</td>
					<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						<span id="empFks">发布人：</span><br>
						<span id="fdate">发布时间： </span><br>
						<span id="fcaption">标题： </span><br>
						<span id="fcontent">内容：</span><br>
					</td>
				</tr>

				<%--隔行--%>
				<%  for(int i=0;i<2;i++){%>
				<tr style="color: burlywood;">
					<td align="right" bgcolor="#FAFAF1" height="22" colspan="2"></td>
				</tr>
				<% } %>
			</thead>
			<tbody id="replyBody">

			</tbody>

			<tr>
				<td align="right" bgcolor="#FAFAF1" height="22">我也说两句：</td>
				<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<script id="editor" name="replaycontent" type="text/plain" style="width:1024px;height:60px;"></script>
				</td>
			</tr>
			<tr bgcolor="#FAFAF1">
				<td height="28" colspan=4 align=center>
					<a href="javascript:commit()" class="coolbg">回帖</a>
					<a href="list-forum.jsp" class="coolbg">返回</a>
				</td>
			</tr>
		</table>
	 </form>

</div>
<script type="application/javascript">
	var ue = UE.getEditor('editor');
</script>

<script type="text/javascript">
	$(function () {
		showOneForum("${param.fid}");
	})

	function showOneForum(fid) {
		$.ajax({
			url:"show-one-forum.do",
			type:"post",
			data:"fid="+fid,
			dataType:"json",
			success:function (obj) {
				console.log(obj);

				//显示帖子
				var ms = obj.fdate;
				var da = new Date(ms);
				var y = da.getFullYear();
				var m = da.getMonth() + 1;
				var d = da.getDate();
				var h = da.getHours();
				var mi = da.getMinutes();
				var se = da.getSeconds();
				var s = y + "-" + m + "-" + d + " " + h + ":" + mi + ":" + se;
				$("#empFks").text("发布人："+obj.employee.ename);
				$("#fdate").text("发布时间："+s);
				$("#fcaption").text("发布标题："+obj.fcaption);
				$("#fcontent").text("发布内容："+obj.fcontent);

				$("#forum_fk").val(obj.fid);

				//显示回复
				if(obj.list != null && obj.list.length > 0){
					$("#replyBody").empty();
					$.each(obj.list,function (i, reply) {
						var ms1 = reply.replydate;
						var da1 = new Date(ms1);
						var y1 = da1.getFullYear();
						var m1 = da1.getMonth() + 1;
						var d1 = da1.getDate();
						var h1 = da1.getHours();
						var mi1 = da1.getMinutes();
						var se1 = da1.getSeconds();
						var s1 = y1 + "-" + m1 + "-" + d1 + " " + h1 + ":" + mi1 + ":" + se1;

						var secReply = '';
						if(reply.preply != null){
							secReply = '<span style="border: 1px dodgerblue solid;margin:10px;display: block;">'+reply.preply.employee.ename+'：'+reply.preply.replaycontent+'</span>';
						}

						$("#replyBody").append('<tr>'+
								'<td align="right" bgcolor="#FAFAF1" height="22">'+
									'<span >'+
										'<img src="../images/tx.png" height="50px" width="50px"/>'+
									'</span>'+
								'</td>'+
								'<td align="left" bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor=\'#FCFDEE\';" onMouseOut="javascript:this.bgColor=\'#FFFFFF\';" height="22">'+
									'<span>评论人：'+reply.employee.ename+'</span><br>'+
									'<span>评论时间：'+s+'</span><br>'+
									secReply+
									'<span>评论内容：'+reply.replaycontent+'</span><br>'+
									'<span><a href="#">【回复】</a></span><br>'+
								'</td>'+
							'</tr>'
						);
						$("#replyBody").append('<tr style="color: burlywood;">'+
								'<td align="right" bgcolor="#FAFAF1" height="22" colspan="2"></td>'+
							'</tr>'
						);
					})
				}
			}
		});
	}


	//表单提交
	function commit() {
		$.ajax({
			url:"reply-forum.do",
			type:"post",
			data:$("#form15").serialize(),
			dataType:"json",
			success:function (obj) {
				console.log(obj);
				if(obj.keyS == "200"){
					location.href = "list-forum.jsp";
				}
			}
		});
	}
</script>
</body>
</html>