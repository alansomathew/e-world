<%-- 
    Document   : ViewComplaint
    Created on : Apr 12, 2022, 3:19:37 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Complaint</title>
    </head>
    <body>
        <h1 align="center">VIEW COMPLAINT USER</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Si no</td>
                    <td>User Name</td>
                    <td>Complaint Type</td>
                    <td>Complaint</td>
                    <td>Date</td>
                    <td>Action</td>
                    </tr>
                <%
                    String selcompl = "select *from tbl_complaint c inner join tbl_complainttype ct on c.complainttype_id=ct.complainttype_id inner join tbl_user u on c.user_id=u.user_id where c.complaint_status='0' and c.user_id!='0'";
                    ResultSet dd = con.selectCommand(selcompl);
                    int i = 0;
                    while (dd.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=dd.getString("user_name")%></td>
                    <td><%=dd.getString("complainttype_name")%></td>
                    <td><%=dd.getString("complaint_content")%></td>
                    <td><%=dd.getString("complaint_date")%></td>
                    <td><a href="Complaintreply.jsp?aid=<%=dd.getString("complaint_id")%>">Reply</a></td>
                     </tr>
                <%
                    }
                %>
            </table>
        </form>
            <h1 align="center">VIEW COMPLAINT PROJECT CENTER</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Si no</td>
                    <td>Project Center Name</td>
                    <td>Complaint Type</td>
                    <td>Complaint</td>
                    <td>Date</td>
                    <td>Action</td>
                    </tr>
                <%
                    String selcompl1 = "select *from tbl_complaint c inner join tbl_complainttype ct on c.complainttype_id=ct.complainttype_id inner join tbl_projectcenter pc on c.projectcenter_id=pc.projectcenter_id where c.complaint_status='0' and c.projectcenter_id!='0'";
                    ResultSet rs = con.selectCommand(selcompl1);
                    int j = 0;
                    while (rs.next()) {
                        j++;
                %>
                <tr>
                    <td><%=j%></td>
                    <td><%=rs.getString("projectcenter_name")%></td>
                    <td><%=rs.getString("complainttype_name")%></td>
                    <td><%=rs.getString("complaint_content")%></td>
                    <td><%=rs.getString("complaint_date")%></td>
                    <td><a href="Complaintreply.jsp?aid=<%=rs.getString("complaint_id")%>">Reply</a></td>
                     </tr>
                <%
                    }
                %>
            </table>
        </form>
           
    </body>
</html>
