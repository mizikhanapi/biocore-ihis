package org.apache.jsp.LIS;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.sql.*;
import dBConn.Conn;
import main.RMIConnector;
import Config.Config;

public final class MainPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/LIS/../assets/header.html");
    _jspx_dependants.add("/LIS/libraries/sideMenus.jsp");
    _jspx_dependants.add("/LIS/libraries/topMenus.html");
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    Conn conn = new Conn();
   
    Config.getFile_url(session);
    Config.getBase_url(request);



      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">   \n");
      out.write("        <title>Main Page</title>\n");
      out.write("         ");
      out.write("    \n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->\n");
      out.write("<meta name=\"description\" content=\"\">\n");
      out.write("<meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("<!-- Bootstrap core CSS -->\n");
      out.write("<link href=\"../assets/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("<link rel=\"stylesheet\" href=\"../assets/font-awesome/css/font-awesome.min.css\">\n");
      out.write("<!-- Custom styles for this template -->\n");
      out.write("<link href=\"../assets/css/dashboard.css\" rel=\"stylesheet\">\n");
      out.write("<link href=\"../assets/css/Line-tabs.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->\n");
      out.write("<link href=\"../Dashboard_files/ie10-viewport-bug-workaround.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<style type=\"text/css\">\n");
      out.write("\n");
      out.write("    .panel panel-default-small{\n");
      out.write("        width:250px;\n");
      out.write("    }\n");
      out.write("    .panel-title{\n");
      out.write("        font-size:14px;}\n");
      out.write("    .list-group-item{\n");
      out.write("        width:200px;\n");
      out.write("    }\n");
      out.write("    .fa-chevron-right{\n");
      out.write("        color:#0088cc;}\n");
      out.write("    .list-group-item{\n");
      out.write("        display:block;\n");
      out.write("        margin-left:40px;\n");
      out.write("    }\n");
      out.write("    .list-group-item librePanelListGroupItem{\n");
      out.write("        padding-left:30px;\n");
      out.write("    }\n");
      out.write("</style>");
      out.write("\n");
      out.write("\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <script src=\"assets/js/jquery.min.js\"></script>\n");
      out.write("        <!-- Custom styles for this template -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/css/loading.css\">\n");
      out.write("        <link href=\"assets/datepicker/jquery-ui.css\" rel=\"stylesheet\">    \n");
      out.write("        <link href=\"assets/datepicker/jquery-ui.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"assets/datepicker/jquery-ui.js\"></script>\n");
      out.write("        <script src=\"assets/js/form-validator.min.js\"></script>\n");
      out.write("        <script src=\"assets/js/bootstrap.min.js\"></script> \n");
      out.write("        <script src=\"assets/js/w3data.js\"></script>\n");
      out.write("        <script src=\"assets/js/bootbox.min.js\"></script>  \n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("         <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row\">   \t\t\n");
      out.write("            <!-- menu side -->\t\t\n");
      out.write("            ");
      out.write("\t\t\n");
      out.write("<div class=\"col-sm-3 col-md-2 sidebar\">\n");
      out.write("    \n");
      out.write("    <!-- logo -->\n");
      out.write("\t\t<div class=\"logo\">\n");
      out.write("\t\tWelcome to <span>iHIS</span>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<!-- logo -->\n");
      out.write("\t\t\n");
      out.write("\t\t<!-- profile Sidebar -->\n");
      out.write("\t\t<div class=\"profile\">\n");
      out.write("\t\t\t\t<div class=\"profile-userpic\">\n");
      out.write("\t\t\t\t\t<img src=\"../assets/profile.jpg\" class=\"img-responsive\" alt=\"\">\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<!-- SIDEBAR USER TITLE -->\n");
      out.write("\t\t\t\t<div class=\"profile-usertitle\">\n");
      out.write("\t\t\t\t\t<div class=\"profile-usertitle-name\">\n");
      out.write("\t\t\t\t\t\tMarcus Doe\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"profile-usertitle-job\">\n");
      out.write("\t\t\t\t\t\tDeveloper\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<!-- SIDEBAR BUTTONS -->\n");
      out.write("\t\t\t\t<div class=\"profile-userbuttons\">\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-success btn-sm\">Manage Account</button>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<hr/>\n");
      out.write("\t\t<!-- profile Sidebar -->\n");
      out.write("    <ul id=\"menu-content\" class=\"nav nav-sidebar\">\n");
      out.write("        <!-- // menu tanpa dropdown -->\n");
      out.write("        <li>\n");
      out.write("            <a  href=\"MainPage.jsp\" >\n");
      out.write("                <i class=\"fa fa-briefcase fa-lg\"></i> Lab Patient List Order\n");
      out.write("            </a>\n");
      out.write("        </li>\n");
      out.write("         <li>\n");
      out.write("            <a  href=\"ManageResult.jsp\" >\n");
      out.write("                <i class=\"fa fa-flask fa-lg\"></i> Receive Specimen\n");
      out.write("            </a>\n");
      out.write("         </li> \n");
      out.write("        <li>\n");
      out.write("            <a  href=\"ManageTest.jsp\" >\n");
      out.write("                <i class=\"fa fa-briefcase fa-lg\"></i> Manage Test\n");
      out.write("            </a>\n");
      out.write("        </li> \n");
      out.write("        <li>\n");
      out.write("            <a  href=\"ManageTestCode.jsp\" >\n");
      out.write("                <i class=\"fa fa-briefcase fa-lg\"></i> Manage Test Code\n");
      out.write("            </a>\n");
      out.write("        </li>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("\n");
      out.write("</div>  \n");
      out.write("\n");
      out.write("            <!-- menu side -->\n");
      out.write("\n");
      out.write("            <!-- main -->\t\t\n");
      out.write("            <div class=\"main\" style=\"background: #f2f4f8;\">\n");
      out.write("                <!-- menu top -->\n");
      out.write("                ");
      out.write("<nav class=\"navbar navbar-static-top\" >\n");
      out.write("      <div class=\"container-fluid\">\n");
      out.write("\t  <div class=\"row\">\n");
      out.write("        \n");
      out.write("\t\t\n");
      out.write("        <div id=\"navbar\" class=\"navbar-collapse collapse\">\n");
      out.write("\t\t<ul class=\"nav navbar-nav navbar-left back\" style=\"\">\n");
      out.write("                    <li><a href=\"/IHIS/ADM/dashboard.jsp\" title=\"Back\"><i class=\" fa fa-caret-left\"></i></a></li>\n");
      out.write("                </ul>\n");
      out.write("\t\t<div class=\"nav navbar-nav navbar-left\">\n");
      out.write("                    <div style=\"padding: 10px 20px; display: block; font-size: 22px;\">\n");
      out.write("\t\t\t<span style=\"font-size: 22px;\">Laboratory Information System</span>\n");
      out.write("                    </div>\n");
      out.write("\t\t</div>\n");
      out.write("\n");
      out.write("\t\t<ul class=\"nav navbar-nav navbar-right logout\" style=\"\">\n");
      out.write("                    <li><a href=\"/ADM/index.jsp\" title=\"Log Out\"><i class=\" fa fa-power-off\"></i></a></li>\n");
      out.write("                </ul>\n");
      out.write("\t\t  \n");
      out.write("        </div>\n");
      out.write("\t\t\n");
      out.write("\t\t</div>\n");
      out.write("\t\t\n");
      out.write("\t </div>\n");
      out.write("    </nav>");
      out.write("\n");
      out.write("                <!-- menu top -->\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-12\">\n");
      out.write("                        <div class=\"thumbnail\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <!-- Tab Menu -->\n");
      out.write("\n");
      out.write("                            <div class=\"tabbable-panel\">\n");
      out.write("                                <div class=\"tabbable-line\">\n");
      out.write("                                    <ul class=\"nav nav-tabs \">\n");
      out.write("                                        <li class=\"active\">\n");
      out.write("                                            <a href=\"#tab_default_1\" data-toggle=\"tab\">\n");
      out.write("                                                Recieve Order </a>\n");
      out.write("                                        </li>\n");
      out.write("\n");
      out.write("                                    </ul>\n");
      out.write("                                    <!-- tab content -->\n");
      out.write("                                    <div class=\"tab-content\">\n");
      out.write("                                        <div class=\"tab-pane active\" id=\"tab_default_1\">\n");
      out.write("\n");
      out.write("                                            \n");
      out.write("                             <table id=\"orderRecieve\"  class=\"table table-striped table-bordered\" cellspacing=\"0\" width=\"100%\">\n");
      out.write("                            ");

                              // Statement st = con.createStatement();
                             //  ResultSet resultset = 
                              // st.executeQuery("SELECT om.order_no,OM.PMI_NO,PMS.PATIENT_NAME,OM.ORDER_DATE,OM.HFC_CD,OM.EPISODE_DATE,OM.ORDER_BY FROM LIS_ORDER_MASTER OM, PMS_PATIENT_BIODATA PMS WHERE OM.pmi_no = PMS.PMI_NO");
                              //Conn conn = new Conn();       
                              String sqlPatientApp = "SELECT om.order_no, OM.PMI_NO,PMS.PATIENT_NAME,OM.ORDER_DATE,OM.EPISODE_DATE,OM.ORDER_BY,OM.HFC_CD,OM.ORDER_STATUS FROM LIS_ORDER_MASTER OM, PMS_PATIENT_BIODATA PMS WHERE OM.pmi_no = PMS.PMI_NO AND OM.ORDER_STATUS='0'";    
                              ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sqlPatientApp);

                        
      out.write("\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                <th class=\"col-sm-1\">Order No</th>\n");
      out.write("                                <th class=\"col-sm-1\">PMI No</th>\n");
      out.write("                                <th class=\"col-sm-1\">Patient Name</th>\n");
      out.write("                                <th class=\"col-sm-1\">Order date</th>\t\t\n");
      out.write("                                <th class=\"col-sm-1\">Episode date</th>\n");
      out.write("                                <th class=\"col-sm-1\">Requester Name</th>\n");
      out.write("                                <th class=\"col-sm-1\">Requester Location</th>\n");
      out.write("                                <th class=\"col-sm-1\">Order Detail</th>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        <tbody>\n");
      out.write("           \n");
      out.write("                        ");
if (dataPatientApp.size() > 0) 
                          {
                              for (int i = 0; i < dataPatientApp.size(); i++) 
                          {
      out.write("\n");
      out.write("                          <tr>\n");
      out.write("                              <td>");
      out.print(dataPatientApp.get(i).get(0));
      out.write("</td>\n");
      out.write("                              <td>");
      out.print(dataPatientApp.get(i).get(1));
      out.write("</td>\n");
      out.write("                              <td>");
      out.print(dataPatientApp.get(i).get(2));
      out.write("</td>\n");
      out.write("                              <td>");
      out.print(dataPatientApp.get(i).get(3));
      out.write("</td>\n");
      out.write("                              <td>");
      out.print(dataPatientApp.get(i).get(4));
      out.write("</td>\n");
      out.write("                              <td>");
      out.print(dataPatientApp.get(i).get(5));
      out.write("</td>\n");
      out.write("                              <td>");
      out.print(dataPatientApp.get(i).get(6));
      out.write("</td>\n");
      out.write("                              <td><a href='view_order.jsp?pmi=");
      out.print(dataPatientApp.get(i).get(1));
      out.write(" &order_no=");
      out.print(dataPatientApp.get(i).get(0));
      out.write("' class='btn btn-primary btn' ><span class='glyphicon glyphicon-'></span>View</a></td> \n");
      out.write("                          </tr>\n");
      out.write("                     ");

                      }}
                     
      out.write("\n");
      out.write("                     </tbody>\n");
      out.write("                  </table>\n");
      out.write("                                                \n");
      out.write("                            \n");
      out.write("                                           \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <!-- Tab Menu -->\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("              \n");
      out.write("            \n");
      out.write("             </div> \n");
      out.write("        <script type=\"text/javascript\" charset=\"utf-8\">\n");
      out.write("   $(document).ready(function() {\n");
      out.write("    $('#orderRecieve').DataTable();\n");
      out.write("} );\n");
      out.write("    </script>\n");
      out.write("        <script src=\"bootstrap-3.3.6-dist/js/jquery.dataTables.min.js\"></script>\n");
      out.write("        \n");
      out.write("         <script>\n");
      out.write("        w3IncludeHTML();\n");
      out.write("\n");
      out.write("        $(document).ready(function () {\n");
      out.write("            //$(\"#WardOccupancy\").load(\"WardOccupancy.jsp\");\n");
      out.write("            //$(\"#RecieveOderTable\").load(\"RecieveOder-Table.jsp\");\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            $(\"#headerindex\").load(\"libraries/header.html\");\n");
      out.write("            $(\"#topmenuindex\").load(\"libraries/topMenus.html\");\n");
      out.write("            $(\"#sidemenus\").load(\"libraries/sideMenus.jsp\");\n");
      out.write("//                $(\"#WardOccupancyTable\").load(\"WardOccupancy-Table.jsp\");\n");
      out.write("\n");
      out.write("        });\n");
      out.write("\n");
      out.write("    </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
