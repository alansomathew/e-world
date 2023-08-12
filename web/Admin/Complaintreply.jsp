<%-- 
    Document   : Complaintreply
    Created on : Apr 13, 2022, 2:27:07 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint Reply</title>
    </head>
    <body>
        <%
        if(request.getParameter("btn_send")!=null)
        {
             String upd="update tbl_complaint set complaint_reply='"+request.getParameter("txt_complaintreply")+"', complaint_status='1',reply_date=curdate() where complaint_id='"+request.getParameter("txt_hidden")+"'";
             con.executeCommand(upd);
             response.sendRedirect("ViewComplaint.jsp");
        }
        %>
        <h1 align="center">COMPLAINT REPLY</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Complaint Reply</td>
                    <input type="hidden" name="txt_hidden" value="<%=request.getParameter("aid")%>">
                    <td><textarea name="txt_complaintreply"></textarea></td>
                </tr>
            <tr>
                    <td colspan="2" align="center">
                    <input type="submit" name="btn_send" value="send">
                    <input type="reset" name="btn_cancel" value="cancel">
                    </td>
         </tr>
         </table>
        </form>    
    </body>
</html>
