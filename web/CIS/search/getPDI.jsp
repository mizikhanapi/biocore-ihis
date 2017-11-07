<%-- 
    Document   : searchPatient
    Created on : Feb 10, 2017, 5:48:50 PM
    Author     : -D-
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>

<%
    Conn conn = new Conn();
    String pmiNo = request.getParameter("pmiNo");
    String episodeDate = request.getParameter("episodeDate");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String my_1_user_id = (String) session.getAttribute("USER_ID");
//    String pmiNo = "9504050251851";
    String PDI = "";
    String IdType = "-";
    String gender = "-";
    String race = "-";
    String maritialStatus = "-";
    String religion = "-";
    String nationality = "-";
    String homeTown = "-";
    String district = "-";
    String state = "-";
    String country = "-";

    String sqlPatient = " select PMI_NO,PATIENT_NAME,NEW_IC_NO,OLD_IC_NO,ID_TYPE,ID_NO,ELIGIBILITY_CATEGORY_CODE,ELIGIBILITY_TYPE_CODE,BIRTH_DATE,SEX_CODE,MARITAL_STATUS_CODE, RACE_CODE,"
            + "NATIONALITY,RELIGION_CODE,HOME_ADDRESS,HOME_DISTRICT_CODE,HOME_TOWN_CODE,HOME_POSTCODE,HOME_STATE_CODE,HOME_COUNTRY_CODE,HOME_PHONE,MOBILE_PHONE,"
            + "EMAIL_ADDRESS FROM pms_patient_biodata  WHERE pmi_no ='" + pmiNo + "'";
    ArrayList<ArrayList<String>> dataPDI = conn.getData(sqlPatient);

    String sqlIdType = "select `Description`  from adm_lookup_detail where `Master_Reference_code` = '0012' and `Detail_Reference_code` = '" + dataPDI.get(0).get(4) + "' group by description";
    ArrayList<ArrayList<String>> descIDType = conn.getData(sqlIdType);

    String sqlGender = "select `Description`  from adm_lookup_detail where `Master_Reference_code` = '0041' and `Detail_Reference_code` = '" + dataPDI.get(0).get(9) + "' group by description";
    ArrayList<ArrayList<String>> descsqlGender = conn.getData(sqlGender);

    String sqlrace = "select `Description`  from adm_lookup_detail where `Master_Reference_code` = '0004' and `Detail_Reference_code` = '" + dataPDI.get(0).get(3) + "' group by description";
    ArrayList<ArrayList<String>> descsqlrace = conn.getData(sqlrace);

    String sqlmaritialStatus = "select `Description`  from adm_lookup_detail where `Master_Reference_code` = '0006' and `Detail_Reference_code` = '" + dataPDI.get(0).get(10) + "' group by description";
    ArrayList<ArrayList<String>> descsqlmaritialStatus = conn.getData(sqlmaritialStatus);

    String sqlreligion = "select `Description`  from adm_lookup_detail where `Master_Reference_code` = '0005' and `Detail_Reference_code` = '" + dataPDI.get(0).get(13) + "' group by description";
    ArrayList<ArrayList<String>> descsqlreligion = conn.getData(sqlreligion);

    String sqlnationality = "select `Description`  from adm_lookup_detail where `Master_Reference_code` = '0011' and `Detail_Reference_code` = '" + dataPDI.get(0).get(12) + "' group by description";
    ArrayList<ArrayList<String>> descsqlnationality = conn.getData(sqlnationality);

    String sqlhomeTown = "select `Description`  from adm_lookup_detail where `Master_Reference_code` = '0003' and `Detail_Reference_code` = '" + dataPDI.get(0).get(16) + "' group by description";
    ArrayList<ArrayList<String>> descsqlhomeTown = conn.getData(sqlhomeTown);

    String sqldistrict = "select `Description`  from adm_lookup_detail where `Master_Reference_code` = '0078' and `Detail_Reference_code` = '" + dataPDI.get(0).get(15) + "' group by description";
    ArrayList<ArrayList<String>> descdistrict = conn.getData(sqldistrict);

    String sqlstate = "select `Description`  from adm_lookup_detail where `Master_Reference_code` = '0002' and `Detail_Reference_code` = '" + dataPDI.get(0).get(18) + "' group by description";
    ArrayList<ArrayList<String>> descstate = conn.getData(sqlstate);

    String sqlcountry = "select `Description`  from adm_lookup_detail where `Master_Reference_code` = '0001' and `Detail_Reference_code` = '" + dataPDI.get(0).get(19) + "' group by description";
    ArrayList<ArrayList<String>> desccountry = conn.getData(sqlcountry);
    if (descIDType.size() > 0) {
        if (dataPDI.get(0).get(0).equals("-")) {
            IdType = "-";
        } else {
            IdType = descIDType.get(0).get(0);
        }
    } else {
        IdType = "-";
    }

    if (descsqlGender.size() > 0) {
        if (descsqlGender.get(0).get(0).equals("-")) {
            gender = "-";
        } else {

            gender = descsqlGender.get(0).get(0);
        }
    } else {
        gender = "-";
    }

    if (descsqlrace.size() > 0) {
        if (descsqlrace.get(0).get(0).equals("-")) {
            race = "-";
        } else {

            race = descsqlrace.get(0).get(0);
        }
    } else {
        race = "-";
    }

    if (descsqlmaritialStatus.size() > 0) {
        if (descsqlmaritialStatus.get(0).get(0).equals("-")) {
            maritialStatus = "-";
        } else {
            maritialStatus = descsqlmaritialStatus.get(0).get(0);
        }
    } else {
        maritialStatus = "-";
    }

    if (descsqlreligion.size() > 0) {
        if (descsqlreligion.get(0).get(0).equals("-")) {
            religion = "-";
        } else {

            religion = descsqlreligion.get(0).get(0);
        }

    } else {
        religion = "-";
    }

    if (descsqlnationality.size() > 0) {
        if (descsqlnationality.get(0).get(0).equals("-")) {
            nationality = "-";
        } else {
            nationality = descsqlnationality.get(0).get(0);
        }
    } else {
        nationality = "-";
    }

    if (descsqlhomeTown.size() > 0) {
        if (descsqlhomeTown.get(0).get(0).equals("-")) {
            homeTown = "-";
        } else {

            homeTown = descsqlhomeTown.get(0).get(0);
        }
    } else {
        homeTown = "-";
    }

    if (descdistrict.size() > 0) {
        if (descdistrict.get(0).get(0).equals("-")) {
            district = "-";
        } else {

            district = descdistrict.get(0).get(0);
        }
    } else {
        district = "-";
    }

    if (descstate.size() > 0) {
        if (descstate.get(0).get(0).equals("-")) {
            state = "-";
        } else {

            state = descstate.get(0).get(0);
        }
    } else {
        state = "-";
    }

    if (desccountry.size() > 0) {
        if (desccountry.get(0).get(0).equals("-")) {
            country = "-";
        } else {

            country = desccountry.get(0).get(0);
        }
    } else {
        country = "-";
    }

    String PDI1 = "PDI|" + dataPDI.get(0).get(0) + "|" + dataPDI.get(0).get(1) + "|" + dataPDI.get(0).get(2) + "|" + dataPDI.get(0).get(3) + "|012^" + IdType + "^" + dataPDI.get(0).get(4) + "|" + dataPDI.get(0).get(5) + "|041^" + gender + "^" + dataPDI.get(0).get(9) + "|" + dataPDI.get(0).get(8);
    String PDI2 = "|004^" + race + "^" + dataPDI.get(0).get(3) + "|006^" + maritialStatus + "^" + dataPDI.get(0).get(10) + "|005^" + religion + "" + dataPDI.get(0).get(13) + "|011^" + nationality + "^" + dataPDI.get(0).get(12) + "|" + dataPDI.get(0).get(14) + "|||003^" + homeTown + "^" + dataPDI.get(0).get(16);
    String PDI3 = "|088^" + district + "^" + dataPDI.get(0).get(15) + "|002^" + state + "^" + dataPDI.get(0).get(18) + "|001^" + country + "^" + dataPDI.get(0).get(19) + "|" + dataPDI.get(0).get(17) + "|" + dataPDI.get(0).get(20) + "||" + dataPDI.get(0).get(21) + "|" + dataPDI.get(0).get(22) + "|<cr>\n";

    PDI = PDI1 + PDI2 + PDI3;
