<%-- 
    Document   : Viewsendcomplaint
    Created on : Apr 13, 2022, 3:17:46 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Send Complaint</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <h1 align="center">VIEW COMPLAINT</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Si no</td>
                    <td>Complaint Type</td>
                    <td>Complaint</td>
                    <td>Date</td>
                    <td>Reply</td>
                    <td>Reply Date</td>  
                    <td>Action</td>
                    </tr>
                <%
                    String selcompl = "select *from tbl_complaint c inner join tbl_complainttype ct on c.complainttype_id=ct.complainttype_id inner join tbl_projectcenter pc on c.projectcenter_id=pc.projectcenter_id";
                    ResultSet dd = con.selectCommand(selcompl);
                    int i = 0;
                    while (dd.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=dd.getString("complainttype_name")%></td>
                    <td><%=dd.getString("complaint_content")%></td>
                    <td><%=dd.getString("complaint_date")%></td>
                    <td><%=dd.getString("complaint_reply")%></td>
                    <td><%=dd.getString("reply_date")%></td>
                     </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
<%@include  file="Foot.jsp" %>
