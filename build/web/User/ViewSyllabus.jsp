<%-- 
    Document   : ViewSyllabus
    Created on : Apr 7, 2022, 11:16:33 AM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Syllabus</title>
    </head>
    <body>
        <h1 align="center">VIEW SYLLABUS</h1>
         <form method="post">
            <table>
                <tr>
                        <%
                            String sel1 = "select * from tbl_syllabus s inner join tbl_course c  on s.course_id= c.course_id  where s.course_id='"+ request.getParameter("pgid") +"'";
                            ResultSet rs1 = con.selectCommand(sel1);
                            int Count = 0;
                            while (rs1.next()) {

                                Count++;

                        %>

                        <td>
                            <p style="text-align:center; border: 1px  solid #999;margin: 22px;padding: 10px;">
                                <br>
                                Course: <%=rs1.getString("course_name")%>
                                <br>
                                <a href="../Assets/Syllabus/<%=rs1.getString("syllabus_file")%>" download>Download</a>
                                <br>
                                 <a href="RegistrationNow.jsp?pgid=<%=rs1.getString("course_id")%>">Registration Now</a>
                                 <br>
                                <br>
                              
                                
                               
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
