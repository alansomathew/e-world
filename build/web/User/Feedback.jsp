<%-- 
    Document   : Feedback
    Created on : Apr 11, 2022, 3:51:12 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
    </head>
    <body>
        <%
        if (request.getParameter("btn_save") != null) {
                String f = request.getParameter("txt_feedback");
                String ins = "insert into tbl_feedback(feedback_content,feedback_date,user_id)values('" + f + "',curdate(),'"+session.getAttribute("userid")+"')";
                //out.println(ins);
                con.executeCommand(ins);
            }
        %>
        <form method="post">
        <h1 align="center">FEEDBACK</h1>
        <table align="center" border="1" cellpadding="10">
         <tr>
                    <td>Feedback</td>
                    <td><textarea name="txt_feedback"></textarea></td>
         </tr>
         <tr>
                    <td colspan="2" align="center">
                    <input type="submit" name="btn_save" value="save">
                    <input type="reset" name="btn_cancel" value="cancel">
                    </td>
         </tr>
         </table>
        </form>
    </body>
</html>
