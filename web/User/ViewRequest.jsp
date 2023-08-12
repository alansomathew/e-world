<%-- 
    Document   : ViewRequest
    Created on : Apr 11, 2022, 4:04:39 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Request</title>
    </head>
    <body>
        <h1 align="center">VIEW Request</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Si no</td>
                    <td>UserName</td>
                    <td>Course</td>
                    <td>Date Of Booking</td>
                    <td>From Date</td>
                    <td>Action</td>
                    <td>Batch</td>
                    <td>Completion</td>

                </tr>
                <%
                    String selrequest = "select *from tbl_request r inner join tbl_user u on r.user_id=u.user_id inner join tbl_course c on r.course_id=c.course_id inner join tbl_projectcenter pc on c.projectcenter_id=pc.projectcenter_id where u.user_id='"+ session.getAttribute("userid")+"'";
                    //out.println(selprojectc);
                    ResultSet dd = con.selectCommand(selrequest);
                    int i = 0;
                    while (dd.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=dd.getString("user_name")%></td>
                    <td><%=dd.getString("course_name")%></td>
                    <td><%=dd.getString("request_dob")%></td>
                    <td><%=dd.getString("request_date")%></td>  
                    <td><%if(dd.getString("request_status").equals("1")){
                        out.println("Accepted");
                        %>
                        <br>
                        <p><a href="ViewRequest.jsp?rid=<%=dd.getString("request_status")%>">Pay Now</a></p>
                        
                        <%
                        
                    }else if(dd.getString("request_status").equals("2")){
                        out.println("Rejected");
                    }else {out.println("not accepted");}
                    %></td>
                    <td>
                        <a href="ViewBatch.jsp?aid=<%=dd.getString("course_id")%>">View Batch</a>
                    </td>
                    <td>
                        <%
                        if(dd.getString("request_cstatus").equals("0")){
                            out.println("Not Completed");
                        }else{
                            out.println("Completed");
                        }
                        %>
                    </td>
                </tr>
                <%
                }
                %>
    </body>
</html>
