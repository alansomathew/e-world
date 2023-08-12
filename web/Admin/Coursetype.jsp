<%-- 
    Document   : Courcecategory
    Created on : Mar 16, 2022, 2:34:05 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course type</title>
    </head>
    <body>
        <%
         String cid="",cname=""; 
        if(request.getParameter("btn_save")!=null){
        if(!request.getParameter("txthidden").equals(""))
        {
            String upd="update tbl_coursetype set coursetype_name='"+request.getParameter("txt_coursetype")+"' where coursetype_id='"+request.getParameter("txthidden")+"'";
             con.executeCommand(upd);
             response.sendRedirect("Coursetype.jsp");
        }
        else
        {
             String name=request.getParameter("txt_coursetype");
             String ins="insert into tbl_coursetype(coursetype_name)values('" + name + "')";
             con.executeCommand(ins);    
        }
       } 
        if(request.getParameter("did") != null) 
        {
              String del = "delete from tbl_coursetype where coursetype_id='"+request.getParameter("did")+"'";
//            out.println(del);
              con.executeCommand(del);
              response.sendRedirect("Coursetype.jsp");
        }
        if(request.getParameter("eid")!=null)
            {
                String sel1="select * from tbl_coursetype where coursetype_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                if(rs1.next()){
                cid=rs1.getString("coursetype_id");
                cname=rs1.getString("coursetype_name");
            }
         }
        %>
        <h1 align="center">COURSE TYPE</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10">
            <input type="hidden" name="txthidden" value="<%=cid%>"      
                <tr>
                    <td>Course type</td>
                    <td><input type="text" name="txt_coursetype" required="" autocomplete="off" value="<%=cname%>"></td>
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
                <td>Course category</td>
                <td>Action</td>
            </tr>
            <%
                    String sel = "select * from tbl_coursetype";
                    ResultSet rs = con.selectCommand(sel);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("coursetype_name")%></td>
                    <td><a href="Coursetype.jsp?did=<%=rs.getString("coursetype_id")%>">Delete</a>
                    <a href="Coursetype.jsp?eid=<%=rs.getString("coursetype_id")%>">Edit</a></td>
                </tr>
                <%
                }
                %>
            </table>
     </form>
    </body>
</html>
