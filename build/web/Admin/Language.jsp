<%-- 
    Document   : Department
    Created on : Mar 16, 2022, 4:12:00 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Language</title>
    </head>
    <body>
        <%
        String lid="",lname="";    
        if(request.getParameter("btn_save")!=null){
        if(!request.getParameter("txthidden").equals(""))
        {
             String upd="update tbl_language set language_name='"+request.getParameter("txt_language")+"' where language_id='"+request.getParameter("txthidden")+"'";
             con.executeCommand(upd);
             response.sendRedirect("Language.jsp");
        }
        else
        {
             String name=request.getParameter("txt_language");
             String ins="insert into tbl_language(language_name)values('" + name + "')";
             con.executeCommand(ins);   
        }
        } 
        if(request.getParameter("did") != null) 
        {
              String del = "delete from tbl_language where language_id='"+request.getParameter("did")+"'";
//            out.println(del);
              con.executeCommand(del);
              response.sendRedirect("Language.jsp");
        }
        if(request.getParameter("eid")!=null)
            {
                String sel1="select * from tbl_language where language_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                if(rs1.next()){
                lid=rs1.getString("language_id");
                lname=rs1.getString("language_name");
            }
         }
        %>
        <h1 align="center">LANGUAGE</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10"> 
             <input type="hidden" name="txthidden" value="<%=lid%>"  
                <tr>
                    <td>Language</td>
                    <td><input type="text" name="txt_language" required="" autocomplete="off" value="<%=lname%>"></td>
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
                <td>Language</td>
                <td>Action</td>
            </tr>
            <%
                    String sel = "select * from tbl_language";
                    ResultSet rs = con.selectCommand(sel);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("language_name")%></td>
                    <td><a href="Language.jsp?did=<%=rs.getString("language_id")%>">Delete</a>
                     <a href="Language.jsp?eid=<%=rs.getString("language_id")%>">Edit</a></td>
                </tr>
                <%
                }
                %>
            </table>
    </body>
</html>
