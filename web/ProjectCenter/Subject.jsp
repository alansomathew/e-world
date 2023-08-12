<%-- 
    Document   : Subject
    Created on : Mar 26, 2022, 11:24:35 AM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
            String cid = request.getParameter("cid");
            if (request.getParameter("btn_save") != null) {
                String na = request.getParameter("txt_name");
                String ins = "insert into tbl_subject(subject_name,course_id)values('" + na + "','" + cid + "')";
                //out.println(ins);
                con.executeCommand(ins);
            }
            if (request.getParameter("did") != null) {
                String del = "delete from tbl_subject where subject_id='" + request.getParameter("did") + "'";
                con.executeCommand(del);
                response.sendRedirect("Subject.jsp");
            }
        %>
        <h1 align="center">SUBJECT</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_save" value="save"> </td>
                </tr>
            </table>
            <br>
            <hr>
            <br> 
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Si no</td>
                    <td>Course</td>
                    <td>Subject</td>
                    <td>Action</td>
                </tr>
                <tr>
                    <%
                        String sel = "select * from tbl_subject s inner join tbl_course c on s.course_id=c.course_id where c.course_id='"+cid+"'";
                        ResultSet dd = con.selectCommand(sel);
                        int i = 0;
                        while (dd.next()) {
                            i++;
                    %>
                <tr>
                    <td><%=i%></td>
                    <td><%=dd.getString("course_name")%></td>
                    <td><%=dd.getString("subject_name")%></td>
                    <td><a href="Subject.jsp?did=<%=dd.getString("subject_id")%>">Delete</a>
                    <td><a href="Syllabus.jsp?sid=<%=dd.getString("subject_id")%>">Add Syllabus</a>
                </tr>
                <%
                    }
                %>


            </table>
        </form>
    </body>
</html>
<%@include  file="Foot.jsp" %>