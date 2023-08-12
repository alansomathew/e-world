<%-- 
    Document   : ViewStudents
    Created on : 29 Apr, 2022, 8:19:34 PM
    Author     : alans
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
        if(request.getParameter("sid")!=null){
            String update="update tbl_request set request_cstatus='1' where request_id='"+request.getParameter("sid")+"'";
            con.executeCommand(update);
            response.sendRedirect("ViewStudents.jsp");
        }
        
        
        %>
        <br><br><br><br><br><br><br><br><br><br><br><br>
    <h1 align="center">STUDENTS</h1>
    <div id="tab">
        <table align="center" border="1">
            <tr>
                <td>Si No</td>
                <td>Name</td>
                <td>Course</td>
                <td>Join Date</td>
                <td>Status</td>
            </tr>
        <%
        String sel="select * from tbl_request r inner join tbl_user u on r.user_id=u.user_id inner join tbl_course c on r.course_id=c.course_id where c.course_id='"+request.getParameter("aid")+"'";
        ResultSet rs=con.selectCommand(sel);
        int i=0;
        while(rs.next()){
            i++;
            
            %>
            
                <tr>
                    <td><%=i%></td> 
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("course_name")%></td>
                    <td><%=rs.getString("request_date")%></td>
                    <td><%
                    if(rs.getString("request_cstatus").equals("0")){
                        %>
                    
                        <a href="ViewStudents.jsp?sid=<%=rs.getString("request_id")%>">Completed</a>
                        
                        <%
                    }
                    else{
                                                out.println("Completed");

                    }
                    %></td>

                </tr>
           
        
        
        <%
        }
        
        %>
         </table>
    </div>
    </body>
</html>
<br><br><br><br><br><br><br>
<%@include  file="Foot.jsp" %>