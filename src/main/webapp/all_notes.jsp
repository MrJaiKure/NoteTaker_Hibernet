<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes</title>
<%@include file="all-js-css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>

		<br>
		<h1>ALL NOTES</h1>
		<div class="row">
			<div class="col-12"> 
			<%
 Session s = FactoryProvider.getFactory().openSession();
 Query q = s.createQuery("from Note");
 List<Note> list = q.list();
 for (Note note : list) {
 	/* out.println(note.getId() + " " + note.getTitle() + "<br>"); */
 
 %>
			<div class="card mt-3 max-height=100px">
				<img class="card-img-top m-4" style="max-width:60px "src="images/notes.png" class="card-img-top" alt="...">
				<div class="card-body px-5">
					<h5 class="card-title"><%= note.getTitle()%></h5>
					<p class="card-text">
						<%=note.getContent()%>
					</p>
					<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
					<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
				</div>
			</div>
			<%
 }
			s.close();
			%>
			
		</div>
	</div>


	</div>

</body>
</html>