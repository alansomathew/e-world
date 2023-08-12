<%-- 
    Document   : Projectcenter
    Created on : Mar 26, 2022, 4:31:16 PM
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
        <h1 align="center">VIEW PROJECT CENTER</h1>
        <form method="post">
            <table align="center" border="2" cellpadding="10">
        <tr>
                    <td>District</td>
                    <td>
                        <select name="seldist" id="seldistrict" onchange="getPlace(this.value)">
                            <option value="">Select District</option>
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
                    <td>Place</td>
                      <td>
                          <select name="selplace" id="sel_place" onchange="getData()">
                            <option value="">Select Place</option>
                        </select>
                      </td>
                      
        </tr>
                </table>
                        <div id="search">
                        <table align="center">
                             <tr>
                        <%
                            String sel1 = "select * from tbl_projectcenter where projectcenter_vstatus='1'";
                            ResultSet rs1 = con.selectCommand(sel1);
                            int Count = 0;
                            while (rs1.next()) {

                                Count++;

                        %>

                        <td>
                            <p style="text-align: center; border: 1px  solid #999;margin: 22px;padding: 10px;">
                                <img src="../Assets/ProjectCenterphoto/<%=rs1.getString("projectcenter_photo")%>" height="120" width="120"/>
                                <br>
                                <%=rs1.getString("projectcenter_name")%>
                                <br>
                                <%=rs1.getString("projectcenter_contact")%>
                                <br>
                                <%=rs1.getString("projectcenter_email")%>
                                <br>
                                <br>
                                <a href="ViewmoreProjectcenter.jsp?pgid=<%=rs1.getString("projectcenter_id")%>">View More</a>
                                
                               

                            </p>                                                                  
                        </td>

                        <%
                            if (Count == 4) {
                        %>
                    </tr>
                    <tr>
                        <%
                                Count=0;
                                }
                            }

                        %>
                    </tr>
                        </table>
                        </div>
                            
          </form>
                        
    </body>
</html>
<script src="../Assets/JQuery/jQuery.js"></script>                
      <script>
        function getPlace(did)
        {

            $.ajax({url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                success: function (result) {

                    $("#sel_place").html(result);
                    getData();
                }});
        } function getData()
                                    {

                                        var district = document.getElementById("seldistrict").value;
                                        var place = document.getElementById("sel_place").value;
                                        
                                        $.ajax({
                                            url: "../Assets/AjaxPages/Ajaxdata.jsp?district="+district+"&place="+place,
                                            success: function(html) {
                                                    $("#search").html(html);
                                                    //alert(html);
                                            }
                                        });
                                    }

    </script>