<%-- 
    Document   : Changepassword
    Created on : Mar 19, 2022, 3:15:23 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change password</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        
        <%
        if(request.getParameter("btn_update")!=null)
        {    
        String sel="select * from tbl_user where user_password='"+request.getParameter("txt_oldpassword")+"' and user_id='"+session.getAttribute("userid")+"'";
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
              String upd="update tbl_user set user_password='"+request.getParameter("txt_newpassword")+"' where user_id='"+session.getAttribute("userid")+"'";
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
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Current password</td>
                    <td><input type="password" name="txt_oldpassword"  pattern="[A-Za-z0-9!@#$%^&*()_]{6-9}" required=""></td>
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
        </form>
                
        
    </body>
</html>
<%@include file="Foot.jsp" %>
