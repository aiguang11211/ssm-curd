<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>员工列表</title>
    
    <%
    	pageContext.setAttribute("APP_PATH",request.getContextPath());
     %>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="${APP_PATH }/static/js/jquery-3.3.1.min.js"></script>
	<link href="${APP_PATH }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">	 
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH }/static/bootstrap/js/bootstrap.min.js"></script>

  </head>
  
  <body>
	  <!-- 员工添加的模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
				  <div class="form-group">
				    <label  class="col-sm-2 control-label">empName</label>
				    <div class="col-sm-10">
				      <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
				       <span  class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				   <label  class="col-sm-2 control-label">email</label>
				    <div class="col-sm-10">
				      <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@atguigu.com">
				       <span  class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				   <label  class="col-sm-2 control-label">gender</label>
				    <div class="col-sm-10">
				     		<label class="radio-inline">
								<input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
							</label>
							<label class="radio-inline">
							  <input type="radio" name="gender" id="gender1_add_input" value="F"> 女
							</label>
				    </div>
				  </div>
				  <div class="form-group">
				   <label  class="col-sm-2 control-label">deptName</label>
				    <div class="col-sm-4">
				    		<!-- 部门提交部门id即可 -->
				     		<select class="form-control" name="dId" ></select>
				    </div>
				  </div>
				</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 员工修改的模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
				  <div class="form-group">
				    <label  class="col-sm-2 control-label">empName</label>
				    <div class="col-sm-10">
				      <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
				       <span  class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				   <label  class="col-sm-2 control-label">email</label>
				    <div class="col-sm-10">
				      <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@atguigu.com">
				       <span  class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				   <label  class="col-sm-2 control-label">gender</label>
				    <div class="col-sm-10">
				     		<label class="radio-inline">
								<input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
							</label>
							<label class="radio-inline">
							  <input type="radio" name="gender" id="gender1_add_input" value="F"> 女
							</label>
				    </div>
				  </div>
				  <div class="form-group">
				   <label  class="col-sm-2 control-label">deptName</label>
				    <div class="col-sm-4">
				    		<!-- 部门提交部门id即可 -->
				     		<select class="form-control" name="dId" ></select>
				    </div>
				  </div>
				</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
   	<div class="container">
		<!-- 标题 -->
   		<div class="row">
   			<div class="col-md-12">
   			<h1>SSM-CRUD</h1>
   			</div>
   		</div>
   		<!-- 按钮 -->
   		<div class="row">
   			<div class="col-md-4 col-md-offset-8">
   				<button type="button" class="btn btn-primary" id="emp_add_model_btn">新增</button>
   				<button type="button" class="btn btn-danger">删除</button>
   			</div>
   		</div>
   		<!-- 显示表格数据 -->
   		<div class="row">
   			<div class="col-md-12">
				<table class="table nth-child table-hover" id="emps_table">
					<thead>
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
   			</div>
   		</div>
   		<!-- 显示分页信息 -->
   		<div class="row">
   			<!-- 分页文字信息 -->
   			<div class="col-md-6" id="page_info_area">
   				
   			</div>
   			<!-- 分页条信息 -->
   			<div class="col-md-6" id="page_nav_area">
	   			
			</div>
   		</div>
   	</div> 
   	
   	<script type="text/javascript">
   		
   		var totalRecord;
   		//1.在页面加载完成以后，直接发送一个ajax请求，要到分页数据
   		$(function(){
   			to_page(1);
   		})
   		
   		function to_page(pn){
   			$.ajax({
   				url:"${APP_PATH }/emps",
   				data:"pn="+pn,
   				type:"get",
   				success:function(result){
   					//console.log(result);
   					//1.解析并显示员工信息
   					build_emps_table(result);
   					//2.解析并显示分页信息
   					build_page_info(result);
   					build_page_nav(result);
   				}
   			})
   		}
   		
   		function build_emps_table(result){
   			$("#emps_table tbody").empty();
   			var emps=result.extend.page.list;
   			$.each(emps,function(index,item){
   				var empIdTd=$("<td></td>").append(item.empId);
   				var empNameTd=$("<td></td>").append(item.empName);
   				var genderTd=$("<td></td>").append(item.gender=="M"?"男":"女");
   				var emailTd=$("<td></td>").append(item.email);
   				var deptNameTd=$("<td></td>").append(item.department.deptName);
   				var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm")
   							.append($("<span></span>").addClass("glyphicon glyphicon-pencil").attr("aria-hidden","true"))
   							.append("编辑");
   				var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm")
   							.append($("<span></span>").addClass("glyphicon glyphicon-trash").attr("aria-hidden","true"))
   							.append("删除");
   				var btnTd=$("<td></td>").append(editBtn).append("  ").append(delBtn);
   				//append方法执行完成以后还是返回原来的元素
   				$("<tr></tr>").append(empIdTd).append(empNameTd)
   				.append(genderTd).append(emailTd).append(deptNameTd)
   				.append(btnTd)
   				.appendTo("#emps_table tbody");
   			})
   		}
   		
   		
   		//解析显示分页信息
   		function build_page_info(result){
   			$("#page_info_area").empty();
   			$("#page_info_area").append("当前"+result.extend.page.pageNum+"页，总"+result.extend.page.pages+"页，总"+result.extend.page.total+"条记录");
   			totalRecord=result.extend.page.total;
   		}
   		//解析显示分页条
   		function build_page_nav(result){
   			$("#page_nav_area").empty();
   			var ul=$("<ul></ul>").addClass("pagination");
   			var firstPageLi=$("<li></li>").append($("<a></a>").append("首页"));
   			var prePageLi=$("<li></li>").append($("<a></a>").append($("<span></span>").attr("aria-hidden","true").append("&laquo;")).attr("aria-hidden","true"));
   			if(result.extend.page.hasPreviousPage==false){
   				firstPageLi.addClass("disabled");
   				prePageLi.addClass("disabled");
   			}else{
	   			firstPageLi.click(function(){
	   				to_page(1);
	   			});
	   			prePageLi.click(function(){
	   				to_page(result.extend.page.pageNum-1);
	   			});
   			}
   			var nextPageLi=$("<li></li>").append($("<a></a>").append($("<span></span>").attr("aria-hidden","true").append("&raquo;")).attr("aria-hidden","true"));
   			var lastPageLi=$("<li></li>").append($("<a></a>").append("末页"));
   			if(result.extend.page.hasNextPage==false){
   				nextPageLi.addClass("disabled");
   				lastPageLi.addClass("disabled");
   			}else{
   				nextPageLi.click(function(){
   					to_page(result.extend.page.pageNum+1);
	   			});
	   			lastPageLi.click(function(){
	   				to_page(result.extend.page.pages);
	   			});
   			}
   			
   			ul.append(firstPageLi).append(prePageLi);

   			$.each(result.extend.page.navigatepageNums,function(index,item){
   				//  <li><a href="#">4</a></li>
   				var numLi=$("<li></li>").append($("<a></a>").append(item));
   				if(result.extend.page.pageNum==item){
   					numLi.addClass("active");
   				}
   				numLi.click(function(){
   					to_page(item);
   				});
   				ul.append(numLi);
   			})
   			ul.append(nextPageLi).append(lastPageLi);
   			var nav=$("<nav></nav>").attr("aria-label","Page navigation").append(ul).appendTo("#page_nav_area");
   		}
   		
   		function reset_form(ele){
   			$(ele)[0].reset();
   			//清空表单样式
   			$(ele).find("*").removeClass("has-error has-success");
   			$(ele).find(".help-block").text("");
   			
   		}
   		
   		//点击新增按钮弹出模块
   		$("#emp_add_model_btn").click(function(){
   			//清空表单（重置表单）
   			reset_form("#empAddModal form");
   			//发送ajax请求，查出部门信息，显示在下拉列表中
   			$("#empAddModal select").empty();
   			getDepts();
   			//弹出模态框
   			$('#empAddModal').modal({
   				backdrop:"static"
   			});
   		});
   		
   		//查出所有的部门信息并显示在下拉列表中
   		function getDepts(){
   			$.ajax({
   				url:"${APP_PATH}/depts",
   				type:"GET",
   				success:function(result){
   					//console.log(result);
   					//显示部门信息在下拉列表中
   					$.each(result.extend.depts,function(){
   						var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
   						optionEle.appendTo("#empAddModal select");
   					})
   				}
   			});
   		}
   		
   		//校验表单数据
   		function validate_add_form(){
   			//1、拿到要检验的数据，使用正则表达式
   			var empName=$("#empName_add_input").val();
   			var regName=/(^[0-9a-zA-Z_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
   			if(!regName.test(empName)){
   				//alert("用户名可以是2-5位中文和6-16位英文和数字的组合");
   				show_validate_mag("#empName_add_input","error","用户名可以是2-5位中文和6-16位英文和数字的组合" );
   				return false;
   			}else{	
   				show_validate_mag("#empName_add_input","success","");
   			}
   			
   			//2、检验邮箱信息
   			var email=$("#email_add_input").val();
   			var regEmail=/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
   			if(!regEmail.test(email)){
   				//alert("邮箱格式不正确");
   				show_validate_mag("#email_add_input","error","邮箱格式不正确");
   				
   				return false;
   			}else{
   				show_validate_mag("#email_add_input","success","");
   			}
			return true;    			
   		}
   		
   		//显示校验结果的提示信息
   		function show_validate_mag(ele,status,msg){
   			//清除当前元素的校验状态
   			$(ele).parent().removeClass("has-success has-error");
   			$(ele).next("span").text("");
   			if("success"==status){
   				$(ele).parent().addClass("has-success");
   				$(ele).next("span").text(msg);
   			}else if("error"==status){
   				$(ele).parent().addClass("has-error");
   				$(ele).next("span").text(msg);
   			}
   		}
   		
   		//校验用户名是否可用
   		$("#empName_add_input").change(function(){
   			//发送ajax请求校验用户名是否可用
   			var empName=this.value;
   			$.ajax({
   				url:"${APP_PATH}/checkuser",
   				data:"empName="+empName,
   				type:"POST",
   				success:function(result){
   					if(result.code==100){
   						show_validate_mag("#empName_add_input","success","用户名可用");
   						$("#emp_save_btn").attr("ajax-va","success");
   					}else{
   						show_validate_mag("#empName_add_input","error",result.extend.va_msg);
   						$("#emp_save_btn").attr("ajax-va","error");
   					}
   				}
   			});
   				
   		});
   		
   		//点击保存，保存员工
   		$("#emp_save_btn").click(function(){
   			//0.先对要提交给服务器的数据进行验证
   			
   			if(!validate_add_form()){
   				return false;
   			}
   			//判断之前的ajax用户名校验是否成功，如果成功
   			if($(this).attr("ajax-va")=="error"){
   				return false;
   			}
   			//1.模态框中填写的表单数据提交给服务器进行保存
   			//2.发送ajax请求保存员工
   			$.ajax({
   				url:"${APP_PATH}/emp",
   				type:"POST",
   				data:$("#empAddModal form").serialize(),
   				success:function(result){
   					//alert(result.msg);
   					if(result.code==100){
	   					//1、关闭模态框
	   					$('#empAddModal').modal('hide'); 
	   					//2、来到最后一页，显示刚才保存的数据
	   					to_page(totalRecord);
   					}else{
   						//console.log(result);
   						//有哪个字段的错误信息就显示哪个字段的；
   						if(undefined!=result.extend.errorFields.email){
   							//显示邮箱的错误信息
   							show_validate_mag("#email_add_input","error",result.extend.errorFields.email);
   						}
   						if(undefined!=result.extend.errorFields.empName){
   							//显示员工名的错误信息
   							show_validate_mag("#empName_add_input","error",result.extend.errorFields.empName);
   						}
   					}
   				}
   				
   			})
   		})
   		
   		
   	</script>
  </body>
</html>
