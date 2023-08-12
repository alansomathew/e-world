<%-- 
    Document   : Projectcenter
    Created on : Mar 17, 2022, 5:12:15 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project center</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <br>
        <br>
        <br>
        <br><br>
        <br>
        <br>
        <br>
        <br>
        <br>
       
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/ProjectCenterUploadAction.jsp">
        <h1 align="center">PROJECT CENTER</h1>
        <div id="tab">
        <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="pattern" name="txt_contact" pattern="[0-9]{10}" required=""></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txt_email" required=""></td>
                </tr>
                 <tr>
                    <td>Address</td>
                    <td><textarea name="txt_address"></textarea></td>
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
                     <td>Photo</td>
                     <td><input type="file" name="txt_photo" required=""></td>
                </tr>
                <tr>
                     <td>proof</td>
                     <td><input type="file" name="txt_proof" required=""></td>
                </tr>
                <tr>
                     <td>Password</td>
                     <td><input type="password" name="txt_password" pattern="[A-Za-z0-9!@#$%^&*()_]{6-9}"  required=""></td>
                </tr>
                <tr>
                     <td>conform Password</td>
                     <td><input type="password" name="txt_password" pattern="[A-Za-z0-9!@#$%^&*()_]{6-9}"  required=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                    <input type="submit" name="btn_save" value="save">
                    <input type="reset" name="btn_cancel" value="cancel">
                    </td>
                </tr>
            </table> 
        </div>
        
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
    </form>            
    </body>
</html>
<br>
        <br>
        <br>
        <br>
<%@include file="Foot.jsp" %>