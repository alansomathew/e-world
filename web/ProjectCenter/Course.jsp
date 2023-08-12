<%-- 
    Document   : Course
    Created on : Mar 17, 2022, 4:15:00 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <br><br><br><br><br><br><br><br><br><br>
       <%
       if(request.getParameter("btn_save")!=null){
       String name=request.getParameter("txt_course");
        String am = request.getParameter("txt_amount");
         String du = request.getParameter("txt_duration");
         String ct=request.getParameter("selcoursetype");
         String la=request.getParameter("sellanguage");
        String ins="insert into tbl_course(course_name,course_amount,course_duration,coursetype_id,language_id,projectcenter_id)values('" + name + "','" + am + "','" + du + "','" + ct + "','" + la + "','"+session.getAttribute("projectcenterid")+"')";
       // out.println(ins);
        con.executeCommand(ins);
       }
       if (request.getParameter("did") != null) {
            String del = "delete from tbl_course where course_id='" + request.getParameter("did") + "'";
            con.executeCommand(del);
            response.sendRedirect("Course.jsp");
            }
       %>
        <h1 align="center">COURSE</h1>
        <form method="post">
            <div id="tab">
        <table align="center" border="1" cellpadding="10">
            <tr>
                <td>Course Type</td>
                <td>
                        <select name="selcoursetype">
                            <option>Select Course</option>
                            <%
                                String sel = "select *from tbl_coursetype";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("coursetype_id")%>"><%=rs.getString("coursetype_name")%></option>
                            <%
                                }
                            %>

                        </select>
                    </td>
                
            </tr>
            <tr>
                <td>Course</td>
                <td><input type="text" name="txt_course" required="" autocomplete="off"></td>
            </tr>
             <tr>
                 <td>Language</td>
                <td>
                        <select name="sellanguage">
                            <option>Select Language</option>
                            <%
                                String sel1 = "select *from tbl_language";
                                ResultSet rs1 = con.selectCommand(sel1);
                                while (rs1.next()) {
                            %>
                            <option value="<%=rs1.getString("language_id")%>"><%=rs1.getString("language_name")%></option>
                            <%
                                }
                            %>

                        </select>
                    </td>
                </tr>
             <tr>
                <td>Amount</td>
                <td><input type="text" name="txt_amount" required="" pattern="[A-Za-z0-9]{10}" autocomplete="off"></td>
            </tr>
             <tr>
                <td>Duration</td>
                <td><input type="text" name="txt_duration" required="" autocomplete="off"></td>
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
                    <td>Si no</td>
                    <td>Type</td>
                    <td>Course</td>
                    <td>Language</td>
                    <td>Amount</td>
                    <td>Duration</td>
                    <td>Action</td>
               </tr>
               <tr>
                   <%
                     String sel2= "select * from tbl_course c inner join tbl_coursetype ct on c.coursetype_id=ct.coursetype_id inner join tbl_language l on c.language_id=l.language_id where c.projectcenter_id='"+session.getAttribute("projectcenterid")+"'";
                     ResultSet dd = con.selectCommand(sel2);
                    int i = 0;
                    while (dd.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=dd.getString("coursetype_name")%></td>
                    <td><%=dd.getString("course_name")%></td>
                    <td><%=dd.getString("language_name")%></td>
                    <td><%=dd.getString("course_amount")%></td>
                    <td><%=dd.getString("course_duration")%> Months</td>
                    <td><a href="Course.jsp?did=<%=dd.getString("course_id")%>">Delete</a><br>
                    <a href="Syllabus.jsp?sid=<%=dd.getString("course_id")%>">add syllabus</a><br>
                    <a href="ViewStudents.jsp?aid=<%=dd.getString("course_id")%>">View Students</a><br>
                    <a href="Batch.jsp?cid=<%=dd.getString("course_id")%>">add batch</a></td>
                </tr>
                <%
                    }
                %>
                  
          
           </table>
            </div>
        </form>
    </body>
    <br><br><br><br><br><br><br><br>
    <%@include file="Foot.jsp" %>
</html>
