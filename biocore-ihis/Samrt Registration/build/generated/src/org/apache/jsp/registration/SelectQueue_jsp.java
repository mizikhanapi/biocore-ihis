package org.apache.jsp.registration;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dBConn.Conn;
import Config.Config;
import java.util.ArrayList;
import org.apache.commons.lang3.StringUtils;

public final class SelectQueue_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/registration/../Header.jsp");
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    
   
    Conn conn = new Conn();
    
    //String Commonqueue = "select * from pms_queue_name where queue_type='CM' and hfc_cd='"+hfc+"'";
    //String Consultationqueue = "select * from pms_queue_name where queue_type='FY' and hfc_cd='"+hfc+"'";
    
    
    String Commonqueue = "select * from pms_queue_name where queue_type='CM' ";
    String Consultationqueue = "select * from pms_queue_name where queue_type='FY' ";
        
    
     ArrayList<ArrayList<String>> dataQueue2, dataQueue;
     
        dataQueue2 = conn.getData(Consultationqueue);
    
     
//    if (session.getAttribute("USER_IC") == null || session.getAttribute("USER_IC").equals(""))
//        {
//            response.sendRedirect("../login.jsp");
//            out.print(session.getAttribute("USER_IC"));
//            
//        }
//        else
//        {
//            String userIC = session.getAttribute("USER_IC").toString();
//            out.print(userIC);
//        }
         
    

        
//     String nationality = "SELECT * FROM adm_lookup_detail where master_reference_code = '0011'";
//     String gender = "SELECT * FROM adm_lookup_detail where master_reference_code = '0041'";
//     
//     
//     ArrayList<ArrayList<String>> dataNationality,dataGender;
//     
//     
//     dataNationality = conn.getData(nationality);
//     dataGender = conn.getData(gender);
     
