<%-- 
    Document   : Homepage
    Created on : Mar 24, 2022, 4:16:24 PM
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
        <h1><%=session.getAttribute("projectcentername")%></h1><br>
        <a href="Myprofile.jsp">My Profile</a><br>
          <a href="Changepassword.jsp">Change Password</a><br>
          <a href="Edit profile.jsp">Edit Profile</a><br>
          <a href="Staff.jsp">Staff</a><br>
          <a href="Course.jsp">Course</a><br>
          <a href="Syllabus.jsp">Syllabus</a><br>
          <a href="Viewstaff.jsp">View Staff</a><br>
          <a href="ViewRequest.jsp">View Request</a><br>
          <a href="Feedback.jsp">Feedback</a><br>
          <a href="Complaint.jsp">Complaint</a><br>
          <a href="Viewsendcomplaint.jsp">View Send Complaint</a><br>
      
    </body>
</html>
