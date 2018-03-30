<%-- 
    Document   : getMenuList
    Created on : Mar 29, 2018, 7:55:09 PM
    Author     : user
--%>

<%@page import="ADM_helper.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    String role_cd = request.getParameter("role_cd");
    String page_cd = request.getParameter("page_cd");
    String module_cd = request.getParameter("module_cd");

    Conn con = new Conn();

    Menu menu = new Menu(hfc_cd, role_cd);
    
    //                          0           1               2           3               4
    String query = "SELECT me.menu_cd, me.menu_name, me.menu_level, me.parent_cd, rd.status "
            + "FROM adm_responsibility_detail rd "
            + "JOIN adm_menu me ON me.module_cd=rd.module_cd AND me.page_cd=rd.page_cd AND me.menu_cd=rd.menu_cd "
            + "WHERE me.status='0' AND me.menu_level=1 AND rd.hfc_cd='" + hfc_cd + "' AND rd.role_cd='" + role_cd + "' AND rd.module_cd='" + module_cd + "' AND rd.page_cd='" + page_cd + "';";

    ArrayList<ArrayList<String>> arrMenu = con.getData(query);

    StringBuilder htmlTable = new StringBuilder();

    htmlTable.append("<table class=\"table table-striped table-bordered\" cellspacing=\"0\" width=\"100%\">");
    htmlTable.append("<thead>");
    htmlTable.append("<tr>");
    htmlTable.append("<th>Code</th>");
    htmlTable.append("<th>Name</th>");
    htmlTable.append("<th>Level</th>");
    htmlTable.append("<th>Status</th>");
    htmlTable.append("<th>Action</th>");
    htmlTable.append("</tr>");
    htmlTable.append("</thead>");
    htmlTable.append("<tbody>");

    for (ArrayList<String> arrTemp : arrMenu) {
        String status = "<span class='text-primary'>Enabled</span>";
        String disabled_1 ="";
        String disabled_2 ="";
        if(!"0".equals(arrTemp.get(4))){
            status = "<span class='text-danger'>Disabled</span>";
            disabled_2 = "disabled";
        }
        else{
            disabled_1 = "disabled";
        }
        htmlTable.append("<tr>");
        htmlTable.append("<td>"+arrTemp.get(0)+"</td>");
        htmlTable.append("<td>"+arrTemp.get(1)+"</td>");
        htmlTable.append("<td>"+arrTemp.get(2)+"</td>");
        htmlTable.append("<td>"+status+"</td>");
        htmlTable.append("<td>");
        htmlTable.append("<input type='hidden' id='MENU_hidden' value='"+String.join("|", arrTemp)+"'>");
        htmlTable.append("<div style=\"display:inline-block; vertical-align: middle;\">");
        htmlTable.append("<button id='MENU_btnEnable' class='btn btn-success' title='Enable Menu' "+disabled_1+"><i class='fa fa-check-circle'></i></button> ");
        htmlTable.append("<button id='MENU_btnDisable' class='btn btn-danger' title='Disable Menu' "+disabled_2+"><i class='fa fa-minus-circle'></i></button>");
        htmlTable.append("</div>");
        htmlTable.append("</td>");
        htmlTable.append("</tr>");
        String parent_cd = arrTemp.get(0);
        int level = Integer.parseInt(arrTemp.get(2)) + 1;
        htmlTable.append(menu.printHTMLChild(parent_cd, level, module_cd, page_cd).toString());

    }
    htmlTable.append("</tbody>");
    htmlTable.append("</table>");
    
    out.print(htmlTable.toString());


%>
