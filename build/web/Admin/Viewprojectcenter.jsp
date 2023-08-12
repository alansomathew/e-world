<%-- 
    Document   : Viewproject
    Created on : Mar 19, 2022, 10:46:12 AM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Project Center</title>
    </head>
    <body>
        <%
            if (request.getParameter("aid") != null) {
                String up1 = "update tbl_projectcenter set projectcenter_vstatus='1' where projectcenter_id='" + request.getParameter("aid") + "'";
                con.executeCommand(up1);
                response.sendRedirect("Viewprojectcenter.jsp");
            }
            if (request.getParameter("rid") != null) {
                String up2 = "update tbl_projectcenter set projectcenter_vstatus='2'where projectcenter_id='" + request.getParameter("rid") + "'";
                con.executeCommand(up2);
                response.sendRedirect("Viewprojectcenter.jsp");
            }
        %>
        <h1 align="center">VIEW PROJECT CENTER</h1>
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
                    <td>Proof</td>
                    <td>Action</td>
                </tr>
                <%
                    String selprojectc = "select *from tbl_projectcenter pc inner join tbl_place p on pc.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id where projectcenter_vstatus='0'";
                    //out.println(selprojectc);
                    ResultSet dd = con.selectCommand(selprojectc);
                    int i = 0;
                    while (dd.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=dd.getString("projectcenter_name")%></td>
                    <td><%=dd.getString("projectcenter_contact")%></td>
                    <td><%=dd.getString("projectcenter_email")%></td>
                    <td><%=dd.getString("projectcenter_address")%></td>
                    <td><%=dd.getString("district_name")%></td>
                    <td><%=dd.getString("place_name")%></td> 
                    <td><img src="../Assets/ProjectCenterphoto/<%=dd.getString("projectcenter_photo")%>" width="120"height="120"></td>
                    <td><a href="../Assets/ProjectCenterproof/<%=dd.getString("projectcenter_proof")%>"dowload>Download</a></td>
                    <td><a href="Viewprojectcenter.jsp?aid=<%=dd.getString("projectcenter_id")%>">Accept</a>
                        <a href="Viewprojectcenter.jsp?rid=<%=dd.getString("projectcenter_id")%>">Reject</a>
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
                    <td>Proof</td>

                </tr>
                <%
                    String selacceptl = "select *from tbl_projectcenter pc inner join tbl_place p on pc.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id where projectcenter_vstatus='1'";
                    //out.println(selacceptl);
                    ResultSet ac = con.selectCommand(selacceptl);
                    int j = 0;
                    while (ac.next()) {
                        j++;
                %>
                <tr>
                    <td><%=j%></td>
                    <td><%=ac.getString("projectcenter_name")%></td>
                    <td><%=ac.getString("projectcenter_contact")%></td>
                    <td><%=ac.getString("projectcenter_email")%></td>
                    <td><%=ac.getString("projectcenter_address")%></td>
                    <td><%=ac.getString("district_name")%></td>
                    <td><%=ac.getString("place_name")%></td> 
                     <td><img src="../Assets/ProjectCenterphoto/<%=ac.getString("projectcenter_photo")%>" width="120"height="120"></td>
                    <td><img src="../Assets/ProjectCenterproof/<%=ac.getString("projectcenter_proof")%>" width="120"height="120"></td>
                    </td>
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
                    <td>Proof</td>

                </tr>
                <%
                    String selrejectl = "select *from tbl_projectcenter pc inner join tbl_place p on pc.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id where projectcenter_vstatus='2'";
                    //out.println(selrejetl);
                    ResultSet rt = con.selectCommand(selrejectl);
                    int k = 0;
                    while (rt.next()) {
                        k++;
                %>
                <tr>
                    <td><%=k%></td>
                    <td><%=rt.getString("projectcenter_name")%></td>
                    <td><%=rt.getString("projectcenter_contact")%></td>
                    <td><%=rt.getString("projectcenter_email")%></td>
                    <td><%=rt.getString("projectcenter_address")%></td>
                    <td><%=rt.getString("district_name")%></td>
                    <td><%=rt.getString("place_name")%></td> 
                    <td><img src="../Assets/ProjectCenterphoto/<%=rt.getString("projectcenter_photo")%>" width="120"height="120"></td>
                    <td><img src="../Assets/ProjectCenterproof/<%=rt.getString("projectcenter_proof")%>" width="120"height="120"></td>
                  
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
