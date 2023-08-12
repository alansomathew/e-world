<%-- 
    Document   : ViewCourse
    Created on : Apr 6, 2022, 3:32:23 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Course</title>
    </head>
    <body>
        <h1 align="center">VIEW COURSE</h1>
        <form method="post">
            <table>
                <tr>
                        <%
                            String sel1 = "select * from tbl_course c inner join tbl_coursetype ct on c.coursetype_id=ct.coursetype_id inner join tbl_language l on c.language_id=l.language_id  where projectcenter_id='"+ request.getParameter("pgid") +"'";
                            ResultSet rs1 = con.selectCommand(sel1);
                            int Count = 0;
                            while (rs1.next()) {

                                Count++;

                        %>

                        <td>
                            <p style="text-align:center; border: 1px  solid #999;margin: 22px;padding: 10px;">
                                <br>
                                Course Type: <%=rs1.getString("coursetype_name")%>
                                <br>
                                Course: <%=rs1.getString("course_name")%>
                                <br>
                                Language: <%=rs1.getString("language_name")%>
                                <br>
                                Rate : <%=rs1.getString("course_amount")%>
                                <br>
                                Period: <%=rs1.getString("course_duration")%>
                                 <br>
                                 <br>
                                <a href="ViewSyllabus.jsp?pgid=<%=rs1.getString("course_id")%>">View Syllabus</a>
                                
                               
                            </p>                                                                  

                        </td>

                        <%
                            if (Count == 4) {
                        %>
                    </tr>
                    <tr>
                        <%
                                Count=0;
                                }
                            }

                        %>
                    </tr>
                        
            </table>
        </form>
    </body>
</html>
