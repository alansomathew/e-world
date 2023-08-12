<%-- 
    Document   : District
    Created on : Mar 15, 2022, 4:56:03 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
    </head>
    <body>
        <%
        String did="",dname="";
        if(request.getParameter("btn_save")!=null){
        if(!request.getParameter("txthidden").equals(""))
        {
             String upd="update tbl_district set district_name='"+request.getParameter("txt_district")+"' where district_id='"+request.getParameter("txthidden")+"'";
             con.executeCommand(upd);
             response.sendRedirect("District.jsp");
        }
        else{
        String name=request.getParameter("txt_district");
        String ins="insert into tbl_district(district_name)values('" + name + "')";
        con.executeCommand(ins);
        }
        }
        if (request.getParameter("did") != null) {
            String del = "delete from tbl_district where district_id='" + request.getParameter("did") + "'";
            con.executeCommand(del);
            response.sendRedirect("District.jsp");
            }
        
            if(request.getParameter("eid")!=null)
            {
                String sel1="select * from tbl_district where district_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                rs1.next();
                did=rs1.getString("district_id");
                dname=rs1.getString("district_name");
            }

        
        %>
    <h1 align="center">DISTRICT</h1>
    <form method="post">
        <table align="center" border="1" cellpadding="10">
        <input type="hidden" name="txthidden" value="<%=did%>"
            <tr>
                <td>District</td>
                <td><input type="text" name="txt_district" required="" autocomplete="off" value="<%=dname%>"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"> 
                 <input type="submit" name="btn_save" value="Save">
                 <input type="reset" name="btn_cancel" value="Cancel">
                </td>
            </tr>
        </table>
        <br>
        <hr>
        <br>
        <table align="center" border="1" cellpadding="10">
            <tr>
                <td>Si.no</td> 
                <td>District</td>
                <td>Action</td>
            </tr>
            <%
                    String sel = "select*from tbl_district";
                    ResultSet rs = con.selectCommand(sel);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("district_name")%></td>
                    <td>
                        <a href="District.jsp?did=<%=rs.getString("district_id")%>">Delete</a>
                        <a href="District.jsp?eid=<%=rs.getString("district_id")%>">Edit</a>
                    </td>   
                </tr>
                <%
                }
                %>
        </table>
        </form>
    </body>
</html>
