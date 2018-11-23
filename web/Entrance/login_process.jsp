<%-- 
    Document   : login_process
    Created on : 14042018
    Author     : user
--%>


<%@page import="org.json.JSONObject"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page import="ADM_helper.MySession"%>
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
    final int NOT_LOGOUT = 4;
    int status = 0;

    Conn conn = new Conn();

    String user_id = request.getParameter("userID");
    String password = request.getParameter("password");
    String user_group = request.getParameter("user_group");
    String user_ic = "";

    if (request.getParameter("userIC") != null) {

        user_ic = request.getParameter("userIC");
        user_id = session.getAttribute("TEMP_ID").toString();

    }

    //password = EncryptUtils.getEncryptText(password);
    //                       0           1      2           3                   4                   5                               6                           7               8                   9      
    String sql = "Select user_id, password, user_name, health_facility_code, hfc_name, ifnull(convert(picture using utf8), ''), ifnull(login_status, '0'), new_icno, ifnull(user_status, ''), user_type "
            + "from adm_users LEFT Join adm_health_facility on health_facility_code = hfc_cd "
            + "where user_id = '" + user_id + "' AND status = '0' AND user_group='" + user_group + "' "
            + "and now() between start_date AND end_date "
            + "limit 1";

    ArrayList<ArrayList<String>> dataStaff = conn.getData(sql);

    //Use json
    JSONObject json = new JSONObject();

