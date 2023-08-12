<%-- 
    Document   : ViewBatch
    Created on : 29 Apr, 2022, 9:10:07 PM
    Author     : alans
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table align="center">
            <tr>
                <td>Si No</td>
                <td>Course</td>
                <td>Name</td>
                <td>Date</td>
                <td>Start Time</td>
                <td>End Time</td>
                
            </tr>
            <%
            String sel="select * from tbl_batch b inner join tbl_course c on b.course_id=c.course_id where course_id='"+request.getParameter("aid") +"'";
            ResultSet rs=con.selectCommand(sel);
            int i=0;
            while(rs.next()){
                i++;
                %>
            
                <tr>
                    <td><%=i%></td> 
                    <td><%=rs.getString("course_name")%></td> 
                    <td><%=rs.getString("batch_name")%></td>                
                    <td><%=rs.getString("batch_date")%></td>                
                    <td><%=rs.getString("batch_starttime")%></td>                
                    <td><%=rs.getString("batch_endtime")%></td>                
              
                
                </tr>
            
            <%
            }
            %>
        </table>
    </body>
</html>
