<%-- 
    Document   : Homepage
    Created on : Mar 19, 2022, 2:39:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1 align="center">HOME PAGE</h1>
        <h1><%=session.getAttribute("username")%></h1><br>
        <a href="Myprofile.jsp">My profile</a><br>
        <a href="Changepassword.jsp">Change password</a><br>
        <a href="Editprofile.jsp">Edit Profile</a><br>
        <a href="ViewProjectcenter.jsp">View Project center </a><br>
         <a href="ViewRequest.jsp">View Request</a><br>
          <a href="Feedback.jsp">Feedback</a><br>
          <a href="Complaint.jsp">Complaint</a><br>
          <a href="Viewsendcomplaint.jsp">View Send Complaint</a>
    </body>
</html>