//    out.print(dataPatient.size());
//    out.print(dataStaff.size());
    if (dataStaff.size() > 0) // login Staff (admin, nurse, doctor)
    {

        if (dataStaff.get(0).get(1).equals(password)) {

            if (dataStaff.get(0).get(6).equals("1")) {

                if ("".equals(user_ic)) {
                     session.setAttribute("TEMP_ID", user_id);
                    
                    json.put("isRedirect", true);
                    json.put("msg", "You have logged in to another PC or you did not log out properly");
                    json.put("url", "ReSign-in");
                    out.print(json.toString());

                    return;
                } else if (!dataStaff.get(0).get(7).equals(user_ic)) {

                    //out.print(NOT_LOGOUT);
                    json.put("isRedirect", false);
                    json.put("msg", "Wrong NRIC/Passport number!");
                    json.put("url", "ReSign-in");
                    out.print(json.toString());

                    return;
                }

            }

            //must get hfc code first
            String hfc_cd = "";
            hfc_cd = dataStaff.get(0).get(3);

            MySession mys = new MySession();
            RMIConnector rmic = new RMIConnector();
            String query = "";

            /*Setting session id to check whether the same ID is used on other web browser. 
            Session ID is randomize. Previous ID will not be the same with the next generated ID.*/
            String sessionID = dataStaff.get(0).get(8); //getting the previous ID.
            String newSessionID = "";

            do {
                newSessionID = mys.getRandomSessionID();

            } while (sessionID.equalsIgnoreCase(newSessionID));

            //if tenant users, process differently
            if ("TENANT".equals(dataStaff.get(0).get(9))) {
                String user_name, user_type, proPic, tenant_name;

                user_name = dataStaff.get(0).get(2);
                user_type = "TENANT";
                proPic = "".equalsIgnoreCase(dataStaff.get(0).get(5)) ? "../assets/profile.jpg" : dataStaff.get(0).get(5);
                tenant_name = "???";
                if (!"???".equals(hfc_cd)) {
                    //get the tenant name from database
                    query = "SELECT tnt_name FROM adm_tenant WHERE tnt_cd='" + hfc_cd + "' limit 1;";
                    ArrayList<ArrayList<String>> arrTenant = conn.getData(query);
                    if (arrTenant.size() > 0) {
                        tenant_name = arrTenant.get(0).get(0);
                    }
                }

                //set the session for tenant
                session.setAttribute(MySessionKey.USER_ID, user_id);
                session.setAttribute(MySessionKey.USER_NAME, user_name);
                session.setAttribute(MySessionKey.USER_TYPE, user_type);
                session.setAttribute(MySessionKey.USER_PICTURE, proPic);
                session.setAttribute(MySessionKey.TENANT_CD, hfc_cd);
                session.setAttribute(MySessionKey.TENANT_NAME, tenant_name);
                session.setAttribute(MySessionKey.USER_GROUP, user_group);

                json.put("isRedirect", true);
                json.put("url", "../TMS/Home");
                out.print(json.toString());

                session.setAttribute("SESSION_ID", newSessionID); // saving the session ID into session object

                session.removeAttribute("TEMP_ID");

                query = "Update adm_users set login_status = '1', user_status='" + newSessionID + "' where user_id = '" + user_id + "'"; //Update the session ID in user_status and update login_status.

                rmic.setQuerySQL(conn.HOST, conn.PORT, query);

                return;
            }

            //if not tenant and hfc name is null, return user not found
            if (!"TENANT".equals(dataStaff.get(0).get(9)) && dataStaff.get(0).get(4) == null) {
                json.put("isRedirect", false);
                json.put("msg", "User ID does not exist");
                out.print(json.toString());
                return;
            }

            //                                 0        1           2                  3                        4            
            String sqlUserAccess = "Select user_id, a.role_code, a.discipline_code, a.subdiscipline_code, system_code, role_name "
                    + "from adm_user_access_role a "
                    + "join adm_responsibility res using(role_code) "
                    + "join adm_role r using(role_code) "
                    + "where user_id = '" + user_id + "' AND a.status = '0' "
                    + "AND a.health_facility_code = '" + hfc_cd + "' AND res.health_facility_code = '" + hfc_cd + "' AND r.hfc_cd = '" + hfc_cd + "' "
                    + "AND a.role_code <> '-x-' limit 1";
            ArrayList<ArrayList<String>> dataUserAccess = conn.getData(sqlUserAccess);

            if (dataUserAccess.size() > 0) {

                //hfc_cd was taken out; original position was before hfc_name
                String user_name, proPic, hfc_name, discipline_code, subdiscipline_code, role_code, role_name, system_code, module_code, page_code;

                user_name = dataStaff.get(0).get(2);
                proPic = dataStaff.get(0).get(5);

                if (proPic.equalsIgnoreCase("")) {
                    proPic = "../assets/profile.jpg";
                }
//                hfc_cd = dataStaff.get(0).get(3);
                hfc_name = dataStaff.get(0).get(4);

                discipline_code = dataUserAccess.get(0).get(2);
                subdiscipline_code = dataUserAccess.get(0).get(3);
                role_code = dataUserAccess.get(0).get(1);
                role_name = dataUserAccess.get(0).get(5);
                system_code = dataUserAccess.get(0).get(4);

                String sqlModule = "Select distinct(module_code) from adm_responsibility where role_code = '" + role_code + "' AND status = '0' "
                        + "AND health_facility_code = '" + hfc_cd + "'";
                ArrayList<ArrayList<String>> dataModule = conn.getData(sqlModule);

                ArrayList<String> modules = new ArrayList<String>();

                for (int i = 0; i < dataModule.size(); i++) {

                    modules.add(dataModule.get(i).get(0));
                }

                module_code = String.join("|", modules);

                String sqlPage = "Select page_code from adm_responsibility where role_code = '" + role_code + "' AND status = '0' "
                        + "AND health_facility_code = '" + hfc_cd + "'";
                ArrayList<ArrayList<String>> dataPage = conn.getData(sqlPage);

                ArrayList<String> pages = new ArrayList<String>();

                for (int i = 0; i < dataPage.size(); i++) {

                    pages.add(dataPage.get(i).get(0));
                }

                page_code = String.join("|", pages);

                //-------------- getting cis param -------------------
                String sqlCIS = "Select param_code from cis_clinic_param where hfc_cd ='" + hfc_cd + "' and user_id ='-x-' and enable ='1'";
                ArrayList<ArrayList<String>> dataCIS = conn.getData(sqlCIS);

                String CISLongString = "";

                if (dataCIS.size() > 0) {
                    ArrayList<String> CISparams = new ArrayList<String>();

                    for (int i = 0; i < dataCIS.size(); i++) {
                        CISparams.add(dataCIS.get(i).get(0));
                    }

                    CISLongString = String.join("|", CISparams);
                }

                //===================================================
                //-------------- getting PMS param -----------------
                String sql4 = "select status from adm_system_parameter where system_code = 'IT' and parameter_code ='1' and hfc_cd='" + hfc_cd + "';";
                ArrayList<ArrayList<String>> dataSysPara = conn.getData(sql4);
                String sysParaIT = "1";
                if (dataSysPara.size() > 0) {
                    sysParaIT = dataSysPara.get(0).get(0);
                }
                //==================================================

                //-------------- getting CS param -----------------
                String sql99 = "select status from adm_system_parameter where system_code = 'CS' and parameter_code ='2' and hfc_cd='" + hfc_cd + "';";
                ArrayList<ArrayList<String>> dataSysParacs = conn.getData(sql99);
                String sysParaCS = "1";
                if (dataSysParacs.size() > 0) {
                    sysParaCS = dataSysPara.get(0).get(0);
                }
                //==================================================
                
                
                //-------------- getting PIS param -----------------
                String sql5 = "select status from adm_system_parameter where system_code = 'PISS' and parameter_code ='1' and hfc_cd='"+hfc_cd+"';";
                ArrayList<ArrayList<String>> dataPISPara = conn.getData(sql5);
                String PISParaPISS = "1";
                if(dataPISPara.size()>0){
                    PISParaPISS = dataPISPara.get(0).get(0);
                }
                //==================================================
                
                //-------------- getting CIS Fast param -----------------
                String sql6 = "select status from adm_system_parameter where system_code = '02' and parameter_code ='FASTTRACK' and hfc_cd='"+hfc_cd+"';";
                ArrayList<ArrayList<String>> dataCISFastPara = conn.getData(sql6);
                String CISParaFAST = "1";
                if(dataCISFastPara.size()>0){
                    CISParaFAST = dataCISFastPara.get(0).get(0);
                }
                //==================================================            

                //setting the session;
                session.setAttribute("USER_ID", user_id);
                session.setAttribute("USER_NAME", user_name);
                session.setAttribute("PICTURE", proPic);

                session.setAttribute("HEALTH_FACILITY_CODE", hfc_cd);
                session.setAttribute("HFC_NAME", hfc_name);

                session.setAttribute("ROLE_CODE", role_code);
                session.setAttribute("ROLE_NAME", role_name);
                session.setAttribute("SYSTEM_CODE", system_code);
                session.setAttribute("CS_PARAM", sysParaCS);
                session.setAttribute("MODULE_CODE", module_code);
                session.setAttribute("PAGE_CODE", page_code);

                //session.setAttribute("OCCUPATION_CODE", title);
                session.setAttribute("DISCIPLINE_CODE", discipline_code);

                session.setAttribute("SUB_DISCIPLINE_CODE", subdiscipline_code);

                //--- setting parameters for PMS and CIS
                String dataSystemStatus = "1";
                //session.setAttribute("HFC", hfc);
                session.setAttribute("SYSTEMSTAT", dataSystemStatus);

                session.setAttribute("SYSTEM_PARAMETER", sysParaIT);
                
                session.setAttribute("PIS_PARAM", PISParaPISS);
                session.setAttribute("CIS_FAST_PARAM", CISParaFAST);

                session.setAttribute("CIS_PARAM", CISLongString);
                session.setAttribute("USER_TYPE", "STAFF");

                //==========================================
                status = LOGIN;

                session.setAttribute("SESSION_ID", newSessionID); // saving the session ID into session object

                session.removeAttribute("TEMP_ID");

                query = "Update adm_users set login_status = '1', user_status='" + newSessionID + "' where user_id = '" + user_id + "'"; //Update the session ID in user_status and update login_status.

                rmic.setQuerySQL(conn.HOST, conn.PORT, query);

            } else {

                status = CONFIGURE;

            }

        } else {
            status = WRONG_PASSWORD;
        }

    } else {
        status = NO_USER;
    }

    switch (status) {
        case LOGIN:
            json.put("isRedirect", true);
            json.put("url", "Home");
            break;
        case CONFIGURE:
            json.put("isRedirect", false);
            json.put("msg", "You don't have proper user access. Contact your admin to configure your user access");
            break;
        case WRONG_PASSWORD:
            json.put("isRedirect", false);
            json.put("msg", "Wrong password.");
            break;
        case NO_USER:
            json.put("isRedirect", false);
            json.put("msg", "User ID does not exist");
            break;
        default:
            json.put("isRedirect", false);
            json.put("msg", "Something went wrong. Please try again later");
            break;

    }

    out.print(json.toString());

%>

