<%-- 
    Document   : Syllabus
    Created on : Mar 26, 2022, 12:33:14 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Syllabus</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <br><br><br><br><br><br><br><br><br>
        
        <%
            String sid=request.getParameter("sid");
        if(request.getParameter("sid")!=null){
            session.setAttribute("sid", request.getParameter("sid"));
        }
         if (request.getParameter("did") != null) {
                String del = "delete from tbl_syllabus where syllabus_id='" + request.getParameter("did") + "'";
                con.executeCommand(del);
                response.sendRedirect("Syllabus.jsp");
            }
        %>
        <h1 align="center">SYLLABUS</h1>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/SyllabusUploadAction.jsp">
            <div id="tab">
        <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Syllabus</td>
                    <td><input type="file" name="txt_syllabus" required=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                    <input type="submit" name="btn_save" value="save">
                </tr>
        </table>
            <br>
            <hr>
            <br> 
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Si no</td>
                    <td>Course</td>
                    <td>Syllabus</td>
                    <td>Action</td>
                </tr>
                <tr>
                    <%
                        String sel = "select * from tbl_syllabus s inner join tbl_course c on c.course_id=s.course_id where s.course_id='"+sid+"'";
                        ResultSet dd = con.selectCommand(sel);
                        int i = 0;
                        while (dd.next()) {
                            i++;
                    %>
                <tr>
                    <td><%=i%></td>
                    <td><%=dd.getString("course_name")%></td>
                    <td><img src="../Assets/Syllabus/<%=dd.getString("syllabus_file")%>" width="120"height="120"></td>
                    <td><a href="Syllabus.jsp?did=<%=dd.getString("syllabus_id")%>">Delete</a>
                    
                </tr>
                <%
                    }
                %>


            </table>
            </div>
        </form>
        </body>
</html>
<br><br><br><br><br><br>
<%@include  file="Foot.jsp" %>