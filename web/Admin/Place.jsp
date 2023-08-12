<%-- 
    Document   : Place
    Created on : Mar 16, 2022, 8:48:09 AM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place</title>
    </head>
    <body>
        <%
        if(request.getParameter("btn_save")!=null){
        String name=request.getParameter("txt_place");
        String dd = request.getParameter("seldist");
        String ins="insert into tbl_place(place_name,district_id)values('" + name + "','" + dd + "')";
        con.executeCommand(ins);
        }
        if (request.getParameter("did") != null) {
        String del = "delete from tbl_place where place_id='" + request.getParameter("did") + "'";
        con.executeCommand(del);
        response.sendRedirect("Place.jsp");
        }
        %>
        <h1 align="center">PLACE</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>District</td>
                    <td>
                        <select name="seldist">
                            <option>Select District</option>
                            <%
                                String sel = "select *from tbl_district";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                            <%
                                }
                            %>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><input type="text" name="txt_place" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_save" value="save">
                        <input type="reset" name="btn_cancel"value="cancel"></td>
                </tr>
            </table>
           <br>
           <hr>
           <br> 
           <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Si no</td>
                    <td>District</td>
                    <td>Place</td>
                    <td>Action</td>
                </tr>  
                <%
                    String seldist = "select *from tbl_place p inner join tbl_district d on d.district_id=p.district_id";
                    //out.println(seldist);
                    ResultSet dd = con.selectCommand(seldist);
                    int i = 0;
                    while (dd.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=dd.getString("district_name")%></td>
                    <td><%=dd.getString("place_name")%></td>
                    <td><a href="Place.jsp?did=<%=dd.getString("place_id")%>">Delete</a></td>
                </tr>
                <%
                    }
                %>
        </form>
    </body>
</html>
