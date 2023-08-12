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
        <h1 align="center">EDIT PROFILE</h1>
         <form method="post">
        <table align="center" border="1" cellpadding="10">       
        <%
            if(request.getParameter("btn_save")!=null){
            String upd="update tbl_user set user_name='"+request.getParameter("txt_name")+"', user_contact='"+request.getParameter("txt_contact")+"', user_email='"+request.getParameter("txt_email")+"',user_address='"+request.getParameter("txt_address")+"' where user_id='"+session.getAttribute("userid")+"'";
          //  out.println(upd); 
            con.executeCommand(upd);
             response.sendRedirect("Myprofile.jsp");
            }
            
        String sel="select*from tbl_user where user_id='"+session.getAttribute("userid")+"'";
        ResultSet rs=con.selectCommand(sel);
        while(rs.next())
        {
            %>
            <tr>
                <td>Name</td>
                <td><input type="text" name="txt_name" required="" autocomplete="off" value="<%=rs.getString("user_name")%>"></td>
            </tr>        
             <tr>
                <td>Contact</td>
                <td><input type="pattern" name="txt_contact" pattern="[0-9]{10}" required="" value="<%=rs.getString("user_contact")%>"></td>
            </tr>
             <tr>
                <td>Email</td>
                <td><input type="email" name="txt_email" required="" value="<%=rs.getString("user_email")%>"></td>
            </tr> 
             <tr>
                <td>Address</td>
                <td><textarea name="txt_address"><%=rs.getString("user_address")%></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btn_save" value="save">
                </td>
                
            </tr>
                
        <%}%>
     </table>     
    </body>
</form>
</html>
