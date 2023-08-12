<%-- 
    Document   : RegistrationNow
    Created on : Apr 7, 2022, 12:07:13 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Now</title>
    </head>
    <body>
        <% 
            
        String cid = request.getParameter("pgid");
            if (request.getParameter("btn_save") != null) {
                String ins = "insert into tbl_request(user_id,request_date,course_id,request_dob)values('" + session.getAttribute("userid") + "','"+request.getParameter("txt_fromdate")+"','" + cid+ "',curdate())";
                out.println(ins);
                con.executeCommand(ins);
            }
        %>
        <h1 align="center">REGISTRATION NOW</h1>
         <form method="post">
            <table align="center" border="2" cellpadding="10">
                <tr>
                        <%
                            String sel1 = "select * from tbl_course c inner join tbl_coursetype ct on c.coursetype_id=ct.coursetype_id inner join tbl_language l on c.language_id=l.language_id  where c.course_id='"+ request.getParameter("pgid") +"'";
                            ResultSet rs1 = con.selectCommand(sel1);
                            System.out.println(sel1);
                            int Count = 0;
                            while (rs1.next()) {

                                Count++;

                        %>

                        <td colspan="2">
                            <p style="text-align:center; border: 1px  solid #999;margin: 22px;padding: 10px;">
                                <br>
                                Course Type: <%=rs1.getString("coursetype_name")%>
                                <br>
                                Course: <%=rs1.getString("course_name")%>
                                <br>
                                Language: <%=rs1.getString("language_name")%>
                                <br>
                                Rate : <%=rs1.getString("course_amount")%>
                                <br>
                                Period: <%=rs1.getString("course_duration")%>
                                 <br>
                                 <br>
                                 
                               
                                
                               
                            </p>                                                                  

                        </td>

                       <%}%>
                    </tr>
                    <tr>
                    <td>From Date</td>
                    <td><input type="date" name="txt_fromdate"  required=""></td>
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
