<%-- 
    Document   : Changepassword
    Created on : Mar 25, 2022, 6:23:09 AM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <br><br><br><br><br><br><br>
         <%
        if(request.getParameter("btn_update")!=null)
        {    
        String sel="select * from tbl_projectcenter where projectcenter_password='"+request.getParameter("txt_oldpassword")+"' and projectcenter_id='"+session.getAttribute("projectcenterid")+"'";
        ResultSet rs=con.selectCommand(sel);
        if(!rs.next())
        {
            %>
            <script>
                alert('incorrect password');
            </script>
            <%
        }
         else
         {
             if(request.getParameter("txt_newpassword").equals(request.getParameter("txt_confirmpassword")))
             {
              String upd="update tbl_projectcenter set projectcenter_password='"+request.getParameter("txt_newpassword")+"' where projectcenter_id='"+session.getAttribute("projectcenterid")+"'";
              con.executeCommand(upd);
              response.sendRedirect("Homepage.jsp");
             }
             else
              {
            %>
            <script>
                alert('password missmatch');
            </script>
            <%
         }
      }
    }
  %>
        
        <form method="post">
            <h1 align="center">CHANGE PASSWORD</h1>
            <div id="tab">
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Current password</td>
                    <td><input type="password" name="txt_oldpassword" pattern="[A-Za-z0-9!@#$%^&*()_]{6-9}" required=""></td>
                </tr>
                <tr>
                    <td>New password</td>
                    <td><input type="password" name="txt_newpassword" pattern="[A-Za-z0-9!@#$%^&*()_]{6-9}" required=""></td>
                </tr>
                <tr>
                    <td>Confirm password</td>
                    <td><input type="password" name="txt_confirmpassword" pattern="[A-Za-z0-9!@#$%^&*()_]{6-9}" required=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_update" value="update">
                    </td>
                </tr> 
            </table>
            </div>
        </form>
    </body>
</html>
<br><br><br><br><br>
<%@include  file="Foot.jsp" %>