//    for (int i = 0; i < dataPDI.get(0).size(); i++) {
//        out.print(i + " - - " + dataPDI.get(0).get(i));
//%> <%
//    }
//    
//    out.print(PDI + "\n");
    out.print(PDI);

////Insert PMS data to table calling System
    
    String sqlPMS = "SELECT pe.`HEALTH_FACILITY_CODE`,pe.`DISCIPLINE_CODE`,pe.`SUBDISCIPLINE_CODE`,pe.`PMI_NO`,pe.`NAME`,ppq.queue_no,ppq.queue_name,pe.`EPISODE_DATE` FROM pms_episode pe,pms_patient_queue ppq WHERE pe.`EPISODE_DATE`=ppq.episode_date AND ppq.pmi_no = '"+pmiNo+"' AND ppq.episode_date = '"+episodeDate+"' GROUP BY ppq.episode_date";
    ArrayList<ArrayList<String>> dataPMS = conn.getData(sqlPMS);
    RMIConnector rmic = new RMIConnector();
    
    String room = "SELECT ROOM_NO FROM adm_users WHERE USER_ID = '"+my_1_user_id+"'";
    ArrayList<ArrayList<String>> room1 = conn.getData(room);
    try
    {
     String sqlInsert = "INSERT INTO qcs_calling_system_queue(cs_hfc_cd,cs_discipline,cs_sub_discipline,cs_pmi_no,cs_patient_name,cs_queue_no,cs_queue_name,cs_datetime,cs_callingtime,cs_room_no) VALUES ('"+dataPMS.get(0).get(0)+"','"+dataPMS.get(0).get(1)+"','"+dataPMS.get(0).get(2)+"','"+dataPMS.get(0).get(3)+"','"+dataPMS.get(0).get(4)+"','"+dataPMS.get(0).get(5)+"','"+dataPMS.get(0).get(6)+"','"+dataPMS.get(0).get(7)+"','2','"+room1.get(0).get(0)+"')";
     rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    }
    catch(Exception e)
    {
     //error handling code
    }
    
%>