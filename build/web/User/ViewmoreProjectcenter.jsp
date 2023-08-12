<%-- 
    Document   : ViewmoreProjectcenter
    Created on : Apr 6, 2022, 3:07:57 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View More Project Center </title>
    </head>
    <body>
        <h1 align="center">VIEW MORE PROJECT CENTER</h1>
         <form method="post">
            <table align="center" border="2" cellpadding="10">
                             <tr>
                        <%
                            String sel1 = "select * from tbl_projectcenter where projectcenter_id='"+ request.getParameter("pgid") +"'";
                            ResultSet rs1 = con.selectCommand(sel1);
                            int Count = 0;
                            while (rs1.next()) {

                                Count++;

                        %>

                        <td>
                            <p style="text-align: center; border: 1px  solid #999;margin: 22px;padding: 10px;">
                                <img src="../Assets/ProjectCenterphoto/<%=rs1.getString("projectcenter_photo")%>" height="120" width="120"/>
                                <br>
                                <%=rs1.getString("projectcenter_name")%>
                                <br>
                                <%=rs1.getString("projectcenter_contact")%>
                                <br>
                                <%=rs1.getString("projectcenter_email")%>
                                <br>
                                 <%=rs1.getString("projectcenter_address")%>
                                <br>
                                 <%=rs1.getString("projectcenter_photo")%>
                                 <br>
                                 <br>
                                <a href="ViewCourse.jsp?pgid=<%=rs1.getString("projectcenter_id")%>">View Course</a>
                                
                               

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
