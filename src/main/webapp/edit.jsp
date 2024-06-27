<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.helper.*,org.hibernate.*,com.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update page</title>
<%@include file="all-js-css.jsp"%>
</head>
<body>
<div class="container">
		<%@include file="navbar.jsp"%>
		<h1> this is my edit file</h1>
		<%
		int noteId=Integer.parseInt(request.getParameter("note_id").trim());
		Session s =FactoryProvider.getFactory().openSession();
		Note note=(Note)s.get(Note.class,noteId);
		%>
		<form action="UpdateServlet" method="post">
		<input value="<%= note.getId()%>" name="noteId" type="hidden"/>

			<div class="form-group">
				<label for="title">Note title</label> 
				<input 
				name="title"
				required 
				type="text"
				class="form-control" 
				id="title" 
				aria-describedby="emailHelp"
				placeholder="Enter here" 
				value=<%=note.getTitle() %>/>

			</div>


			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea 
				name="content"
				required 
				id="content"
				placeholder="Enter your content here"				 
				class="form-control" 
				style="height: 300px;"		
					><%=note.getContent() %></textarea>


			</div>

			<div class="container text-center my-3">

				<button type="submit" class="btn btn-success">Save</button>
			</div>

		</form>
	</div>

</body>
</html>