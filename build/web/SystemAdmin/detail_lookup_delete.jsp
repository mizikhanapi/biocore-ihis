<%-- 
    Document   : detail_lookup_delete
    Created on : Jan 26, 2017, 12:27:04 PM
    Author     : user
--%>

<%@page import="ADM_helper.MySession"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Conn conn = new Conn();
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String user_id = (String) session.getAttribute("USER_ID");
    String hfc_99 = (String) session.getAttribute("HFC_99");
    MySession mys = new MySession(user_id, hfc_99);
    
    String detailCode = request.getParameter("detailCode");
    String masterCode = request.getParameter("masterCode");
    
   
    String sqlSelect = "select detail_reference_code, description from adm_lookup_detail a "
            + "join adm_health_facility b on a.Detail_Reference_code = b.district_cd or a.detail_reference_code = b.town_cd or a.detail_reference_code = b.state_cd "
            + "WHERE detail_reference_code = '"+detailCode+"' AND master_reference_code='"+masterCode+"' AND hfc_cd = '"+hfc_cd+"'  limit 1";

    ArrayList<ArrayList<String>> dataUse = conn.getData(sqlSelect);
    
    
    String sqlSelectPMS = "select pb.`PATIENT_NAME` "
            + "from adm_lookup_detail ld "
            + "join pms_patient_biodata pb on ld.`Detail_Reference_code`=pb.`TITLE_CODE` or ld.`Detail_Reference_code`=pb.`ID_TYPE` or ld.`Detail_Reference_code`=pb.`ELIGIBILITY_CATEGORY_CODE` "
            + "or ld.`Detail_Reference_code`=pb.`ELIGIBILITY_TYPE_CODE` or ld.`Detail_Reference_code`=pb.`SEX_CODE` or ld.`Detail_Reference_code`=pb.`MARITAL_STATUS_CODE` or ld.`Detail_Reference_code`=pb.`RACE_CODE` "
            + "or ld.`Detail_Reference_code`=pb.`NATIONALITY` or ld.`Detail_Reference_code`=pb.`RELIGION_CODE` or ld.`Detail_Reference_code`=pb.`BLOOD_TYPE` or ld.`Detail_Reference_code`=pb.`BLOOD_RHESUS_CODE` "
            + "or ld.`Detail_Reference_code`=pb.`HOME_DISTRICT_CODE` or ld.`Detail_Reference_code`=pb.`HOME_TOWN_CODE` or ld.`Detail_Reference_code`=pb.`HOME_POSTCODE` or ld.`Detail_Reference_code`=pb.`HOME_STATE_CODE` "
            + "or ld.`Detail_Reference_code`=pb.`HOME_COUNTRY_CODE` or ld.`Detail_Reference_code`=pb.`POSTAL_DISTRICT_CODE` or ld.`Detail_Reference_code`=pb.`POSTAL_TOWN_CODE` or ld.`Detail_Reference_code`=pb.`POSTAL_POSTCODE` "
            + "or ld.`Detail_Reference_code`=pb.`POSTAL_STATE_CODE` or ld.`Detail_Reference_code`=pb.`POSTAL_COUNTRY_CODE` or ld.`Detail_Reference_code`=pb.payer_group or ld.`Detail_Reference_code`=pb.person_type "
            + "where ld.detail_reference_code='"+detailCode+"' and ld.`Master_Reference_code`='"+masterCode+"' and ld.hfc_cd='"+hfc_cd+"' limit 1;";
    
    ArrayList<ArrayList<String>> dataUsePMS = conn.getData(sqlSelectPMS);
    
    String sqlMaster="Select source_indicator from adm_lookup_master where master_reference_code='"+masterCode+"' limit 1;";
    ArrayList<ArrayList<String>> dataImportant = conn.getData(sqlMaster);
    
    String source="";
    if(dataImportant.size()>0){
        source=dataImportant.get(0).get(0);
    }

    if (dataUse.size() > 0) {

        out.print("You can't delete this item because it is referrenced by Health Facility");

    }
    else if(dataUsePMS.size()>0){
        out.print("You can't delete this item because it is referenced by patient biodata");
    }
    else if(source.equalsIgnoreCase("IMPORTANT") && !mys.isSuperUser()){
        out.print("This item cannot be modified because it is used by the system.");
    }
    else {
        RMIConnector rmic = new RMIConnector();
        String sql = "DELETE FROM adm_lookup_detail WHERE master_reference_code = '" + masterCode + "' AND detail_reference_code = '" + detailCode + "' AND hfc_cd = '"+hfc_cd+"'";

        boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (status == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }


%>
