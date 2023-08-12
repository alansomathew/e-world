<%-- 
    Document   : Batch
    Created on : Mar 26, 2022, 2:40:36 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Batch</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <br><br><br><br><br><br><br><br><br><br>
        <%
            DateFormat yearf = new SimpleDateFormat("YYYY");
        DateFormat monthf = new SimpleDateFormat("MM");
        DateFormat dayf = new SimpleDateFormat("dd");

        String year = yearf.format(new Date());
        String month = monthf.format(new Date());
        String day = dayf.format(new Date());

        int yearnew = Integer.parseInt(year);

        String Date = String.valueOf(yearnew) + "-" + month + "-" + day;
        
            String cid = request.getParameter("cid");
            if (request.getParameter("btn_save") != null) {
                String name = request.getParameter("txt_name");
                String st = request.getParameter("txt_starttime");
                String et = request.getParameter("txt_endtime");
                String d = request.getParameter("txt_date");
                String ins = "insert into tbl_batch(batch_name,batch_starttime,batch_endtime,batch_date,course_id)values('" + name + "','" + st + "','" + et + "','" + d + "','" + cid + "')";
                out.println(ins);
                con.executeCommand(ins);
            }
            if (request.getParameter("did") != null) {
            String del = "delete from tbl_batch where batch_id='" + request.getParameter("did") + "'";
            con.executeCommand(del);
            response.sendRedirect("Batch.jsp");
            }
        %>
        <form method="post">
            <div id="tab">
            <h1 align="center">BATCH</h1>
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Start Time</td>
                    <td><input type="time" name="txt_starttime" required="" ></td>
                </tr>
                <tr>
                    <td>End Time</td>
                    <td><input type="time" name="txt_endtime" required="" ></td>
                </tr>
                <tr>
                    <td>Date</td>
                    <td><input type="date" min="<%=Date%>" name="txt_date" required="" ></td>
                </tr>
               
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_save" value="save">
                        <input type="reset" name="btn_cancel" value="cancel">
                    </td>
                </tr>
            </table>
            <hr>
            <br> 
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Si no</td>
                    <td>Name</td>
                    <td>Start Time</td>
                    <td>End Time</td>
                    <td>Date</td>
                    <td>Course</td>
                    <td>Action</td>
                </tr>
                <tr>
                    <%
                        String sel = "select * from tbl_batch b inner join tbl_course c on b.course_id=c.course_id where c.course_id='"+cid+"'";
                        ResultSet dd = con.selectCommand(sel);
                        int i = 0;
                        while (dd.next()) {
                            i++;
                    %>
                <tr>
                    <td><%=i%></td>
                    <td><%=dd.getString("batch_name")%></td>
                    <td><%=dd.getString("batch_starttime")%></td>
                    <td><%=dd.getString("batch_endtime")%></td>
                    <td><%=dd.getString("batch_date")%></td>   
                    <td><%=dd.getString("course_name")%></td>
                    <td><a href="Batch.jsp?did=<%=dd.getString("batch_id")%>">Delete</a>
                </tr>
                <%
                    }
                %>


            </table>
        </form>
    </div>
    </body>
</html>
<br><br><br><br><br>
<%@include  file="Foot.jsp" %>