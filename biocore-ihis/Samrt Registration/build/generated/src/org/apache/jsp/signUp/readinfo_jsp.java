package org.apache.jsp.signUp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dBConn.Conn;
import Config.Config;
import java.util.ArrayList;
import org.apache.commons.lang3.StringUtils;

public final class readinfo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/signUp/../Header.jsp");
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
    
     String nationality = "SELECT * FROM adm_lookup_detail where master_reference_code = '0011'";
     String gender = "SELECT * FROM adm_lookup_detail where master_reference_code = '0041'";
     
     
     ArrayList<ArrayList<String>> dataNationality,dataGender;
     
     
     dataNationality = conn.getData(nationality);
     dataGender = conn.getData(gender);
     
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
      out.write("\r\n");
      out.write("    <title>Kiosk | Sign Up Page</title>\r\n");
      out.write("    \r\n");
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
      out.write("     <link rel=\"stylesheet\" href=\"../css/datePicker lib/themes/default.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../css/datePicker lib/themes/default.date.css\">\r\n");
      out.write("    \r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    \r\n");
      out.write("   \r\n");
      out.write("    \r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("     <div class=\"\" >\r\n");
      out.write("         <div class=\"card card-container\" >\r\n");
      out.write("             <!-- <img class=\"profile-img-card\" src=\"//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120\" alt=\"\" /> -->\r\n");
      out.write("             <div class=\"profile-img-card\">\r\n");
      out.write("                 <i class=\"fa fa-user-md\" aria-hidden=\"true\" style=\"color: #666; font-size: 100px;\"></i>\r\n");
      out.write("             </div>\r\n");
      out.write("             <h2 style=\"text-align: center;\">iHIS</h2>\r\n");
      out.write("             <p id=\"profile-name\" class=\"profile-name-card\">Please Fill in your Information Below</p>\r\n");
      out.write("             <form class=\"form-signin\" >\r\n");
      out.write("                 <span id=\"reauth-email\" class=\"reauth-email\"></span>\r\n");
      out.write("                 \r\n");
      out.write("                 <input type=\"text\" id=\"inputUserIC\" class=\"form-control\" placeholder=\"Enter Your IC\" name=\"useric\" required autofocus>\r\n");
      out.write("                  <input type=\"text\" id=\"inputUserName\" class=\"form-control\" placeholder=\"Enter Your Name\" name=\"username\" required>\r\n");
      out.write("                 \r\n");
      out.write("                <div class=\"form-group  \">\r\n");
      out.write("                    <label class=\"control-label \" for=\"selectbasic\">Please Select Gender</label>\r\n");
      out.write("                    <!--<div class=\"col-md-8\">-->\r\n");
      out.write("                         \r\n");
      out.write("                    <div class=\"btn-group \" data-toggle=\"buttons\">\r\n");
      out.write("                        \r\n");
      out.write("                         ");

                                for (int i = 0; i < dataGender.size(); i++) {
      out.write("\r\n");
      out.write("                        <label class=\"btn \">\r\n");
      out.write("                            <input type=\"radio\" name='gender' value=\"");
      out.print(dataGender.get(i).get(1));
      out.write("\"><i class=\"fa fa-circle-o fa-2x\"></i><i class=\"fa fa-dot-circle-o fa-2x\"></i><span>");
      out.print(dataGender.get(i).get(2));
      out.write("</span>\r\n");
      out.write("                        </label>\r\n");
      out.write("                        ");
  }
                             
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <!--</div>-->\r\n");
      out.write("                </div>\r\n");
      out.write("                       \r\n");
      out.write("                     <!-- Text input-->\r\n");
      out.write("<!--                        <div class=\"form-group \">\r\n");
      out.write("                            <label class=\"col-md-4 \" for=\"textinput\">Date of Birth</label>\r\n");
      out.write("                            <div class=\"col-md-8\">\r\n");
      out.write("                                <input id=\"PMIbday\" class=\"form-control\"  name=\"date\" type=\"text\" autofocuss>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    -->\r\n");
      out.write("                    \r\n");
      out.write("                    <div class=\"form-group margin1\">\r\n");
      out.write("                        <label class=\"col-lg-4 control-label\">Date of Birth:</label>\r\n");
      out.write("                        <div class=\"col-lg-8\">\r\n");
      out.write("                           <div class=\"row\">\r\n");
      out.write("                              <div class=\"col-lg-4\">\r\n");
      out.write("                                <input type=\"text\" id=\"txt_day\" name=\"txt_day\" class=\"form-control input-sm\"  placeholder=\"DD\" required maxlength=\"2\" data-validation-required-message=\"Day is required\" >\r\n");
      out.write("                              </div>\r\n");
      out.write("                              <div class=\"col-lg-4\">\r\n");
      out.write("                               <input type=\"text\" id=\"txt_month\" name=\"txt_month\" class=\"form-control input-sm\"  placeholder=\"MM\" required maxlength=\"2\" data-validation-required-message=\"Month is required\" >\r\n");
      out.write("                              </div>\r\n");
      out.write("                              <div class=\"col-lg-4\">\r\n");
      out.write("                                <input type=\"text\" id=\"txt_year\" name=\"txt_year\" class=\"form-control input-sm\"  placeholder=\"YYYY\" required maxlength=\"4\" data-validation-required-message=\"Year is required\" >\r\n");
      out.write("                              </div>\r\n");
      out.write("                           </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    \r\n");
      out.write("        \r\n");
      out.write("                    \r\n");
      out.write("                    \r\n");
      out.write("                    \r\n");
      out.write("                 <select id=\"Usernational\" name=\"selectNaationality\" class=\"form-control select-full\">\r\n");
      out.write("                     <option value=\"null\" selected=\"\" disabled=\"\">Select Nationality</option>\r\n");
      out.write("                                    <option value=\"-\">-</option>\r\n");
      out.write("                                    ");

                                        for (int i = 0;
                                                i < dataNationality.size();
                                                i++) {
      out.write("\r\n");
      out.write("                                    <option value=\"");
      out.print(dataNationality.get(i).get(1));
      out.write('"');
      out.write('>');
      out.print(dataNationality.get(i).get(2));
      out.write("</option>\r\n");
      out.write("                                    ");
  }
                                    
      out.write("\r\n");
      out.write("                 </select>\r\n");
      out.write("                 \r\n");
      out.write("                 <input type=\"text\" id=\"inpuOccupation\" class=\"form-control\" placeholder=\"Enter Your Occupation\" name=\"occupation\" required>   \r\n");
      out.write("                 <input type=\"text\" id=\"inputUserEmail\" class=\"form-control\" placeholder=\"Enter Your Email\" name=\"useremail\" required>  \r\n");
      out.write("                 <input type=\"text\" id=\"inputUserPhoneNo\" class=\"form-control\" placeholder=\"Enter Your Phone Number\" name=\"username\" required>     \r\n");
      out.write("                 \r\n");
      out.write("                 <label class=\"control-label margin1 \" for=\"textinput\">Account Information</label>\r\n");
      out.write("                 <input type=\"text\" id=\"inputUserID\" class=\"form-control\" placeholder=\"Enter Your Login Username\" name=\"userid\" required >\r\n");
      out.write("                 <input type=\"password\" id=\"inputUserPassword\" class=\"form-control\" placeholder=\"Enter Your Password\" name=\"password\" required>     \r\n");
      out.write("                \r\n");
      out.write("             </form><!-- /form -->\r\n");
      out.write("             <div class=\"form-signin tac\">\r\n");
      out.write("                    <div class=\"tac margin1 centerBtnDisplay\">\r\n");
      out.write("                        <button id=\"submitSignup\" class=\"btn btn-lg bttn btn_block\" >Sign up</button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"tac margin1 centerBtnDisplay\">\r\n");
      out.write("                        <button id=\"cancelSignup\" class=\"btn btn-lg bttn btn_block \">Cancel</button>\r\n");
      out.write("                    </div>\r\n");
      out.write("             </div>\r\n");
      out.write("         </div>\r\n");
      out.write("\r\n");
      out.write("        </div><!-- /card-container -->\r\n");
      out.write("    </div><!-- /container -->\r\n");
      out.write("\t\r\n");
      out.write("       <div w3-include-html=\"../libraries/script.html\"></div>\r\n");
      out.write("\r\n");
      out.write("        <script src=\"http://www.w3schools.com/lib/w3data.js\"></script>\r\n");
      out.write("  \r\n");
      out.write("      <link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"/resources/demos/style.css\">\r\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-1.12.4.js\"></script>\r\n");
      out.write("        <script src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\r\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script src=\"../assets/js/bootbox.min.js\"></script>\r\n");
      out.write("        \r\n");
      out.write("<!--        <script src=\"../css/datePicker lib/picker.js\"></script>\r\n");
      out.write("    <script src=\"../css/datePicker lib/picker.date.js\"></script>\r\n");
      out.write("    <script src=\"../css/datePicker lib/legacy.js\"></script>-->\r\n");
      out.write("\r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("        w3IncludeHTML();\r\n");
      out.write("//       $(document).ready( function(){\r\n");
      out.write("           \r\n");
      out.write("//           $('#PMIbday').pickadate({\r\n");
      out.write("//             format: 'yyyy-mm-dd',\r\n");
      out.write("//            labelMonthNext: 'Go to the next month',\r\n");
      out.write("//            labelMonthPrev: 'Go to the previous month',\r\n");
      out.write("//            labelMonthSelect: 'Pick a month from the dropdown',\r\n");
      out.write("//            labelYearSelect: 'Pick a year from the dropdown',\r\n");
      out.write("//            selectMonths: true,\r\n");
      out.write("//            selectYears: true\r\n");
      out.write("//            });\r\n");
      out.write("           \r\n");
      out.write("           \r\n");
      out.write("//         $('#PMIbday').datepicker({dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true}); \r\n");
      out.write("           \r\n");
      out.write("    \r\n");
      out.write("            $(\"#submitSignup\").on(\"click\", function(){\r\n");
      out.write("            \r\n");
      out.write("               signup();\r\n");
      out.write("               \r\n");
      out.write("           });//on clcik submitSignup\r\n");
      out.write("           \r\n");
      out.write("           $(\"#cancelSignup\").on(\"click\", function(){\r\n");
      out.write("               \r\n");
      out.write("               window.location = \"../mainMenu.jsp\";\r\n");
      out.write("                              \r\n");
      out.write("           });//on clcik submitSignup\r\n");
      out.write("           \r\n");
      out.write("           \r\n");
      out.write("            function signup() {\r\n");
      out.write("                var useric,userid,username,usergender,usernationality,useremail,userphoneno,\r\n");
      out.write("                        useroccupation, userpassword,userbirthday;\r\n");
      out.write("                        \r\n");
      out.write("                useric = $(\"#inputUserIC\").val();\r\n");
      out.write("                userid = $(\"#inputUserID\").val();\r\n");
      out.write("                username = $(\"#inputUserName\").val();\r\n");
      out.write("                usergender = $(\"input[name='gender']:checked\").val();\r\n");
      out.write("                usernationality = $(\"#Usernational\").val();\r\n");
      out.write("                useremail = $(\"#inputUserEmail\").val();\r\n");
      out.write("                userphoneno = $(\"#inputUserPhoneNo\").val();\r\n");
      out.write("                userpassword = $(\"#inputUserPassword\").val();\r\n");
      out.write("                userbirthday = $(\"#txt_year\").val() + \"/\" + $(\"#txt_month\").val() + \"/\" + $(\"#txt_day\").val();\r\n");
      out.write("                useroccupation = $(\"#inpuOccupation\").val();\r\n");
      out.write("//                    var reN = /[0-9]/, reSA = /[a-z]/,reCA = /[A-Z]/;\r\n");
      out.write("        \r\n");
      out.write("                    if (useric === \"\") {\r\n");
      out.write("                        bootbox.alert(\"Fill in the User IC\");\r\n");
      out.write("                        $(\"#inputUserIC\").focus();\r\n");
      out.write("                    }else if (userid === \"\") {\r\n");
      out.write("                        bootbox.alert(\"Fill in the User ID\");\r\n");
      out.write("                        $(\"#inputUserID\").focus();\r\n");
      out.write("                    }else if (username === \"\") {\r\n");
      out.write("                        bootbox.alert(\"Fill in the User Name\");\r\n");
      out.write("                        $(\"#inputUserName\").focus();\r\n");
      out.write("                    }else if (containsNumber(username)) {\r\n");
      out.write("                        bootbox.alert(\"UnValic Name, Contain Numbers\");\r\n");
      out.write("                        $(\"#inputUserName\").focus();\r\n");
      out.write("                    }else if (!$(\"input[name='gender']:checked\").val()) {\r\n");
      out.write("                        bootbox.alert(\"Select Gender\");\r\n");
      out.write("                        $(\"input[name='gender']\").focus();\r\n");
      out.write("                    }else if (usernationality === null) {\r\n");
      out.write("                        bootbox.alert(\"Select Nationality\");\r\n");
      out.write("                        $(\"#Usernational\").focus();\r\n");
      out.write("                    }else if (useroccupation === \"\") {\r\n");
      out.write("                        bootbox.alert(\"Fill in user Occupation\");\r\n");
      out.write("                        $(\"#inpuOccupation\").focus();\r\n");
      out.write("                    }else if (useremail === \"\") {\r\n");
      out.write("                        bootbox.alert(\"Fill in user Email\");\r\n");
      out.write("                        $(\"#inputUserEmail\").focus();\r\n");
      out.write("                        $(\"#inputUserEmail\").css(\"color\", \"red\");\r\n");
      out.write("                    }else if (!validateEmail(useremail)) {\r\n");
      out.write("                        bootbox.alert(\"Uncorrect Email input\");\r\n");
      out.write("                        $(\"#inputUserEmail\").focus();\r\n");
      out.write("                    }else if (userphoneno.length < 10 ) {\r\n");
      out.write("                        bootbox.alert(\"Phone Number Is Not Complete at least 10 numbers\");\r\n");
      out.write("                    }else if (!$.isNumeric(userphoneno)) {\r\n");
      out.write("                        bootbox.alert(\"Not A Phone Number\");\r\n");
      out.write("                        $(\"#inputUserPhoneNo\").focus();\r\n");
      out.write("                    }else if (userpassword === \"\") {\r\n");
      out.write("                        bootbox.alert(\"Fill in the User Password\");\r\n");
      out.write("                        $(\"#inputUserPassword\").focus();\r\n");
      out.write("                    }else if (validPassword(userpassword)) {\r\n");
      out.write("                      \r\n");
      out.write("//                        var splitBday = String(userbirthday).split(\"-\");\r\n");
      out.write("//                        console.log(splitBday);\r\n");
      out.write("//                        var convertedBday = splitBday[2] + \"/\" + splitBday[1] + \"/\" + splitBday[0];\r\n");
      out.write("//                        console.log(convertedBday);\r\n");
      out.write("                        var bioData = {\r\n");
      out.write("                        'userIC': useric,\r\n");
      out.write("                        'userID': userid,\r\n");
      out.write("                        'userName': username,\r\n");
      out.write("                        'userNationality': usernationality,\r\n");
      out.write("                        'userGender': usergender,\r\n");
      out.write("                        'userOccupation': useroccupation,\r\n");
      out.write("                        'userEmail': useremail,\r\n");
      out.write("                        'userPhoneNo': userphoneno,\r\n");
      out.write("                        'userbirthday': convertedBday };\r\n");
      out.write("                    \r\n");
      out.write("                        var loginData = {\r\n");
      out.write("                        'userID': userid,\r\n");
      out.write("                        'userPassword': userpassword\r\n");
      out.write("                        };\r\n");
      out.write("                        console.log(bioData);\r\n");
      out.write("                        console.log(loginData);\r\n");
      out.write("                        $.ajax({\r\n");
      out.write("                            type: \"POST\",\r\n");
      out.write("                            url: \"../Controller/insertPatient.jsp\",\r\n");
      out.write("                            data: bioData,\r\n");
      out.write("                            timeout: 3000,\r\n");
      out.write("                            success: function (data){\r\n");
      out.write("                                console.log(data.trim());\r\n");
      out.write("                                $(\"#inputUserIC\").val(\"\");\r\n");
      out.write("                                $(\"#inputUserID\").val(\"\");\r\n");
      out.write("                                $(\"#inputUserName\").val(\"\");\r\n");
      out.write("                                $(\"#UserGender\").val(\"null\");\r\n");
      out.write("                                $(\"#Usernational\").val(\"null\");\r\n");
      out.write("                                $(\"#inpuOccupation\").val(\"\");\r\n");
      out.write("                                $(\"#inputUserEmail\").val(\"\");\r\n");
      out.write("                                $(\"#inputUserPhoneNo\").val(\"\");\r\n");
      out.write("                                $(\"#inputUserPassword\").val(\"\");\r\n");
      out.write("                                $(\"#PMIbday\").val(\"\");\r\n");
      out.write("                                //var num = parseInt(data);\r\n");
      out.write("                                if (data.search(\"Existed\") >= 0)\r\n");
      out.write("                                {\r\n");
      out.write("                                    bootbox.alert(\"Record Already Existed\");\r\n");
      out.write("                                } else {\r\n");
      out.write("                                    loginInser(loginData);\r\n");
      out.write("                                }\r\n");
      out.write("                            },\r\n");
      out.write("                            error: function (err) {\r\n");
      out.write("                                    console.log(err);\r\n");
      out.write("                            }\r\n");
      out.write("                        });\r\n");
      out.write("                }\r\n");
      out.write("\r\n");
      out.write("               };\r\n");
      out.write("               \r\n");
      out.write("               function loginInser(loginData)\r\n");
      out.write("               {\r\n");
      out.write("                    $.ajax({\r\n");
      out.write("                                    type: \"POST\",\r\n");
      out.write("                                    url: \"../Controller/insertPatientLoginInfo.jsp\",\r\n");
      out.write("                                    data: loginData,\r\n");
      out.write("                                    timeout: 3000,\r\n");
      out.write("                                    success: function (data){\r\n");
      out.write("                                       console.log(data.trim()); \r\n");
      out.write("                                    },\r\n");
      out.write("                                    error: function (err) {\r\n");
      out.write("                                    console.log(err);\r\n");
      out.write("                                    }  \r\n");
      out.write("                                });\r\n");
      out.write("               };\r\n");
      out.write("                function containsNumber(any){    \r\n");
      out.write("                    var alpha = /^[a-zA-Z-,]+(\\s{0,1}[a-zA-Z-, ])*$/; //for sentence allow space\r\n");
      out.write("                    //var re = /^[A-Za-z]+$/; for one word only don't allow space\r\n");
      out.write("                    if(alpha.test(any))//contain no number\r\n");
      out.write("                       return false;\r\n");
      out.write("                    else               //comtain number\r\n");
      out.write("                      return true;      \r\n");
      out.write("                 };\r\n");
      out.write("                 \r\n");
      out.write("                 function validateEmail(email)\r\n");
      out.write("                 {\r\n");
      out.write("//                     returns true if email is not correct\r\n");
      out.write("                     var re = /^(([^<>()\\[\\]\\.,;:\\s@\\\"]+(\\.[^<>()\\[\\]\\.,;:\\s@\\\"]+)*)|(\\\".+\\\"))@(([^<>()[\\]\\.,;:\\s@\\\"]+\\.)+[^<>()[\\]\\.,;:\\s@\\\"]{2,})$/i;\r\n");
      out.write("                     \r\n");
      out.write("                      return re.test(email);\r\n");
      out.write("                 };\r\n");
      out.write("                 \r\n");
      out.write("                 \r\n");
      out.write("                 function validPassword(password)\r\n");
      out.write("                 {\r\n");
      out.write("                    var re = /[0-9]/; //contain no number\r\n");
      out.write("                    if(!re.test(password)) {\r\n");
      out.write("                      bootbox.alert(\"Error: password must contain at least one number (0-9)!\");\r\n");
      out.write("                      $(\"#inputUserPassword\").focus();\r\n");
      out.write("                      return false;\r\n");
      out.write("                    }\r\n");
      out.write("                    re = /[a-z]/;   //contain no small alphbet \r\n");
      out.write("                    if(!re.test(password)) {\r\n");
      out.write("                      bootbox.alert(\"Error: password must contain at least one lowercase letter (a-z)!\");\r\n");
      out.write("                      $(\"#inputUserPassword\").focus();\r\n");
      out.write("                      return false;\r\n");
      out.write("                    }\r\n");
      out.write("//                    re = /[A-Z]/;   //contain no capital alphbet \r\n");
      out.write("//                    if(!re.test(password)) {\r\n");
      out.write("//                      bootbox.alert(\"Error: password must contain at least one uppercase letter (A-Z)!\");\r\n");
      out.write("//                      $(\"#inputUserPassword\").focus();\r\n");
      out.write("//                      return false;\r\n");
      out.write("//                    } \r\n");
      out.write("//                    \r\n");
      out.write("//                    if(password.length <8) {\r\n");
      out.write("//                      bootbox.alert(\"Error: password must contain at least 8 Charachters!\");\r\n");
      out.write("//                      $(\"#inputUserPassword\").focus();\r\n");
      out.write("//                      return false;\r\n");
      out.write("//                    } \r\n");
      out.write("                     return true;\r\n");
      out.write("                 };\r\n");
      out.write("           \r\n");
      out.write("//       });\r\n");
      out.write("        \r\n");
      out.write("    </script>\r\n");
      out.write("      \r\n");
      out.write("\r\n");
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
