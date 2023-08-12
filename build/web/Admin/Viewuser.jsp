<%-- 
    Document   : Viewuser
    Created on : Mar 25, 2022, 12:21:31 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View User</title>
    </head>
    <body>
         <%
            if (request.getParameter("aid") != null) {
                String up1 = "update tbl_user set user_vstatus='1' where user_id='" + request.getParameter("aid") + "'";
                con.executeCommand(up1);
                response.sendRedirect("Viewuser.jsp");
            }
            if (request.getParameter("rid") != null) {
                String up2 = "update tbl_user set user_vstatus='2'where user_id='" + request.getParameter("rid") + "'";
                con.executeCommand(up2);
                response.sendRedirect("Viewuser.jsp");
            }
        %>
        <h1 align="center">VIEW USER</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Si no</td>
                    <td>Name</td>
                    <td>Contact</td>
                    <td>Email</td>
                    <td>Address</td>
                    <td>District</td>
                    <td>Place</td>
                    <td>Photo</td>
                    <td>Action</td>
                </tr>
                 <%
                    String seluser = "select *from tbl_user u inner join tbl_place p on u.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id where user_vstatus='0'";
                    //out.println(selprojectc);
                    ResultSet dd = con.selectCommand(seluser);
                    int i = 0;
                    while (dd.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=dd.getString("user_name")%></td>
                    <td><%=dd.getString("user_contact")%></td>
                    <td><%=dd.getString("user_email")%></td>
                    <td><%=dd.getString("user_address")%></td>
                    <td><%=dd.getString("district_name")%></td>
                    <td><%=dd.getString("place_name")%></td> 
                    <td><img src="../Assets/Userphoto/<%=dd.getString("user_photo")%>" width="120"height="120"></td>
                    <td><a href="Viewuser.jsp?aid=<%=dd.getString("user_id")%>">Accept</a>
                        <a href="Viewuser.jsp?rid=<%=dd.getString("user_id")%>">Reject</a>
                    </td>
                </tr>
                <%
                    }
                %>
                </table>
        </form>
        <h1 align="center">ACCEPT LIST</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Si no</td>
                    <td>Name</td>
                    <td>Contact</td>
                    <td>Email</td>
                    <td>Address</td>
                    <td>District</td>
                    <td>Place</td>
                    <td>Photo</td>
               </tr>
                <%
                    String seluser1 = "select *from tbl_user u inner join tbl_place p on u.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id where user_vstatus='1'";
                    //out.println(selprojectc);
                    ResultSet ac = con.selectCommand(seluser1);
                    int j = 0;
                    while (ac.next()) {
                        j++;
                %>
                <tr>
                    <td><%=j%></td>
                    <td><%=ac.getString("user_name")%></td>
                    <td><%=ac.getString("user_contact")%></td>
                    <td><%=ac.getString("user_email")%></td>
                    <td><%=ac.getString("user_address")%></td>
                    <td><%=ac.getString("district_name")%></td>
                    <td><%=ac.getString("place_name")%></td> 
                    <td><img src="../Assets/Userphoto/<%=ac.getString("user_photo")%>" width="120"height="120"></td>
                    
                </tr>
                <%
                    }
                %>
            </table>
        </form>
            <h1 align="center">REJECT LIST</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10">
              <tr>
                    <td>Si no</td>
                    <td>Name</td>
                    <td>Contact</td>
                    <td>Email</td>
                    <td>Address</td>
                    <td>District</td>
                    <td>Place</td>
                    <td>Photo</td>
               </tr>
                <%
                    String seluser2 = "select *from tbl_user u inner join tbl_place p on u.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id where user_vstatus='2'";
                    //out.println(selprojectc);
                    ResultSet rt = con.selectCommand(seluser2);
                    int k = 0;
                    while (rt.next()) {
                        k++;
                %>
                <tr>
                    <td><%=k%></td>
                    <td><%=rt.getString("user_name")%></td>
                    <td><%=rt.getString("user_contact")%></td>
                    <td><%=rt.getString("user_email")%></td>
                    <td><%=rt.getString("user_address")%></td>
                    <td><%=rt.getString("district_name")%></td>
                    <td><%=rt.getString("place_name")%></td> 
                    <td><img src="../Assets/Userphoto/<%=rt.getString("user_photo")%>" width="120"height="120"></td>
                    
                </tr>
                <%
                    }
                %>
            </table>
        </form>   
    </body>
</html>
