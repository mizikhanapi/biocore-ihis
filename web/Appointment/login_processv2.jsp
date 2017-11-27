<%-- 
    Document   : login_process
    Created on : Mar 28, 2016, 10:46:43 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="SHA.PasswordSHA"%>

<%@page import="ADM_helper.MySession"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="java.sql.*"%>

<%
    Conn Conn = new Conn();
    PasswordSHA hash = new PasswordSHA();

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    String hashPassword = hash.getHashPassword(password);
    //                                  0          1               2                3               4               5       6           7           8           9           10
    String sql_check_user = "SELECT `USER_ID`,`PASSWORD`,`HEALTH_FACILITY_CODE`,`USER_NAME`,`OCCUPATION_CODE`,`PICTURE`,`USER_TYPE`,`NEW_ICNO`, `SEX_CODE`,`MOBILE_PHONE`,`EMAIL` FROM adm_users WHERE `USER_ID` = '" + username + "';";
    ArrayList<ArrayList<String>> data_check_user = Conn.getData(sql_check_user);

    if (data_check_user.size() > 0) {

        if (data_check_user.get(0).get(6).equals("PUBLIC")) {
            if (data_check_user.get(0).get(1).equals(password)) {

                session.setAttribute("USER_ID", data_check_user.get(0).get(0));
                session.setAttribute("USER_NAME", data_check_user.get(0).get(3));
                session.setAttribute("PICTURE", data_check_user.get(0).get(5));
                session.setAttribute("IC_NO", data_check_user.get(0).get(7));
                session.setAttribute("MOBILE_PHONE", data_check_user.get(0).get(9));
                session.setAttribute("EMAIL", data_check_user.get(0).get(10));
                session.setAttribute("USER_TYPE", data_check_user.get(0).get(6));

                //                                      0       1               2           3              4              5              6                7                 8               9                 10                11                            
                String sql_patient_detail = " SELECT `ID_NO`,`BIRTH_DATE`,`RACE_CODE`,`NATIONALITY`,`RELIGION_CODE`,`BLOOD_TYPE`,`HOME_ADDRESS`,`HOME_DISTRICT_CODE`,`HOME_TOWN_CODE`,`HOME_POSTCODE`,`HOME_STATE_CODE`,`HOME_COUNTRY_CODE`, PMI_NO "
                        + "FROM pms_patient_biodata WHERE `PATIENT_NAME` = '"+data_check_user.get(0).get(3)+"';";
                ArrayList<ArrayList<String>> data_patient_detail = Conn.getData(sql_patient_detail);

//                String sql_race_code = "SELECT `Description` FROM adm_lookup_detail WHERE `Detail_Reference_code` = '" + data_patient_detail.get(0).get(2) + "' AND `Master_Reference_code` = '0004' AND hfc_cd = '99_iHIS_99';";
//                String sql_nationality = "SELECT `Description` FROM adm_lookup_detail WHERE `Detail_Reference_code` = '" + data_patient_detail.get(0).get(3) + "' AND `Master_Reference_code` = '0011' AND hfc_cd = '99_iHIS_99';";
//                String sql_religion = "SELECT `Description` FROM adm_lookup_detail WHERE `Detail_Reference_code` = '" + data_patient_detail.get(0).get(4) + "' AND `Master_Reference_code` = '0005' AND hfc_cd = '99_iHIS_99';";
//                String sql_blood_type = "SELECT `Description` FROM adm_lookup_detail WHERE `Detail_Reference_code` = '" + data_patient_detail.get(0).get(5) + "' AND `Master_Reference_code` = '0074' AND hfc_cd = '99_iHIS_99';";
//                String sql_district = "SELECT `Description` FROM adm_lookup_detail WHERE `Detail_Reference_code` = '" + data_patient_detail.get(0).get(7) + "' AND `Master_Reference_code` = '0078' AND hfc_cd = '99_iHIS_99';";
//                String sql_town = "SELECT `Description` FROM adm_lookup_detail WHERE `Detail_Reference_code` = '" + data_patient_detail.get(0).get(8) + "' AND `Master_Reference_code` = '0003' AND hfc_cd = '99_iHIS_99';";
//                String sql_state = "SELECT `Description` FROM adm_lookup_detail WHERE `Detail_Reference_code` = '" + data_patient_detail.get(0).get(10) + "' AND `Master_Reference_code` = '0002' AND hfc_cd = '99_iHIS_99';";
//                String sql_country = "SELECT `Description` FROM adm_lookup_detail WHERE `Detail_Reference_code` = '" + data_patient_detail.get(0).get(0) + "' AND `Master_Reference_code` = '0001' AND hfc_cd = '99_iHIS_99';";
//
////                ArrayList<ArrayList<String>> data_race = Conn.getData(sql_race_code);
////                ArrayList<ArrayList<String>> data_nationality = Conn.getData(sql_nationality);
////                ArrayList<ArrayList<String>> data_religion = Conn.getData(sql_religion);
////                ArrayList<ArrayList<String>> data_blood_type = Conn.getData(sql_blood_type);
////                ArrayList<ArrayList<String>> data_district = Conn.getData(sql_district);
////                ArrayList<ArrayList<String>> data_town = Conn.getData(sql_town);
////                ArrayList<ArrayList<String>> data_state = Conn.getData(sql_state);
////                ArrayList<ArrayList<String>> data_country = Conn.getData(sql_country);
////                String patient_detail = data_patient_detail.get(0).get(0) + "-|-" + data_patient_detail.get(0).get(1)
////                        + "-|-" + data_race.get(0).get(0) + "-|-" +data_nationality.get(0).get(0)  + "-|-" + data_religion.get(0).get(0)
////                        + "-|-" + data_blood_type.get(0).get(0)  + "-|-" + data_district.get(0).get(0) + "-|-" + data_town.get(0).get(0)
////                        + "-|-" + data_state.get(0).get(0)  + "-|-" + data_country.get(0).get(0) + "-|-" + data_patient_detail.get(0).get(6)
////                        + "-|-" + data_patient_detail.get(0).get(9)  + "-|-" + data_patient_detail.get(0).get(12);
////                
                session.setAttribute("PATIENT_DETAIL", data_patient_detail.get(0));
                session.setAttribute("ID_NO", data_patient_detail.get(0).get(0));

                session.setAttribute("PMI_NO", data_patient_detail.get(0).get(12));

                out.print("|SUCCESS-PUBLIC-LOGIN|");

            } else {
                out.print("|INCORRECT-PASSWORD|");
            }

        } else {
            final int NO_USER = 0;
            final int WRONG_PASSWORD = 1;
            final int LOGIN = 2;
            final int CONFIGURE = 3;
            final int NOT_LOGOUT = 4;
            int status = 0;

            Conn conn = new Conn();


            String user_ic = "";

            if (request.getParameter("userIC") != null) {

                user_ic = request.getParameter("userIC");
                username = session.getAttribute("TEMP_ID").toString();

            }

            //password = EncryptUtils.getEncryptText(password);
            //                       0           1      2           3                   4                   5                               6                           7               8
            String sql = "Select user_id, password, user_name, health_facility_code, hfc_name, ifnull(convert(picture using utf8), ''), ifnull(login_status, '0'), new_icno, ifnull(user_status, '') from adm_users "
                    + "Join adm_health_facility on health_facility_code = hfc_cd "
                    + "where user_id = '" + username + "' AND status = '0' "
                    + "and now() between start_date AND end_date "
                    + "limit 1";

            ArrayList<ArrayList<String>> dataStaff = conn.getData(sql);

//    out.print(dataPatient.size());
//    out.print(dataStaff.size());
            if (dataStaff.size() > 0) // login Staff (admin, nurse, doctor)
            {

                if (dataStaff.get(0).get(1).equals(password)) {

                    if (dataStaff.get(0).get(6).equals("1")) {

                        if (!dataStaff.get(0).get(7).equals(user_ic)) {

                            session.setAttribute("TEMP_ID", username);

                            out.print(NOT_LOGOUT);

                            return;
                        }

                    }

                    //must get hfc code first
                    String hfc_cd = "";
                    hfc_cd = dataStaff.get(0).get(3);

                    //                                 0        1           2                  3                        4            
                    String sqlUserAccess = "Select user_id, a.role_code, a.discipline_code, a.subdiscipline_code, system_code, role_name "
                            + "from adm_user_access_role a "
                            + "join adm_responsibility res using(role_code) "
                            + "join adm_role r using(role_code) "
                            + "where user_id = '" + username + "' AND a.status = '0' "
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

                        //setting the session;
                        session.setAttribute("USER_ID", username);
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

                        session.setAttribute("CIS_PARAM", CISLongString);

                        //==========================================
                        status = LOGIN;

                        /*Setting session id to check whether the same ID is used on other web browser. 
                Session ID is randomize. Previous ID will not be the same with the next generated ID.*/
                        String sessionID = dataStaff.get(0).get(8); //getting the previous ID.
                        String newSessionID = "";

                        MySession mys = new MySession();

                        do {
                            newSessionID = mys.getRandomSessionID();

                        } while (sessionID.equalsIgnoreCase(newSessionID));

                        session.setAttribute("SESSION_ID", newSessionID); // saving the session ID into session object

                        session.removeAttribute("TEMP_ID");

                        RMIConnector rmic = new RMIConnector();

                        String query = "Update adm_users set login_status = '1', user_status='" + newSessionID + "' where user_id = '" + username + "'"; //Update the session ID in user_status and update login_status.

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

            out.print(status);

        }

    } else {
        out.print("|NO-ACCOUNT|");
    }


%>
