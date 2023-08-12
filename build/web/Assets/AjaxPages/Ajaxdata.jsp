
<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String district = request.getParameter("district");
    String place = request.getParameter("place");
    System.out.println(district);

    String sel = "select * from tbl_projectcenter pc inner join tbl_place p on p.place_id=pc.place_id inner join tbl_district d on d.district_id=p.district_id where pc.projectcenter_vstatus='1'and true";

    if (!district.equals("")) {
        sel += " and p.district_id='" + district + "'";

    }
    if (!place.equals("")) {
        sel += " and pc.place_id='" + place + "'";

    }


%>
<table align="center">

    <tr>

        <%    ResultSet rs = con.selectCommand(sel);
            int Count = 0;
            while (rs.next()) {

                Count++;
        %>
        <td>
            <p style="text-align: center; border: 1px  solid #999;margin: 22px;padding: 10px;">
                <img src="../Assets/ProjectCenterphoto/<%=rs.getString("projectcenter_photo")%>" height="120" width="120"/>
                <br>
                <%=rs.getString("projectcenter_name")%>
                <br>
                <%=rs.getString("projectcenter_contact")%>
                <br>
                <%=rs.getString("projectcenter_email")%>
                <br>
                <br>
                <a href="ViewmoreProjectcenter.jsp?pgid=<%=rs.getString("projectcenter_id")%>">View More</a>




            </p>                                                                  
        </td>

        <%
            if (Count == 4) {
        %>
    </tr>
    <tr>
        <%
                    Count = 0;
                }
            }

        %>
    </tr>
</table>