//     if(dataGender.size() > 0)
//     {
//        out.print(dataGender.get(0).get(1) +"<br>");
//        out.print(dataGender.get(0).get(2));
//     }
//     else
//    {
//        out.print("Select NUll");
//    }

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("  <title>Kiosk | Registration Page</title>\r\n");
      out.write("\r\n");
      out.write("  \r\n");
      out.write("  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        \r\n");
      out.write("    <script src=\"../Dashboard_files/jquery.min.js.download\"></script>\r\n");
      out.write("        \r\n");
      out.write("    <div w3-include-html=\"../libraries/header.html\"></div>\r\n");
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
      out.write("    <link href=\"../assets/css/login.css\" rel=\"stylesheet\">\r\n");
      out.write("     <link  rel=\"stylesheet\" href=\"../css/style.css\">\r\n");
      out.write("     \r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("  \r\n");
      out.write("    \r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("     <div class=\"\" >\r\n");
      out.write("         <div class=\"card card-container\" >\r\n");
      out.write("             <!-- <img class=\"profile-img-card\" src=\"//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120\" alt=\"\" /> -->\r\n");
      out.write("             <div class=\"profile-img-card\">\r\n");
      out.write("                 <i class=\"fa fa-user-md\" aria-hidden=\"true\" style=\"color: #666; font-size: 100px;\"></i>\r\n");
      out.write("             </div>\r\n");
      out.write("             <h2 style=\"text-align: center;\">iHIS</h2>\r\n");
      out.write("             <p id=\"profile-name\" class=\"profile-name-card\">Please Enter your IC Number</p>\r\n");
      out.write("             <form class=\"form-signin\" action=\"dashboard.jsp\">\r\n");
      out.write("                 <span id=\"reauth-email\" class=\"reauth-email\"></span>\r\n");
      out.write("                 \r\n");
      out.write("                 <input type=\"text\" id=\"inputUserIC\" class=\"form-control\" placeholder=\"Enter Your IC\" name=\"useric\">\r\n");
      out.write("                 <input type=\"text\" id=\"inputUserName\" class=\"form-control\" placeholder=\"\" name=\"username\" disabled=\"\">\r\n");
      out.write("                 \r\n");
      out.write("                \r\n");
      out.write("                 <div class=\"form-group\">\r\n");
      out.write("                    <label class=\"control-label\" for=\"selectbasic\">Please Select Queue</label>\r\n");
      out.write("                    <!--<div class=\"col-md-8\">-->\r\n");
      out.write("                          <br>      \r\n");
      out.write("                    <div class=\"btn-group\" data-toggle=\"buttons\">\r\n");
      out.write("                        <label class=\"btn active marglft\" for=\"commonQueue\">\r\n");
      out.write("                            <input type=\"radio\" id =\"commonQueue\" name='queuetype' value=\"CM\"><i class=\"fa fa-circle-o fa-2x\"></i><i class=\"fa fa-dot-circle-o fa-2x \"></i> <span>Consultation</span>\r\n");
      out.write("                        </label>\r\n");
      out.write("                        <label class=\"btn marglft\" for=\"consultantQueue\">\r\n");
      out.write("                            <input type=\"radio\" id =\"consultantQueue\" name='queuetype' value=\"FY\"><i class=\"fa fa-circle-o fa-2x\"></i><i class=\"fa fa-dot-circle-o fa-2x \"></i><span>Services</span>\r\n");
      out.write("                        </label>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <!--</div>-->\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                 <select  id=\"selectedQueue\"  class=\"form-control select-full\" >\r\n");
      out.write("                     <option value=\"null\" selected=\"\" disabled=\"\">Please Select Queue</option>\r\n");
      out.write("                     \r\n");
      out.write("                        ");

                            String add = null, text=null;
                            for (int i = 0; i < dataQueue2.size(); i++) {
                                    if (dataQueue2.get(i).get(1) != ""|| dataQueue2.get(i).get(1) != null)
                                        {
                                            text = dataQueue2.get(i).get(1).substring(0, 4);
//                                            add = add + "-"+text;
//                                            out.print(add);
                                            if (!text.equalsIgnoreCase("Room"))
                                            {
                                                
                        
      out.write("\r\n");
      out.write("                            \r\n");
      out.write("                        <option value=\"");
      out.print(dataQueue2.get(i).get(1));
      out.write('"');
      out.write('>');
      out.print("(" + dataQueue2.get(i).get(0) + ") " + dataQueue2.get(i).get(1));
      out.write("</option>\r\n");
      out.write("                        ");
                  }
                                        } 
                            }
                        
      out.write("\r\n");
      out.write("                       \r\n");
      out.write("                 </select>\r\n");
      out.write("                        \r\n");
      out.write("             </form><!-- /form -->\r\n");
      out.write("    \r\n");
      out.write("             <div class=\"form-signin tac\">\r\n");
      out.write("                    <div class=\"tac margin1 centerBtnDisplay\">\r\n");
      out.write("                        <button id=\"registerSignup\" class=\"btn btn-lg bttn btn_block\">Register</button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"tac margin1 centerBtnDisplay\">\r\n");
      out.write("                        <button id=\"cancelSignup\" class=\"btn btn-lg bttn btn_block \">Cancel</button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("             \r\n");
      out.write("             <a href=\"../destroySession.jsp\" class=\"pull-right\" style =\"font-size:14px\" type=\"submit\">Log Out</a>\r\n");
      out.write("         </div>\r\n");
      out.write("\r\n");
      out.write("        </div><!-- /card-container -->\r\n");
      out.write("    </div><!-- /container -->\r\n");
      out.write("\t\r\n");
      out.write("       <div w3-include-html=\"../libraries/script.html\"></div>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"http://www.w3schools.com/lib/w3data.js\"></script>\r\n");
      out.write(" \r\n");
      out.write("    <script src=\"//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js\"></script>\r\n");
      out.write("    <!--Latest compiled JavaScript--> \r\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\r\n");
      out.write("    <script src=\"../assets/jquery.PrintArea.js\"></script>\r\n");
      out.write("    \r\n");
      out.write("      <script>\r\n");
      out.write("        w3IncludeHTML();\r\n");
      out.write("        \r\n");
      out.write("//        $(document).ready( function () {\r\n");
      out.write("//              $('#select-0').hide();\r\n");
      out.write("//              $('#select-1').hide();\r\n");
      out.write("//            \r\n");
      out.write("            //event when radio button is change\r\n");
      out.write("//            $('input:radio[name=\"radios\"]').change(\r\n");
      out.write("//            function () {\r\n");
      out.write("//                if ($('#radios-0').is(':checked')) {\r\n");
      out.write("//                    $('#select-0').show();\r\n");
      out.write("//                    $('#select-1').hide();\r\n");
      out.write("//                } else if ($('#radios-1').is(':checked')) {\r\n");
      out.write("//                    $('#select-1').show();\r\n");
      out.write("//                    $('#select-0').hide();;\r\n");
      out.write("//                }\r\n");
      out.write("//            });\r\n");
      out.write("\r\n");
      out.write("            $('#selectedQueue').hide();\r\n");
      out.write("            \r\n");
      out.write("            var $body = $('body');\r\n");
      out.write("            var yyyyMMddHHmmss;\r\n");
      out.write("            var HHmmss;\r\n");
      out.write("            var yyyyMMdd;\r\n");
      out.write("            var ddMMyyyy;\r\n");
      out.write("            var timeStamp;\r\n");
      out.write("            var pmi_no;\r\n");
      out.write("            var user_id;\r\n");
      out.write("            var user_name;\r\n");
      out.write("            \r\n");
      out.write("            //function to get date \r\n");
      out.write("    function getDateNow() {\r\n");
      out.write("        //yyyy-MM-dd HH:mm:ss\r\n");
      out.write("        var nowDate = new Date();\r\n");
      out.write("        timeStamp = nowDate;\r\n");
      out.write("        var ZeroMinutes, ZeroSeconds, ZeroDay, ZeroMonth;\r\n");
      out.write("        //months\r\n");
      out.write("        var month = (nowDate.getMonth() + 1);\r\n");
      out.write("        if (month < 10) {\r\n");
      out.write("            ZeroMonth = \"0\" + month;\r\n");
      out.write("        } else {\r\n");
      out.write("            ZeroMonth = month;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        //days\r\n");
      out.write("        var day = (nowDate.getDate());\r\n");
      out.write("        if (day < 10) {\r\n");
      out.write("            ZeroDay = \"0\" + day;\r\n");
      out.write("        } else {\r\n");
      out.write("            ZeroDay = day;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        //years\r\n");
      out.write("        var year = (nowDate.getFullYear());\r\n");
      out.write("        //hours\r\n");
      out.write("        var hours = nowDate.getHours();\r\n");
      out.write("        //minutes\r\n");
      out.write("        var minutes = nowDate.getMinutes();\r\n");
      out.write("        if (minutes < 10) {\r\n");
      out.write("            ZeroMinutes = \"0\" + minutes;\r\n");
      out.write("        } else {\r\n");
      out.write("            ZeroMinutes = minutes;\r\n");
      out.write("        }\r\n");
      out.write("        //seconds\r\n");
      out.write("        var seconds = nowDate.getSeconds();\r\n");
      out.write("        if (seconds < 10) {\r\n");
      out.write("            ZeroSeconds = \"0\" + seconds;\r\n");
      out.write("        } else {\r\n");
      out.write("            ZeroSeconds = seconds;\r\n");
      out.write("        }\r\n");
      out.write("        //complete day\r\n");
      out.write("        yyyyMMddHHmmss = year + \"-\" + ZeroMonth + \"-\" + ZeroDay + \" \" + hours + \":\" + ZeroMinutes + \":\" + ZeroSeconds;\r\n");
      out.write("        HHmmss = hours + \":\" + ZeroMinutes + \":\" + ZeroSeconds;\r\n");
      out.write("        yyyyMMdd = year + \"-\" + ZeroMonth + \"-\" + ZeroDay;\r\n");
      out.write("        ddMMyyyy = ZeroDay + \"-\" + ZeroMonth + \"-\" + year;\r\n");
      out.write("    }\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("        \r\n");
      out.write("//        //event when radio button is change\r\n");
      out.write("//    $('input:radio[name=\"queuetype\"]').on(\"change\",\r\n");
      out.write("//            function () {\r\n");
      out.write("//                console.log(\"click\");\r\n");
      out.write("//                if ($('#commonQueue').is(':checked')) {\r\n");
      out.write("//                    $('#selectedQueue').hide();\r\n");
      out.write("//                } else if ($('#consultantQueue').is(':checked')) {\r\n");
      out.write("//                    $('#selectedQueue').show();\r\n");
      out.write("//                } \r\n");
      out.write("//            });\r\n");
      out.write("          \r\n");
      out.write("//            \r\n");
      out.write("//             //event when radio button is change\r\n");
      out.write("//        $('#commonQueue').on(\"click\",\r\n");
      out.write("//            function () {\r\n");
      out.write("//                console.log(\"click 1\");\r\n");
      out.write("//                    $('#selectedQueue').hide();\r\n");
      out.write("//                \r\n");
      out.write("//            });\r\n");
      out.write("//            \r\n");
      out.write("        //event when radio button1 is change\r\n");
      out.write("        document.getElementById(\"commonQueue\").onchange = function() {changes();};\r\n");
      out.write("       \r\n");
      out.write("            function changes() {\r\n");
      out.write("                console.log(\"click 2\");\r\n");
      out.write("                    $('#selectedQueue').hide();\r\n");
      out.write("                $(\"#selectedQueue\").val(\"null\");\r\n");
      out.write("            };\r\n");
      out.write("            \r\n");
      out.write("             //event when radio button2 is change\r\n");
      out.write("        document.getElementById(\"consultantQueue\").onchange = function() {changes1();};\r\n");
      out.write("       \r\n");
      out.write("            function changes1() {\r\n");
      out.write("                console.log(\"click 1\");\r\n");
      out.write("                    $('#selectedQueue').show();\r\n");
      out.write("                \r\n");
      out.write("            };\r\n");
      out.write("            \r\n");
      out.write("            //event when radio button1 is change\r\n");
      out.write("        document.getElementById(\"inputUserIC\").onchange = function() {TextFiledchanges();};\r\n");
      out.write("            \r\n");
      out.write("            function TextFiledchanges() {\r\n");
      out.write("                getDateNow();\r\n");
      out.write("//                bootbox.alert(yyyyMMddHHmmss +\" \"+HHmmss+\" \"+yyyyMMdd+\" \"+ddMMyyyy);\r\n");
      out.write("                console.log(\"Changed\");\r\n");
      out.write("                   \r\n");
      out.write("                   var userIC;\r\n");
      out.write("                   userIC = $(\"#inputUserIC\").val();\r\n");
      out.write("                   \r\n");
      out.write("                   var data = {\r\n");
      out.write("                       userIC:userIC\r\n");
      out.write("                   };\r\n");
      out.write("                   if(userIC === \"\")\r\n");
      out.write("                   {\r\n");
      out.write("                       bootbox.alert(\"please Fill in the user IC\");\r\n");
      out.write("                   }\r\n");
      out.write("                   else\r\n");
      out.write("                   {\r\n");
      out.write("                       console.log(\"before ajax\");\r\n");
      out.write("                       $.ajax({\r\n");
      out.write("                           type:\"POST\",\r\n");
      out.write("                           url: \"../Controller/searchUser.jsp\",\r\n");
      out.write("                           data: data,\r\n");
      out.write("                           timeout: 10000,\r\n");
      out.write("                           success: function (data){\r\n");
      out.write("                               console.log(\"in sucess\");\r\n");
      out.write("                               if(data.trim() === \"NOT FOUND\")\r\n");
      out.write("                               {\r\n");
      out.write("                                   bootbox.alert(\"NOT FOUND\");\r\n");
      out.write("                               }\r\n");
      out.write("                               else\r\n");
      out.write("                               {\r\n");
      out.write("                                   console.log(data.trim());\r\n");
      out.write("                                   var splitData = String(data.trim()).split(\"|\");\r\n");
      out.write("                                    console.log(splitData);\r\n");
      out.write("                                    \r\n");
      out.write("                                    pmi_no = splitData[0];\r\n");
      out.write("                                    user_name = splitData[2];\r\n");
      out.write("                                    user_id = splitData[7];\r\n");
      out.write("                                   $(\"#inputUserName\").val(user_name);\r\n");
      out.write("                                   console.log(pmi_no +\" \" +user_name+\" \"+user_id);\r\n");
      out.write("                               }\r\n");
      out.write("                           },\r\n");
      out.write("                           error: function (err){\r\n");
      out.write("                               console.log(err);\r\n");
      out.write("                           }\r\n");
      out.write("                       });\r\n");
      out.write("                   }\r\n");
      out.write("            };\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("//            \r\n");
      out.write("//            \r\n");
      out.write("//            \r\n");
      out.write("//            \r\n");
      out.write("//             //event when radio button is change\r\n");
      out.write("//        $('input:radio[name=\"queuetype\"]').on(\"change\",\r\n");
      out.write("//            function () {\r\n");
      out.write("//                if ($('#commonQueue').is(':checked')) {\r\n");
      out.write("//                    $('#selectedQueue').hide();\r\n");
      out.write("//                }else if ($('#consultantQueue').is(':checked')) {\r\n");
      out.write("//                    $('#selectedQueue').show();\r\n");
      out.write("//                } \r\n");
      out.write("//            });\r\n");
      out.write("//               \r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("           $(\"#cancelSignup\").on(\"click\", function(){\r\n");
      out.write("               \r\n");
      out.write("               window.location = \"../mainMenu.jsp\";\r\n");
      out.write("                              \r\n");
      out.write("           });//on clcik submitSignup\r\n");
      out.write("           \r\n");
      out.write("           $(\"#registerSignup\").click(function(){\r\n");
      out.write("               getDateNow();\r\n");
      out.write("                var useric, username, queuetype, selectedqueue;\r\n");
      out.write("                \r\n");
      out.write("                useric= $(\"#inputUserIC\").val();\r\n");
      out.write("                username= $(\"#inputUserName\").val();\r\n");
      out.write("        \tqueuetype = $(\"input[name='queuetype']:checked\").val();\r\n");
      out.write("                selectedqueue= $(\"#selectedQueue\").val();\r\n");
      out.write("                \r\n");
      out.write("                console.log(useric+\" \"+username+\" \"+queuetype+\" \"+selectedqueue);\r\n");
      out.write("                \r\n");
      out.write("                if(useric === \"\")\r\n");
      out.write("                {\r\n");
      out.write("                    bootbox.alert(\"Fill in the user IC\");\r\n");
      out.write("                    $(\"#inputUserIC\").focus();\r\n");
      out.write("                } else if (username === \"\") {\r\n");
      out.write("                    bootbox.alert(\"Fill in the user Name\");\r\n");
      out.write("                    $(\"#inputUserName\").focus();\r\n");
      out.write("                }else if (containsNumber(username)) {\r\n");
      out.write("                    bootbox.alert(\"UnValic Name, Contain Numbers\");\r\n");
      out.write("                     $(\"#inputUserName\").focus();\r\n");
      out.write("                } else {\r\n");
      out.write("                    \r\n");
      out.write("                    if(queuetype === \"CM\")\r\n");
      out.write("                    {\r\n");
      out.write("                        selectedqueue =\"Normal Queue\";\r\n");
      out.write("                    };\r\n");
      out.write("                    \r\n");
      out.write("                    var data = {\r\n");
      out.write("                        'userIC': useric,\r\n");
      out.write("                        'userName': username,\r\n");
      out.write("                        'queueType': queuetype,\r\n");
      out.write("                        'selectedQueue': selectedqueue,\r\n");
      out.write("                        'today': yyyyMMdd,\r\n");
      out.write("                        'now' : HHmmss,\r\n");
      out.write("                        'pmiNo': pmi_no,\r\n");
      out.write("                        'userID':user_id\r\n");
      out.write("                    };\r\n");
      out.write("                    \r\n");
      out.write("                    \r\n");
      out.write("                console.log(data);\r\n");
      out.write("                \r\n");
      out.write("                $.ajax({\r\n");
      out.write("                            type: \"POST\",\r\n");
      out.write("                            url: \"../Controller/insertNewQueue.jsp\",\r\n");
      out.write("                            data: data,\r\n");
      out.write("                            timeout: 10000,\r\n");
      out.write("                            success: function (data){\r\n");
      out.write("                                console.log(data.trim());\r\n");
      out.write("                                $(\"#inputUserIC\").val(\"\");\r\n");
      out.write("                                $(\"#inputUserName\").val(\"\");\r\n");
      out.write("                                $(\"#selectedQueue\").val(\"null\");\r\n");
      out.write("                            },\r\n");
      out.write("                            error: function (err) {\r\n");
      out.write("                                    console.log(err);\r\n");
      out.write("                            }\r\n");
      out.write("                        });\r\n");
      out.write("            \r\n");
      out.write("                    \r\n");
      out.write("                }\r\n");
      out.write("                \r\n");
      out.write("//                var mode = 'iframe'; //popup\r\n");
      out.write("//                var close = mode == \"popup\";\r\n");
      out.write("//                var options = { mode : mode, popClose : close};\r\n");
      out.write("//                $(\"div.printableArea\").printArea( options );\r\n");
      out.write("               \r\n");
      out.write("//                var prtContent = document.getElementById(\"printableArea\");\r\n");
      out.write("//                var WinPrint = window.open('', 'Queue', 'left=0,top=0,width=4.8cm,height=4.8cm,toolbar=0,scrollbars=0,status=0');\r\n");
      out.write("//                WinPrint.document.write(prtContent.innerHTML);\r\n");
      out.write("//                WinPrint.document.close();\r\n");
      out.write("//                WinPrint.focus();\r\n");
      out.write("//                WinPrint.print();\r\n");
      out.write("                //WinPrint.close();\r\n");
      out.write("//                \r\n");
      out.write("                \r\n");
      out.write("//            var printContents = document.getElementById(divName).innerHTML;\r\n");
      out.write("//            var originalContents = document.body.innerHTML;\r\n");
      out.write("//\r\n");
      out.write("//            document.body.innerHTML = printContents;\r\n");
      out.write("//\r\n");
      out.write("//            window.print(); \r\n");
      out.write("//\r\n");
      out.write("//            document.body.innerHTML = originalContents;\r\n");
      out.write("        });\r\n");
      out.write("          \r\n");
      out.write("                 function containsNumber(any){    \r\n");
      out.write("                    var alpha = /^[a-zA-Z-,]+(\\s{0,1}[a-zA-Z-, ])*$/; //for sentence allow space\r\n");
      out.write("                    //var re = /^[A-Za-z]+$/; for one word only don't allow space\r\n");
      out.write("                    if(alpha.test(any))//contain no number\r\n");
      out.write("                       return false;\r\n");
      out.write("                    else               //comtain number\r\n");
      out.write("                      return true;      \r\n");
      out.write("                 };\r\n");
      out.write("                \r\n");
      out.write("               \r\n");
      out.write("         \r\n");
      out.write("    \r\n");
      out.write("//    });\r\n");
      out.write("      </script>\r\n");
      out.write("   \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
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
