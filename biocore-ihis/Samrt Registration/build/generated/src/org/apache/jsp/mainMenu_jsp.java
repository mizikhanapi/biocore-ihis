package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dBConn.Conn;
import Config.Config;

public final class mainMenu_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Header.jsp");
  }

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

      out.write("  \r\n");
      out.write("\r\n");
      out.write("<script src=\"//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js\"></script>\r\n");

    
    if (!(session.getAttribute("USER_IC") == null || session.getAttribute("USER_IC").equals("")))
        {
     
      out.write("\r\n");
      out.write("            <script type=\"text/javascript\">\r\n");
      out.write("                $(document).ready(function () {\r\n");
      out.write("                    $('#signupBtn').hide();\r\n");
      out.write("                 });\r\n");
      out.write("                \r\n");
      out.write("                </script>\r\n");

        }
        else
        {


      out.write("\r\n");
      out.write("            <script type=\"text/javascript\">\r\n");
      out.write("                $(document).ready(function () {\r\n");
      out.write("                    $('#logoutBtn').hide();\r\n");
      out.write("                 });\r\n");
      out.write("                \r\n");
      out.write("                </script>\r\n");


        }
   

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <title>Kiosk | Main Menu Page</title>\r\n");
      out.write("     <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        \r\n");
      out.write("    <script src=\"Dashboard_files\\jquery.min.js.download\"></script>\r\n");
      out.write("        \r\n");
      out.write("    <div w3-include-html=\"libraries/header.html\"></div>\r\n");
      out.write("        ");
      out.write("\n");
      out.write("<head>\n");
      out.write("        \n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("         <!--Let browser know website is optimized for mobile-->\n");
      out.write("           <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\n");
      out.write("         \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <!-- Latest compiled and minified CSS -->\n");
      out.write("      <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("\n");
      out.write("      <!-- jQuery library -->\n");
      out.write("       <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\"></script> \n");
      out.write("\n");
      out.write("       <!--Latest compiled JavaScript--> \n");
      out.write("       <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script> \n");
      out.write("\n");
      out.write("      <!-- local bootstrap library -->\n");
      out.write("      <!-- <link  rel=\"stylesheet\" href=\"css/bootstrap.css\"> -->\n");
      out.write("      \n");
      out.write("    <script src=\"../assets/js/bootbox.min.js\"></script>\n");
      out.write("    \n");
      out.write("</head>");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("  \r\n");
      out.write("    <link href=\"assets/css/login.css\" rel=\"stylesheet\">\r\n");
      out.write("     <link  rel=\"stylesheet\" href=\"css/style.css\">\r\n");
      out.write("\r\n");
      out.write("  \r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("      <div class=\"container\">\r\n");
      out.write("        <div class=\"card card-container\">\r\n");
      out.write("            <div class=\"profile-img-card\">\r\n");
      out.write("                <i class=\"fa fa-user-md\" aria-hidden=\"true\" style=\"color: #666; font-size: 100px;\"></i>\r\n");
      out.write("            </div>\r\n");
      out.write("            <h2 style=\"text-align: center; margin-bottom: 10%\">iHIS</h2>\r\n");
      out.write("            \r\n");
      out.write("            <p id=\"profile-name\" class=\"profile-name-card \" style=\"font: 17px; margin: 10%;\">PLEASE SELECT Service</p>\r\n");
      out.write("            <div class=\"tac\">\r\n");
      out.write("                <div id=\"signupBtn\" class=\"tac margin1 centerBtnDisplay\">\r\n");
      out.write("                     <a  href=\"signUp/readinfo.jsp\" class=\"btn btn-lg  bttn \" >Sign up</a>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"tac margin1 centerBtnDisplay\">\r\n");
      out.write("                     <a href=\"registration/SelectQueue.jsp\" class=\"btn btn-lg  bttn \" >Registration</a> \r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"tac margin1 centerBtnDisplay\">\r\n");
      out.write("                     <a href=\"medicalHistory/printReport.jsp\" class=\"btn btn-lg  bttn \" >View Medical History</a> \r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <a id=\"logoutBtn\" href=\"destroySession.jsp\" class=\"pull-right\" style =\"font-size:14px\" type=\"submit\">Log Out</a>\r\n");
      out.write("            \r\n");
      out.write("        </div><!-- /card-container -->\r\n");
      out.write("    </div><!-- /container -->\r\n");
      out.write("      \r\n");
      out.write("  \r\n");
      out.write("       <div w3-include-html=\"libraries/script.html\"></div>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"http://www.w3schools.com/lib/w3data.js\"></script>\r\n");
      out.write("\r\n");
      out.write("      <script>\r\n");
      out.write("        w3IncludeHTML();\r\n");
      out.write("      </script>\r\n");
      out.write("      \r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
