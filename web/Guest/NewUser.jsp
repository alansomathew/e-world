<%-- 
    Document   : NewUser
    Created on : Mar 17, 2022, 6:45:01 AM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    
    <%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
        DateFormat yearf = new SimpleDateFormat("YYYY");
        DateFormat monthf = new SimpleDateFormat("MM");
        DateFormat dayf = new SimpleDateFormat("dd");

        String year = yearf.format(new Date());
        String month = monthf.format(new Date());
        String day = dayf.format(new Date());

        int yearnew = Integer.parseInt(year)-18;

        String Date = String.valueOf(yearnew) + "-" + month + "-" + day;
        %>
        <br>
        <br>
        <br>
        <br><br>
        <br>
        <br>
        <br>
        <h1 align="center">USER</h1>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/UserUploadAction.jsp">
            <div id="tab">
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txt_email" required=""></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="pattern" name="txt_contact"pattern="[0-9]{10}" autocomplete="off" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="seldist" onchange="getPlace(this.value)">
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
                      <td>
                        <select name="selplace" id="sel_place">
                          <option>Select Place</option>
                        </select>
                     </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txt_address"></textarea></td>
                </tr>
                 <tr>
                     <td>Photo</td>
                     <td><input type="file" name="txt_photo" required=""></td>
                </tr>
                <tr>
                     <td>Password</td>
                     <td><input type="password" name="txt_password" pattern="[A-Za-z0-9!@#$%^&*()_]{6-9}"required="" ></td>
                </tr>
                <tr>
                     <td>conform Password</td>
                     <td><input type="password" name="txt_password" pattern="[A-Za-z0-9!@#$%^&*()_]{6-9}" required=""></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td>
                        <input type="date" name="txt_date" min="<%=Date%>">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                    <input type="submit" name="btn_save" value="save">
                    <input type="reset" name="btn_cancel" value="cancel">
                    </td>
                </tr>
            </table>  
        </div>
        </form>
                        
         <script src="../Assets/JQuery/jQuery.js"></script>                
      <script>
        function getPlace(did)
        {

            $.ajax({url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                success: function (result) {

                    $("#sel_place").html(result);
                }});
        }

    </script>
    </body>
</html>
<br>
        <br>
        <br>
        <br>
<%@include file="Foot.jsp" %>
