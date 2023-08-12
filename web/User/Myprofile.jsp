<%-- 
    Document   : Myprofile
    Created on : Mar 19, 2022, 2:57:17 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My profile</title>
    </head>
    <body>
        <h1 align="center">MY PROFILE</h1>
         <form method="post">
        <table align="center" border="1" cellpadding="10">       
        <%
        String sel="select*from tbl_user where user_id='"+session.getAttribute("userid")+"'";
        ResultSet rs=con.selectCommand(sel);
        while(rs.next())
        {
            %>
            <tr>
                <td>Name</td>
                <td><%=rs.getString("user_name")%></td>
            </tr>        
             <tr>
                <td>Contact</td>
                <td><%=rs.getString("user_contact")%></td>
            </tr>
             <tr>
                <td>Email</td>
                <td><%=rs.getString("user_email")%></td>
            </tr> 
             <tr>
                <td>Address</td>
                <td><%=rs.getString("user_address")%></td>
            </tr> 
                
        <%}%>
     </table>     
    </body>
</form>
</html>
