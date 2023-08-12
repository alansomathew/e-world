package org.apache.jsp.Guest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <!-- Required meta tags -->\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Temp/Login/fonts/icomoon/style.css\">\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Temp/Login/css/owl.carousel.min.css\">\n");
      out.write("\n");
      out.write("        <!-- Bootstrap CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Temp/Login/css/bootstrap.min.css\">\n");
      out.write("\n");
      out.write("        <!-- Style -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Temp/Login/css/style.css\">\n");
      out.write("\n");
      out.write("        <title>Login #7</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

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
                        
      out.write("\n");
      out.write("                        <script>alert(\"Request Pending..\")</script>\n");
      out.write("        ");

                    }
                    else if(rs.getString("user_vstatus").equals("1")){
                    session.setAttribute("userid", rs.getString("user_id"));
                    session.setAttribute("username", rs.getString("user_name"));
                    response.sendRedirect("../User/Home.jsp");
                    }
                    else{
                         
      out.write("\n");
      out.write("                        <script>alert(\"Request Rejected..\")</script>\n");
      out.write("        ");

                    }
                } else if (rs1.next()) {
                    if(rs1.getString("projectcenter_vstatus").equals("0")){
                         
      out.write("\n");
      out.write("                        <script>alert(\"Request Pending..\")</script>\n");
      out.write("        ");

                    }
                    else if(rs1.getString("projectcenter_vstatus").equals("1")){
                    session.setAttribute("projectcenterid", rs1.getString("projectcenter_id"));
                    session.setAttribute("projectcentername", rs1.getString("projectcenter_name"));
                    response.sendRedirect("../ProjectCenter/Home.jsp");
                    }
                    else{
                        
      out.write("\n");
      out.write("                        <script>alert(\"Request Rejected..\")</script>\n");
      out.write("        ");

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

        
      out.write("\n");
      out.write("        <script>\n");
      out.write("            alert('invalid details');\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");
                }

            }


        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <img src=\"../Assets/Temp/Login/images/undraw_remotely_2j6y.svg\" alt=\"Image\" class=\"img-fluid\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-6 contents\">\n");
      out.write("                        <div class=\"row justify-content-center\">\n");
      out.write("                            <div class=\"col-md-8\">\n");
      out.write("                                <div class=\"mb-4\">\n");
      out.write("                                    <h3>Sign In</h3>\n");
      out.write("                                    <p class=\"mb-4\">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p>\n");
      out.write("                                </div>\n");
      out.write("                                <form action=\"#\" method=\"post\">\n");
      out.write("                                    <div class=\"form-group first\">\n");
      out.write("                                        <label for=\"username\">Username</label>\n");
      out.write("                                        <input type=\"text\" class=\"form-control\" name=\"txt_username\" id=\"username\">\n");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"form-group last mb-4\">\n");
      out.write("                                        <label for=\"password\">Password</label>\n");
      out.write("                                        <input type=\"password\" class=\"form-control\" name=\"txt_password\" id=\"password\">\n");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div class=\"d-flex mb-5 align-items-center\">\n");
      out.write("                                        <label class=\"control control--checkbox mb-0\"><span class=\"caption\">Remember me</span>\n");
      out.write("                                            <input type=\"checkbox\" checked=\"checked\"/>\n");
      out.write("                                            <div class=\"control__indicator\"></div>\n");
      out.write("                                        </label>\n");
      out.write("                                        <span class=\"ml-auto\"><a href=\"Home.jsp\" class=\"forgot-pass\">Home</a></span> \n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <input type=\"submit\" name=\"btn_login\" value=\"Log In\" class=\"btn btn-block btn-primary\">\n");
      out.write("\n");
      out.write("                                    <span class=\"d-block text-left my-4 text-muted\">&mdash; or login with &mdash;</span>\n");
      out.write("\n");
      out.write("                                    <div class=\"social-login\">\n");
      out.write("                                        <a href=\"#\" class=\"facebook\">\n");
      out.write("                                            <span class=\"icon-facebook mr-3\"></span> \n");
      out.write("                                        </a>\n");
      out.write("                                        <a href=\"#\" class=\"twitter\">\n");
      out.write("                                            <span class=\"icon-twitter mr-3\"></span> \n");
      out.write("                                        </a>\n");
      out.write("                                        <a href=\"#\" class=\"google\">\n");
      out.write("                                            <span class=\"icon-google mr-3\"></span> \n");
      out.write("                                        </a>\n");
      out.write("                                    </div>\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script src=\"../Assets/Temp/Login/js/jquery-3.3.1.min.js\"></script>\n");
      out.write("        <script src=\"../Assets/Temp/Login/js/popper.min.js\"></script>\n");
      out.write("        <script src=\"../Assets/Temp/Login/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"../Assets/Temp/Login/js/main.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
