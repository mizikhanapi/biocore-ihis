<%-- 
    Document   : login_process2
    Created on : Mar 2, 2017, 6:43:23 PM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>

<%@page import="main.RMIConnector"%>

<%
    final int NO_USER = 0;
    final int WRONG_PASSWORD = 1;
    final int LOGIN = 2;
    final int CONFIGURE = 3;
    int status = 0;

    Conn conn = new Conn();

    String user_id = request.getParameter("userID");
    String password = request.getParameter("password");

    //                       0           1      2           3                   4                   5
    String sql = "Select user_id, password, user_name, health_facility_code, hfc_name, ifnull(convert(picture using utf8), '') from adm_users "
            + "Join adm_health_facility on health_facility_code = hfc_cd "
            + "where user_id = '" + user_id + "' AND status = '0' limit 1";
    String sql4 = "select status from adm_system_parameter where system_code = 'IT' and parameter_code ='1';";
    
    ArrayList<ArrayList<String>> dataStaff = conn.getData(sql);
    ArrayList<ArrayList<String>> dataSysPara = conn.getData(sql4);

//    out.print(dataPatient.size());
//    out.print(dataStaff.size());
    if (dataStaff.size() > 0) // login Staff (admin, nurse, doctor)
    {

        if (dataStaff.get(0).get(1).equals(password)) {

            //                                 0        1           2                  3                        4            
            String sqlUserAccess = "Select user_id, a.role_code, a.discipline_code, a.subdiscipline_code, system_code, role_name from adm_user_access_role a "
                    + "join adm_responsibility using(role_code) join adm_role using(role_code) where user_id = '" + user_id + "' AND a.status = '0' limit 1";
            ArrayList<ArrayList<String>> dataUserAccess = conn.getData(sqlUserAccess);

            if (dataUserAccess.size() > 0) {

                String user_name, proPic, hfc_cd, hfc_name, discipline_code, subdiscipline_code, role_code, role_name, system_code, module_code, page_code;

                user_name = dataStaff.get(0).get(2);
                proPic = dataStaff.get(0).get(5);
                
                if(proPic.equalsIgnoreCase("")){
                    proPic = "../assets/profile.jpg";
                }
                hfc_cd = dataStaff.get(0).get(3);
                hfc_name = dataStaff.get(0).get(4);

                discipline_code = dataUserAccess.get(0).get(2);
                subdiscipline_code = dataUserAccess.get(0).get(3);
                role_code = dataUserAccess.get(0).get(1);
                role_name = dataUserAccess.get(0).get(5);
                system_code = dataUserAccess.get(0).get(4);

                String sqlModule = "Select distinct(module_code) from adm_responsibility where role_code = '" + role_code + "' AND status = '0'";
                ArrayList<ArrayList<String>> dataModule = conn.getData(sqlModule);

                ArrayList<String> modules = new ArrayList<String>();

                for (int i = 0; i < dataModule.size(); i++) {

                    modules.add(dataModule.get(i).get(0));
                }

                module_code = String.join("|", modules);

                String sqlPage = "Select page_code from adm_responsibility where role_code = '" + role_code + "' AND status = '0'";
                ArrayList<ArrayList<String>> dataPage = conn.getData(sqlPage);

                ArrayList<String> pages = new ArrayList<String>();

                for (int i = 0; i < dataPage.size(); i++) {

                    pages.add(dataPage.get(i).get(0));
                }

                page_code = String.join("|", pages);

                //setting the session;
                session.setAttribute("USER_ID", user_id);
                session.setAttribute("USER_NAME", user_name);
                session.setAttribute("PICTURE", proPic);

                session.setAttribute("HEALTH_FACILITY_CODE", hfc_cd);
                session.setAttribute("HFC_NAME", hfc_name);

                session.setAttribute("ROLE_CODE", role_code);
                session.setAttribute("ROLE_NAME", role_name);
                session.setAttribute("SYSTEM_CODE", system_code);
                session.setAttribute("MODULE_CODE", module_code);
                session.setAttribute("PAGE_CODE", page_code);

                //session.setAttribute("OCCUPATION_CODE", title);
                session.setAttribute("DISCIPLINE_CODE", discipline_code);

                session.setAttribute("SUB_DISCIPLINE_CODE", subdiscipline_code);

                 String dataSystemStatus = "1";
                //session.setAttribute("HFC", hfc);
                session.setAttribute("SYSTEMSTAT", dataSystemStatus);
                
                String sysParaIT = dataSysPara.get(0).get(0);
                session.setAttribute("SYSTEM_PARAMETER", sysParaIT);
                
                status = LOGIN;

            } else {

                status = CONFIGURE;

            }


        } else {
            status = WRONG_PASSWORD;
        }

    } else {
        status = NO_USER;
    }

    out.print(status);

%>

