<%-- 
    Document   : Edit Profile
    Created on : Mar 25, 2022, 6:23:54 AM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
            if(request.getParameter("btn_save")!=null){
            String upd="update tbl_projectcenter set projectcenter_name='"+request.getParameter("txt_name")+"', projectcenter_contact='"+request.getParameter("txt_contact")+"', projectcenter_email='"+request.getParameter("txt_email")+"',projectcenter_address='"+request.getParameter("txt_address")+"' where projectcenter_id='"+session.getAttribute("projectcenterid")+"'";
          //  out.println(upd); 
            con.executeCommand(upd);
             response.sendRedirect("Myprofile.jsp");
            }
             String sel="select*from tbl_projectcenter where projectcenter_id='"+session.getAttribute("projectcenterid")+"'";
             ResultSet rs1=con.selectCommand(sel);
             while(rs1.next()){
        %>
        <h1 align="center">EDIT PROFILE</h1>
         <form method="post">
             <table align="center" border="2" cellpadding="10">
             <tr>
                <td>Name</td>
                <td><input type="text" name="txt_name" autocomplete="off"  value="<%=rs1.getString("projectcenter_name")%>"></td>
            </tr>        
             <tr>
                <td>Contact</td>
                <td><input type="pattern" name="txt_contact" pattern="[0-9]{10}" value="<%=rs1.getString("projectcenter_contact")%>"></td>
             </tr>
             <tr>
                <td>Email</td>
                <td><input type="email" name="txt_email" value="<%=rs1.getString("projectcenter_email")%>"></td>
             </tr> 
             <tr>
                <td>Address</td>
                <td><textarea name="txt_address"><%=rs1.getString("projectcenter_address")%></textarea></td>
             </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btn_save" value="save">
                </td>
                
            </tr>
           <%}%>
        </table>
   </form>
 </body>
</html>
<%@include  file="Foot.jsp" %>