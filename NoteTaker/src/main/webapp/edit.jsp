<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.helper.*,org.hibernate.*,com.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>

<div class="container">
<%@include file="navbar.jsp" %>
<h1> edit your note</h1>
<br>


<%
    int noteId=Integer.parseInt(request.getParameter("note_id").trim());
Session s=FactoryProvider.getFactory().openSession();
Transaction txTransaction=s.beginTransaction();
Note note=s.get(Note.class, noteId);
%>


<form action="update" method="post">


<input value="<%= note.getId() %>" name="noteId" type="hidden"/>

  <div class="form-group">
    <label for="exampleInputEmail1">Note title</label>
    <input
    name="title" 
    required 
    type="text" 
    class="form-control" 
    id="title" 
    aria-describedby="emailHelp" 
    placeholder="Enter here" 
    value="<%= note.getTitle() %>"
    />
    
  </div>
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea 
    name="content"
    required 
    id="content" 
    placeholder="Enter your content here"
    class="form-control"
    style="height:300px;"><%= note.getContent() %>
    </textarea>
  </div>
 
 <div class="container text-center">
  
   <button type="submit" class="btn btn-success">save your note</button>
 
 </div>
</form>

</div>
	
   
   
</body>
</html>