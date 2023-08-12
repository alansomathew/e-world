<%-- 
    Document   : Complaint
    Created on : Apr 12, 2022, 2:23:16 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
    </head>
    <body>
         <% 
           
            if (request.getParameter("btn_send") != null) {
                String cc =request.getParameter("txt_complaint");
                String ct =request.getParameter("selcomp");
                String ins = "insert into tbl_complaint(complaint_content,complaint_date,complainttype_id,user_id)values('" + cc + "',curdate(),'" + ct + "','"+session.getAttribute("userid")+"')";
                //out.println(ins);
                con.executeCommand(ins);
            }
        %>
         <form method="post">
        <h1 align="center">COMPLAINT</h1>
        <table align="center" border="1" cellpadding="10">
            <tr>
                    <td>Complaint Type</td>
                    <td>
                        <select name="selcomp" >
                            <option>Select Complaint</option>
                        <%
                            String sel = "select *from tbl_complainttype";
                            ResultSet rs = con.selectCommand(sel);
                            while (rs.next()) {
                        %>
                        <option value="<%=rs.getString("complainttype_id")%>"><%=rs.getString("complainttype_name")%></option>
                        <%
                            }
                        %>

                    </select>
                    </td>
                </tr>
         <tr>
                    <td>Complaint</td>
                    <td><textarea name="txt_complaint"></textarea></td>
         </tr>
         <tr>
                    <td colspan="2" align="center">
                    <input type="submit" name="btn_send" value="send">
                    </td>
          </tr>
 </table>
 </form>          
    </body>
</html>
