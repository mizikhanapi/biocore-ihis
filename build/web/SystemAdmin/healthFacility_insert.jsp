<%-- 
    Document   : healthFacility_insert
    Created on : Feb 9, 2017, 4:19:34 PM
    Author     : user
--%>

<%@page import="Formatter.DateFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="controller/super_user_check.jsp"  %>
<%    Conn conn = new Conn();
    String hfcName = request.getParameter("hfcName");
    String hfcCode = request.getParameter("hfcCode");
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");
    String address3 = request.getParameter("address3");
    String state = request.getParameter("state");
    String district = request.getParameter("district");
    String town = request.getParameter("town");
    String postcode = request.getParameter("postcode");
    String faxNo = request.getParameter("faxNo");
    String telNo = request.getParameter("telNo");
    String email = request.getParameter("email");
    String contactPerson = request.getParameter("contactPerson");
    String ipNo = request.getParameter("IP_NO");
    String server = request.getParameter("server");
    String category = request.getParameter("category");
    String reportTo = request.getParameter("reportTo");
    String type = request.getParameter("type");
    String subtype = request.getParameter("subtype");
    String director = request.getParameter("director");
    String status = request.getParameter("status");
    String establishDate = request.getParameter("establishDate");
    String logo = request.getParameter("logo");

    String sqlCheck = "SELECT hfc_cd from adm_health_facility WHERE hfc_cd = '" + hfcCode + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    RMIConnector rmic = new RMIConnector();
    boolean isInsert = false;

    if (duplicate.size() > 0) {
        out.print("Sorry, the code "+hfcCode+" is already used. Please enter different code.");
    } else if (!establishDate.equalsIgnoreCase("")) {

        establishDate = DateFormatter.formatDate(establishDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");

        String sqlInsert = "INSERT INTO adm_health_facility(hfc_cd, hfc_type, hfc_name, address1, address2, address3, state_cd, district_cd, town_cd, country_cd, postcode, telephone_no, fax_no, email, hfc_server, hfc_report, established_date, director_name, hfc_category_cd, hfc_sub_type, contact_person, hfc_status, hfc_ip, logo) "
                + "VALUES('" + hfcCode + "', '" + type + "', '" + hfcName + "', '" + address1 + "', '" + address2 + "', '" + address3 + "', '" + state + "', '" + district + "', '" + town + "', '001', '" + postcode + "', '" + telNo + "', '" + faxNo + "', '" + email + "', '" + server + "', '" + reportTo + "', '" + establishDate + "', '" + director + "', '" + category + "', '" + subtype + "', '" + contactPerson + "', '" + status + "', '" + ipNo + "', '" + logo + "')";

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    } else if (establishDate.equalsIgnoreCase("")) {

        String sqlInsert = "INSERT INTO adm_health_facility(hfc_cd, hfc_type, hfc_name, address1, address2, address3, state_cd, district_cd, town_cd, country_cd, postcode, telephone_no, fax_no, email, hfc_server, hfc_report, director_name, hfc_category_cd, hfc_sub_type, contact_person, hfc_status, hfc_ip, logo) "
                + "VALUES('" + hfcCode + "', '" + type + "', '" + hfcName + "', '" + address1 + "', '" + address2 + "', '" + address3 + "', '" + state + "', '" + district + "', '" + town + "', '001', '" + postcode + "', '" + telNo + "', '" + faxNo + "', '" + email + "', '" + server + "', '" + reportTo + "', '" + director + "', '" + category + "', '" + subtype + "', '" + contactPerson + "', '" + status + "', '" + ipNo + "', '" + logo + "')";

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }

    if (isInsert) {
        String creator = session.getAttribute("USER_ID").toString();

        String copyLookup = "INSERT INTO adm_lookup_detail(Master_Reference_code, Detail_Reference_code, Description, priority_indicator, start_date, end_date, status, created_by, created_date, hfc_cd) "
                + "Select Master_Reference_code, Detail_Reference_code, Description, priority_indicator, start_date, end_date, status, '" + creator + "', now(), '" + hfcCode + "' "
                + "from adm_lookup_detail where hfc_cd = '99_iHIS_99'";

        String copyRole = "insert into adm_role(role_code, role_name, status, created_by, created_date, hfc_cd) "
                + "select role_code, role_name, status, '" + creator + "', now(), '" + hfcCode + "' "
                + "from adm_role where hfc_cd = '99_iHIS_99'";

        String copyResponsibility = "insert into adm_responsibility(role_code, system_code, module_code, page_code, health_facility_code, status, created_by, created_date) "
                + "select role_code, system_code, module_code, page_code, '" + hfcCode + "', status, '" + creator + "', now() from adm_responsibility "
                + "WHERE health_facility_code = '99_iHIS_99'";

        String copyRIS_BS = "Insert into ris_body_system(hfc_cd, modality_cd, body_system_cd, body_system_name, discipline_cd, subdiscipline_cd, created_by, created_date, status) "
                + "Select '" + hfcCode + "', modality_cd, body_system_cd, body_system_name, '001', '001', '" + creator + "', now(), '0' "
                + "from ris_body_system where hfc_cd = '99_iHIS_99'; ";

        String copyRIS_modality = "Insert into ris_modality(hfc_cd, modality_cd, modality_name, discipline_cd, subdiscipline_cd, created_by, created_date, status) "
                + "Select '" + hfcCode + "', modality_cd, modality_name, '001', '001', '" + creator + "', now(), '0' "
                + "from ris_modality where hfc_cd = '99_iHIS_99';";

        String copyRIS_procedure = "insert into ris_procedure_master(hfc_cd, clinical_discipline_cd, body_system_cd, modality_cd, ris_procedure_cd, ris_procedure_name, discipline_cd, subdiscipline_cd, selling_price, buying_price, quantity, created_by, created_date, status) "
                + "select '" + hfcCode + "', clinical_discipline_cd, body_system_cd, modality_cd, ris_procedure_cd, ris_procedure_name, '001', '001', selling_price, buying_price, quantity, '" + creator + "', now(), '0' "
                + "from ris_procedure_master WHERE hfc_cd = '99_iHIS_99';";

        String copyCISPro = "insert into cis_procedure(`PROCEDURE_CD`, `PROCEDURE_NAME`, `STATUS`, hfc_cd, selling_price, buying_price) "
                + "select `PROCEDURE_CD`, `PROCEDURE_NAME`, `STATUS`, '" + hfcCode + "', selling_price, buying_price "
                + "from cis_procedure where hfc_cd='99_iHIS_99' ";

        String copyCISPro1 = "insert into cis_procedure_1(`PROCEDURE_1_CD`, `PROCEDURE_1_NAME`, `PROCEDURE_CD`, status, hfc_cd) "
                + "select `PROCEDURE_1_CD`, `PROCEDURE_1_NAME`, `PROCEDURE_CD`, `STATUS`, '" + hfcCode + "' "
                + "from cis_procedure_1 where hfc_cd='99_iHIS_99'";

        String copyCISPro2 = "INSERT INTO cis_procedure_2(`PROCEDURE_2_CD`, `PROCEDURE_2_NAME`, `PROCEDURE_1_CD`, `STATUS`, hfc_cd) "
                + "select `PROCEDURE_2_CD`, `PROCEDURE_2_NAME`, `PROCEDURE_1_CD`, `STATUS`, '" + hfcCode + "' "
                + "from cis_procedure_2 where hfc_cd='99_iHIS_99'";

        String lis_item_category1 = "INSERT INTO lis_item_category(`category_code`, `category_name`, `status`, hfc_cd)"
                + "select `category_code`, `category_name`, `status`, '" + hfcCode + "' "
                + "from lis_item_category where hfc_cd='99_iHIS_99'";

        String lis_item_category2 = "INSERT INTO lis_item_detail(`item_cd`, `item_name`, `test_cat`, spe_source, spe_container, volume, special_inst, status, buy_price, ser_price, hfc_cd) "
                + "select `item_cd`, `item_name`, `test_cat`, spe_source, spe_container, volume, special_inst, status, buy_price, ser_price, '" + hfcCode + "'"
                + "from lis_item_detail where hfc_cd='99_iHIS_99'";
        
        String copyOT_category="INSERT INTO opt_procedure_category(hfc_cd, category_cd, category_name, created_by, created_date, status) "
                + "Select '"+hfcCode+"', category_cd, category_name, '"+creator+"', now(), '0' from opt_procedure_category "
                + "where hfc_cd='99_iHIS_99';";
        
        String copyOT_procedure="INSERT INTO opt_procedure(hfc_cd, category_cd, procedure_cd, `procedure_shortName`, `procedure_longName`, quantity, buying_price, selling_price, status, created_by, created_date) "
                + "Select '"+hfcCode+"', category_cd, procedure_cd, `procedure_shortName`, `procedure_longName`, quantity, buying_price, selling_price, '0', '"+creator+"', now()  from opt_procedure "
                + "where hfc_cd='99_iHIS_99';";
        

        rmic.setQuerySQL(conn.HOST, conn.PORT, copyLookup);
        rmic.setQuerySQL(conn.HOST, conn.PORT, copyRole);
        rmic.setQuerySQL(conn.HOST, conn.PORT, copyResponsibility);
        rmic.setQuerySQL(conn.HOST, conn.PORT, copyRIS_BS);
        rmic.setQuerySQL(conn.HOST, conn.PORT, copyRIS_modality);
        rmic.setQuerySQL(conn.HOST, conn.PORT, copyRIS_procedure);
        rmic.setQuerySQL(conn.HOST, conn.PORT, copyCISPro);
        rmic.setQuerySQL(conn.HOST, conn.PORT, copyCISPro1);
        rmic.setQuerySQL(conn.HOST, conn.PORT, copyCISPro2);
        rmic.setQuerySQL(conn.HOST, conn.PORT, lis_item_category1);
        rmic.setQuerySQL(conn.HOST, conn.PORT, lis_item_category2);
        rmic.setQuerySQL(conn.HOST, conn.PORT, copyOT_category);
        rmic.setQuerySQL(conn.HOST, conn.PORT, copyOT_procedure);
        

    }
%>