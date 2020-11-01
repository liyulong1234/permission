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
<link href="../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<link href="../css/animate.min.css" rel="stylesheet">
<link href="../css/style.min862f.css?v=4.1.0" rel="stylesheet">
<link href="../css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
<link href="../css/plugins/zTreeStyle/zTreeStyle.css" rel="stylesheet" />

</head>

<body class="gray-bg">
	<div class="wrapper2 wrapper-content2 animated fadeInRight">
		<div class="row">
			
			<div class="col-sm">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>资源添加</h5>
					</div>
					<div class="ibox-content">
						<form id="sourceForm" class="form-horizontal">
							<input type="hidden" id="id" name="id">
							<div class="form-group">
								<label class="col-sm-4 control-label">菜单资源名称：</label>

								<div class="col-sm-3">
									<input name="name" id="name" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">父菜单：</label>

								<div class="col-sm-3">
									<select id="pid" name="pid" class="selectpicker form-control  ">
										<option>Mustard</option>
										<option>Ketchup</option> 
										<option>Relish</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">菜单资源路径：</label>

								<div class="col-sm-3">
									<input name="url" id="url" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">备注：</label>
								<div class="col-sm-3">
									<textarea name="remark" id="remark" class="form-control"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-4">
									<a href="javascript:update()" class="btn btn-sm btn-white" >
										<i class="fa fa-save"></i> 保存
									</a>
									<button class="btn btn-sm btn-white" type="reset">
										<i class="fa fa-undo"></i> 重置
									</button>
									<a href="list-resources.jsp" class="btn btn-sm btn-white">
										<i class="fa fa-undo"></i> 返回
									</a>
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
	<script src="../js/plugins/select/bootstrap-select.min.js"></script>
	<script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="../js/plugins/ztree/jquery.ztree.core.min.js"></script>
	<script src="../js/plugins/ztree/jquery.ztree.exedit.js"></script>
	
	<script type="text/javascript">
		//预加载
		$(function () {
			showUpdateSource();
		})

		//显示要修改数据
		function showUpdateSource() {
			$.ajax({
				url:"show-update-source.do",
				data:"id=${param.id}",
				dataType:"json",
				success:function (obj) {
					console.log(obj);
					$("#id").val(obj.id);
					$("#name").val(obj.name);
					$("#url").val(obj.url);
					$("#remark").val(obj.remark);

					$.ajax({
						url:"ajax-save-list.do",
						dataType:"json",
						success:function (obj1) {
							console.log(obj1);
							$("#pid").empty();
							if(obj.pid == 0){
								$("#pid").append('<option selected value="0">顶级项</option>');
							}else {
								$.each(obj1,function (i, source) {

										if (source.id == obj.pid) {
											$("#pid").append('<option selected value="' + source.id + '">' + source.name + '</option>');
										} else {
											$("#pid").append('<option value="' + source.id + '">' + source.name + '</option>');
										}
								})
							}
							$("#pid").selectpicker('refresh');
						}
					});
				}
			});
		}

		//修改功能
		function update() {
			$.ajax({
				url:"update.do",
				data:$("#sourceForm").serialize(),
				type:"post",
				dataType:"json",
				success:function (obj) {
					if(obj.keyS == "200"){
						location.href = "list-resources.jsp";
					}
				}
			})
		}
	</script>
</body>


</html>
