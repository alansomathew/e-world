<%-- 
    Document   : Login
    Created on : Mar 19, 2022, 2:05:41 PM
    Author     : Admin
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="../Assets/Temp/Login/fonts/icomoon/style.css">

        <link rel="stylesheet" href="../Assets/Temp/Login/css/owl.carousel.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../Assets/Temp/Login/css/bootstrap.min.css">

        <!-- Style -->
        <link rel="stylesheet" href="../Assets/Temp/Login/css/style.css">

        <title>Login #7</title>
    </head>
    <body>
        <%
            if (request.getParameter("btn_login") != null) {

                String sel = "select * from tbl_user where user_email='" + request.getParameter("txt_username") + "' and user_password='" + request.getParameter("txt_password") + "' ";
                ResultSet rs = con.selectCommand(sel);
                String sel1 = "select * from tbl_projectcenter where projectcenter_email='" + request.getParameter("txt_username") + "' and projectcenter_password='" + request.getParameter("txt_password") + "'and projectcenter_vstatus='1'";
                ResultSet rs1 = con.selectCommand(sel1);
                String sel2 = "select * from tbl_staff where staff_email='" + request.getParameter("txt_username") + "' and staff_password='" + request.getParameter("txt_password") + "'";
                ResultSet rs2 = con.selectCommand(sel2);
                
                String sel3="select * from tbl_admin where admin_username'" + request.getParameter("txt_username") + "' and admin_password='" + request.getParameter("txt_password") + "'";
                ResultSet rs3=con.selectCommand(sel3);

                if (rs.next()) {
                    if(rs.getString("user_vstatus").equals("0")){
                        %>
                        <script>alert("Request Pending..")</script>
        <%
                    }
                    else if(rs.getString("user_vstatus").equals("1")){
                    session.setAttribute("userid", rs.getString("user_id"));
                    session.setAttribute("username", rs.getString("user_name"));
                    response.sendRedirect("../User/Home.jsp");
                    }
                    else{
                         %>
                        <script>alert("Request Rejected..")</script>
        <%
                    }
                } else if (rs1.next()) {
                    if(rs1.getString("projectcenter_vstatus").equals("0")){
                         %>
                        <script>alert("Request Pending..")</script>
        <%
                    }
                    else if(rs1.getString("projectcenter_vstatus").equals("1")){
                    session.setAttribute("projectcenterid", rs1.getString("projectcenter_id"));
                    session.setAttribute("projectcentername", rs1.getString("projectcenter_name"));
                    response.sendRedirect("../ProjectCenter/Home.jsp");
                    }
                    else{
                        %>
                        <script>alert("Request Rejected..")</script>
        <%
                    }
                } else if (rs2.next()) {
                    session.setAttribute("staffid", rs2.getString("staff_id"));
                    session.setAttribute("staffname", rs2.getString("staff_name"));
                    response.sendRedirect("../Staff/Home.jsp");

                } else if(rs3.next()){
                    session.setAttribute("adminid", rs3.getString("admin_id"));
                    response.sendRedirect("../Admin/Home.jsp");
                }
                else {

        %>
        <script>
            alert('invalid details');
        </script>


        <%                }

            }


        %>


        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <img src="../Assets/Temp/Login/images/undraw_remotely_2j6y.svg" alt="Image" class="img-fluid">
                    </div>
                    <div class="col-md-6 contents">
                        <div class="row justify-content-center">
                            <div class="col-md-8">
                                <div class="mb-4">
                                    <h3>Sign In</h3>
                                    <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p>
                                </div>
                                <form action="#" method="post">
                                    <div class="form-group first">
                                        <label for="username">Username</label>
                                        <input type="text" class="form-control" name="txt_username" id="username">

                                    </div>
                                    <div class="form-group last mb-4">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" name="txt_password" id="password">

                                    </div>

                                    <div class="d-flex mb-5 align-items-center">
                                        <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                                            <input type="checkbox" checked="checked"/>
                                            <div class="control__indicator"></div>
                                        </label>
                                        <span class="ml-auto"><a href="Home.jsp" class="forgot-pass">Home</a></span> 
                                    </div>

                                    <input type="submit" name="btn_login" value="Log In" class="btn btn-block btn-primary">

                                    <span class="d-block text-left my-4 text-muted">&mdash; or login with &mdash;</span>

                                    <div class="social-login">
                                        <a href="#" class="facebook">
                                            <span class="icon-facebook mr-3"></span> 
                                        </a>
                                        <a href="#" class="twitter">
                                            <span class="icon-twitter mr-3"></span> 
                                        </a>
                                        <a href="#" class="google">
                                            <span class="icon-google mr-3"></span> 
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>


        <script src="../Assets/Temp/Login/js/jquery-3.3.1.min.js"></script>
        <script src="../Assets/Temp/Login/js/popper.min.js"></script>
        <script src="../Assets/Temp/Login/js/bootstrap.min.js"></script>
        <script src="../Assets/Temp/Login/js/main.js"></script>
    </body>
</html>