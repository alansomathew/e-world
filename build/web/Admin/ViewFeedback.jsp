<%-- 
    Document   : ViewFeedback
    Created on : Apr 12, 2022, 10:36:19 AM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Feedback</title>
    </head>
    <body>
        <h1 align="center">VIEW FEEDBACK</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Si no</td>
                    <td>Feedback Content</td>
                    <td>Feedback Date</td>
                </tr>
                 <%
                    String selfeedback = "select *from tbl_feedback";
                    //out.println(selfeedback);
                    ResultSet dd = con.selectCommand(selfeedback);
                    int i = 0;
                    while (dd.next()) {
                        i++;
                         
                        
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=dd.getString("feedback_content")%></td>
                    <td><%=dd.getString("feedback_date")%></td>
                </tr>
                <%
                     }

                %>
                    
            </table>
        </form>
    </body>
</html>
