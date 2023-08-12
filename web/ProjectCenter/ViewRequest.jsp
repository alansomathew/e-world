<%-- 
    Document   : ViewRequest
    Created on : Apr 7, 2022, 2:54:05 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
         <%
            if (request.getParameter("aid") != null) {
                String up1 = "update tbl_request set request_status='1' where request_id='" + request.getParameter("aid") + "'";
                con.executeCommand(up1);
                response.sendRedirect("ViewRequest.jsp");
            }
            if (request.getParameter("rid") != null) {
                String up2 = "update tbl_request set request_status='2'where request_id='" + request.getParameter("rid") + "'";
                con.executeCommand(up2);
                response.sendRedirect("ViewRequest.jsp");
            }
        %>
        
     <h1 align="center">VIEW REQUEST</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Si no</td>
                    <td>UserName</td>
                    <td>Course</td>
                    <td>Date Of Booking</td>
                    <td>From Date</td>
                    <td>Action</td>
                </tr>
                <%
                    String selrequest = "select *from tbl_request r inner join tbl_user u on r.user_id=u.user_id inner join tbl_course c on r.course_id=c.course_id inner join tbl_projectcenter pc on c.projectcenter_id=pc.projectcenter_id where r.request_status='0' and pc.projectcenter_id='"+ session.getAttribute("projectcenterid")+"'";
                    //out.println(selprojectc);
                    ResultSet dd = con.selectCommand(selrequest);
                    int i = 0;
                    while (dd.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=dd.getString("user_name")%></td>
                    <td><%=dd.getString("course_name")%></td>
                    <td><%=dd.getString("request_dob")%></td>
                    <td><%=dd.getString("request_date")%></td>  
                    <td>
                        <a href="ViewRequest.jsp?aid=<%=dd.getString("request_id")%>">Accept</a>
                        <a href="ViewRequest.jsp?rid=<%=dd.getString("request_id")%>">Reject</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
   </body>
</html>
<%@include  file="Foot.jsp" %>