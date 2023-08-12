<%-- 
    Document   : Complainttype
    Created on : Mar 16, 2022, 9:47:04 AM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint type</title>
    </head>
    <body>
        <%
         String cid="",cname="";    
        if(request.getParameter("btn_save")!=null){
        if(!request.getParameter("txthidden").equals(""))
        {
             String upd="update tbl_complainttype set complainttype_name='"+request.getParameter("txt_complainttype")+"' where complainttype_id='"+request.getParameter("txthidden")+"'";
             con.executeCommand(upd);
             response.sendRedirect("Complainttype.jsp");
        }
        else    
        {    
        String name=request.getParameter("txt_complainttype");
        String ins="insert into tbl_complainttype(complainttype_name)values('" + name + "')";
        con.executeCommand(ins);
        }
        }
        if(request.getParameter("did") != null) {
        String del = "delete from tbl_complainttype where complainttype_id='"+request.getParameter("did")+"'";
//        out.println(del);
        con.executeCommand(del);
        response.sendRedirect("Complainttype.jsp");
            }
        if(request.getParameter("eid")!=null)
            {
                String sel1="select * from tbl_complainttype where complainttype_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                if(rs1.next()){
                cid=rs1.getString("complainttype_id");
                cname=rs1.getString("complainttype_name");
            }
            }
        
        %>
        <h1 align="center">COMPLAINT TYPE</h1>
        <form method="post">
        <table align="center" border="1" cellpadding="10">
        <input type="hidden" name="txthidden" value="<%=cid%>"    
         <tr>
                <td>Complaint type</td>
                <td><input type="text" name="txt_complainttype" required="" autocomplete="off" value="<%=cname%>"></td>
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
                <td>Complaint type</td>
                <td>Action</td>
            </tr>
            <%
                    String sel = "select * from tbl_complainttype";
                    ResultSet rs = con.selectCommand(sel);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("complainttype_name")%></td>
                    <td><a href="Complainttype.jsp?did=<%=rs.getString("complainttype_id")%>">Delete</a>
                    <a href="Complainttype.jsp?eid=<%=rs.getString("complainttype_id")%>">Edit</a></td>
                </tr> 
                 <%
                }
                %>
        </table>
        </form>
    </body>
</html>
