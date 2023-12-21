<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.cya.pojo.Type,com.cya.dao.AdminDao,com.cya.dao.TypeDao,com.cya.dao.BookDao,com.cya.pojo.Admin" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>图书管理-管理员系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/books/css/bootstrap.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/books/css/bootstrap-theme.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/books/css/bootstrap-admin-theme.css">
		<script src="${pageContext.request.contextPath}/books/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/books/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/books/js/bootstrap-dropdown.min.js"></script>
        <script src="${pageContext.request.contextPath}/books/js/reader.js"></script>

        <script src="${pageContext.request.contextPath}/books/js/readerUpdateInfo.js"></script>
        <script src="${pageContext.request.contextPath}/books/js/readerUpdatePwd.js"></script>
        <script src="${pageContext.request.contextPath}/books/js/index.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/books/css/index.css" />
	</head>

	<body>
	
	<!-- 判断是否已经登录 -->
    <%
      Admin admin = new Admin();
      String aid = (String) session.getAttribute("aid");
      if(aid==null || aid.equals("")){
    	  //没有登录
    	  response.sendRedirect("../login.jsp"); //重定向到登录页面
          return ;
      }
      else{
    	  AdminDao admindao = new AdminDao();
          admin = admindao.get_AidInfo2(aid);
      }

    %>
		<div class="head">
			<img class="img" src="${pageContext.request.contextPath}/books/img/title-yellow1.png"></img>
			<div class="userName">
				<a href="${pageContext.request.contextPath}/books/admin/index.jsp"><% out.write(admin.getName());%></a>
			</div>
			<div class="daohang">
				<ul>
					<li style="margin-left: 100px;">
						<a href="${pageContext.request.contextPath}/books/admin/admin_books.jsp">图书管理</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/books/admin/admin_booksType.jsp">图书分类管理</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/books/admin/admin_borrows.jsp">图书借阅信息</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/books/admin/admin_history.jsp">图书归还信息</a>
					</li>
					
					<li>
						<a href="${pageContext.request.contextPath}/books/admin/admin_notice.jsp">公告管理</a>
					</li>
					
					<li>
						<a href="${pageContext.request.contextPath}/books/admin/admin_users.jsp">读者管理</a>
					</li>
					<li class="dropdown">
						<a href="#" class="" role="button" data-hover="dropdown">我的</a>
						<ul class="dropdown-menu">
                                <li><a href="#updateinfo" data-toggle="modal">个人资料</a></li>
                                <li><a href="#updatepwd" data-toggle="modal">修改密码</a></li>
                                <li><a href="${pageContext.request.contextPath}/ExitServlet?id=<%=aid %>&&status=aid">退出</a></li>
                         </ul>
					</li>
				</ul>
			</div>
		</div>
		<div style="width: 100%;float: left;height: 310px;"></div>
		<div class="body">
			<div class="content">
				<div class="left">
					<div class="gongGao">
						<div class="title">公 告</div>
						<div class="context">你是管理员，请<a style="display:inline-block;" href="${pageContext.request.contextPath}/books/admin/admin_notice.jsp">发布公告</a></div>
					</div>
					<div class="gongGao">
						<div class="title">友 情 链 接</div>
						<div class="context">
						   <a href="https://blog.csdn.net/qq_40625778">》CSDN，技术分享</a>
						   <a href="https://www.cnblogs.com/cafuc20160512056/">》博客园，技术分享</a>
						   <a href="https://www.jianshu.com/u/33531987c9a7">》简书，技术分享</a>
						   <a href="https://y0ahx3.coding-pages.com/">》个人博客</a>
						</div>
					</div>
					<div class="gongGao" style="height:400px;">
						<div class="title">源 码 下 载</div>
						<div class="context">
						   <div style="font-size:14px; width: 100%;  height: 400px;margin-bottom: 20px;">
			<div style="padding: 5px;  color: black">
                                <label style="font-size:15px;font-weight: normal;">下载源码请到公众号：C you again</label><br />
				<label style="font-size:15px;font-weight: normal;">1、求职者：面试题、面试经验、面试技巧</label><br />
				<label style="font-size:15px;font-weight: normal;">2、职场人：技术分享、程序人生</label><br />
				<label style="font-size:15px;font-weight: normal;">3、学生党：Java从入门到精通PDF版教程、数据结构与算法、各类系统实战教程</label><br />
				<label style="font-size:15px;font-weight: normal;">4、其它：PPT模板、简历模板、计算机使用技术及技巧</label>
			</div>
                        <img width="160px" style="position: relative;left: 50%;margin-left: -80px;" src="${pageContext.request.contextPath}/books/img/ghz.jpg" />
		</div>
						</div>
					</div>
				</div>
				<div class="right">
				   <div class="container">
    <!-- left, vertical navbar & content -->
    <div class="row">
       
        <!-- content -->
        <div class="col-md-10">


            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default bootstrap-admin-no-table-panel">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">图书分类管理</div>
                        </div>
                        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                            <form class="form-horizontal" action="${pageContext.request.contextPath}/selectServlet" method="post">

                                <div class="col-lg-3 form-group">

                                    <button type="button" class="btn btn-primary" id="btn_add" data-toggle="modal"
                                            data-target="#addModal">添加分类
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>图书分类名称</th>
                            <th>操作</th>

                        </tr>
                        </thead>


                        <!---在此插入信息-->
                        <%
                            ArrayList<Type> bookdata = new ArrayList<Type>();
                            bookdata = (ArrayList<Type>) request.getAttribute("data");
                            if (bookdata == null) {
                                TypeDao bookdao = new TypeDao();
                                bookdata = (ArrayList<Type>) bookdao.get_ListInfo();
                            }

                            for (Type bean : bookdata) {
                        %>
                        <tbody>

                        <td><%= bean.getName() %>
                        </td>

                        <td>
                            <button type="button" class="btn btn-warning btn-xs" data-toggle="modal"
                                    data-target="#updateModal"
                                    id="btn_update" onclick="showInfo2('<%= bean.getTid() %>','<%= bean.getName() %>')">
                                修改
                            </button>
                            <button type="button" class="btn btn-danger btn-xs"
                                    onclick="deletebook(<%= bean.getTid() %>)">删除
                            </button>
                        </td>
                        </tbody>
                        <%} %>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function showInfo2(tid, name) {
            document.getElementById("updatetid").value = tid;
            document.getElementById("updatename").value = name;
        }

        function deletebook(tid) {
            con = confirm("是否删除?");
            if (con == true) {
                location.href = "/manage_books/deleteTypeServlet?tid=" + tid;
            }
        }
    </script>
