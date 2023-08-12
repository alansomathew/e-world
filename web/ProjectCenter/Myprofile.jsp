<%-- 
    Document   : Myprofile
    Created on : Mar 24, 2022, 4:33:15 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <h1 align="center">MY PROFILE</h1>
         <form method="post">
        <table align="center" border="1" cellpadding="10">       
        <%
        String sel="select*from tbl_projectcenter where projectcenter_id='"+session.getAttribute("projectcenterid")+"'";
        ResultSet rs1=con.selectCommand(sel);
        while(rs1.next())
        {
            %>
            <tr>
                <td>Name</td>
                <td><%=rs1.getString("projectcenter_name")%></td>
            </tr>        
             <tr>
                <td>Contact</td>
                <td><%=rs1.getString("projectcenter_contact")%></td>
            </tr>
             <tr>
                <td>Email</td>
                <td><%=rs1.getString("projectcenter_email")%></td>
            </tr> 
             <tr>
                <td>Address</td>
                <td><%=rs1.getString("projectcenter_address")%></td>
            </tr> 
                
        <%}%>
     </table>     
    </body>
</form>
</html>
<%@include  file="Foot.jsp" %>