</div>
				   
   
				</div>
			</div> 

	</div>
	
	<div class="foot"><label class="lable">获取更多资源请关注公众号：C you again,版权申明：使用请注明原地址</label></div>
	
	
	
	<!-------------------------个人资料模糊框------------------------------------->

<form class="form-horizontal" method="post" action="/manage_books/AdminServlet">   <!--保证样式水平不混乱-->
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="updateinfo" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="ModalLabel">
                        个人资料
                    </h4>
                </div>

                <div class="modal-body">

                    <!--正文-->
                    <input type="hidden" name="tip" value="2">
                    <input type="hidden" name="url" value="admin/admin_booksType">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">真实姓名</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="name" name="name" placeholder="请输入您的真实姓名"
                                   value='<% out.write(admin.getName());%>'>
                            <label class="control-label" for="name" style="display: none"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">手机号</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入您的手机号"
                                   value='<% out.write(admin.getPhone());%>'>
                            <label class="control-label" for="phone" style="display: none"></label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">邮箱</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="email" name="email" placeholder="请输入您的邮箱"
                                   value='<% out.write(admin.getEmail());%>'>
                            <label class="control-label" for="email" style="display: none"></label>
                        </div>
                    </div>

                    <!--正文-->


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        修改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</form>
<!-------------------------------------------------------------->

<!-------------------------------------------------------------->

<form class="form-horizontal" method="post" action="/manage_books/AdminServlet">   <!--保证样式水平不混乱-->
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="updatepwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        修改密码
                    </h4>
                </div>
                <div class="modal-body">

                    <!--正文-->
                    <input type="hidden" name="tip" value="1">
                    <input type="hidden" name="url" value="admin/admin_booksType">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">原密码</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" name="password" id="oldPwd"
                                   placeholder="请输入原密码">
                            <label class="control-label" for="oldPwd" style="display: none"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">新密码</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" name="password2" id="newPwd"
                                   placeholder="请输入新密码">
                            <label class="control-label" for="newPwd" style="display: none"></label>
                        </div>
                    </div>

                    <!--正文-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        修改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</form>
<!-------------------------------------------------------------->

  <!-- 修改模态框（Modal） -->
    <!-------------------------------------------------------------->

    <!-- 修改模态框（Modal） -->
    <form class="form-horizontal" method="post" action="/manage_books/updateBookTypeServlet">   <!--保证样式水平不混乱-->
        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="updateModalLabel">
                            修改图书分类
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">图书名称</label>
                            <div class="col-sm-7">
                                <input type="hidden" name="tid" id="updatetid">
                                <input type="text" class="form-control" id="updatename" name="name"
                                       placeholder="请输入图书分类名称">
                                <label class="control-label" for="updateBookName" style="display: none;"></label>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            修改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </form>
    <!-------------------------------------------------------------->


    <!--------------------------------------添加的模糊框------------------------>
    <form class="form-horizontal" method="post" action="/manage_books/AddBookTypeServlet">   <!--保证样式水平不混乱-->
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            添加新图书分类
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">分类名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="addBookName" required="required" name="name"
                                       placeholder="请输入图书分类名称">
                                <label class="control-label" for="addBookName" style="display: none;"></label>
                            </div>
                        </div>

                        <!---------------------表单-------------------->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            添加
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </form>
    <!--------------------------------------添加的模糊框------------------------>

	
	</body>
	
	

</html>