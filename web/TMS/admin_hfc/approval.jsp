<%-- 
    Document   : approval
    Created on : Apr 15, 2018, 10:27:03 PM
    Author     : user
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="org.json.JSONObject"%>
<%@page import="ADM_helper.Emailer"%>
<%@page import="ADM_helper.MySession"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user_id = request.getParameter("user_id");
    String hfc_cd = request.getParameter("hfc_cd");
    String email = request.getParameter("email");
    String status = request.getParameter("status");
    String hfc_name = request.getParameter("hfc_name");
    String user_name = request.getParameter("user_name");

    String query = "UPDATE adm_health_facility SET hfc_status='" + status + "' WHERE hfc_cd='" + hfc_cd + "';";
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();

    boolean isUpdate = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    String jMsg = "";

    if (isUpdate) {
        if ("0".equals(status)) {
            
            String timestamp = new Timestamp(System.currentTimeMillis()).toString();
            
            //create discipline, subdiscipline, assign discipline
            query = "INSERT INTO adm_discipline values('001', 'Outpatient', '', '', '', '"+user_id+"', now(), '0', '"+hfc_cd+"' )";
            rmi.setQuerySQL(con.HOST, con.PORT, query);
            
            query = "INSERT INTO adm_subdiscipline values('001', '001', 'Outpatient', '', '"+user_id+"', now(), '0', '"+hfc_cd+"')";
            rmi.setQuerySQL(con.HOST, con.PORT, query);
            
            query = "INSERT INTO adm_hfc_discipline(hfc_cd, discipline_cd, subdiscipline_cd, created_by, created_date, hfc_discipline_status) "
                    +"VALUES('"+hfc_cd+"', '001', '001', '"+user_id+"', now(), '0')";
            rmi.setQuerySQL(con.HOST, con.PORT, query);
            
            //create user
            MySession temp_mys = new MySession(user_id, hfc_cd);
            String adminID= temp_mys.getAdminID();
            String adminPwd= temp_mys.getRandomSessionID();
            query = "INSERT INTO adm_users (user_id, health_facility_code, user_name, password, occupation_code, birth_date, sex_code, new_icno, home_phone, office_phone, mobile_phone, fax_no, email, id_category_code, start_date, end_date, title, nationality_code, user_type, user_group, user_classification_code, status, created_by, created_date, mother_name, room_no, picture, login_status, user_status) "+
                            "VALUES('"+adminID+"', '"+hfc_cd+"', '"+hfc_cd+" Admin', '"+adminPwd+"', '001', now(), '001', '"+adminID+"', '', '', '', '', '"+email+"', '', '"+timestamp+"', '9999-12-31 00:00:00', '002', '001', 'STAFF', '', '', '0', '"+user_id+"', now(), '-', '01', '', '0', '0')";
            rmi.setQuerySQL(con.HOST, con.PORT, query);
            
            //assign role to user
            query = "Insert into adm_user_access_role(user_id, discipline_code, subdiscipline_code, health_facility_code, role_code, `STATUS`) "
                    + "values('"+adminID+"', '001', '001', '"+hfc_cd+"', '001', '0')";
            rmi.setQuerySQL(con.HOST, con.PORT, query);
            
            String em_msg ="<h3>Good day dear "+user_name+"!</h3>"
                    + "<br/></br>"
                    + "<p>We are glad to inform you that the registration of "+hfc_name+" is approved!</p>"
                    + "<p>Below are the details of the User ID to log into the health facility.</p>"
                    + "<p>  User ID: "+adminID+"</p>"
                    + "<p>  Password: "+adminPwd+"</p>"
                    + "<p>  User IC: "+adminID+"</p>"
                    + "<p>  Mother's Name: -</p>"
                    + "<br/><p>It is advisable for you to change the password later. Enjoy!</p>";
            Emailer emailer = new Emailer(email, "Health Facility Registration Approval", em_msg);
            emailer.sendTextEmail();
            jMsg ="Approval success! A notification email is sent to "+email;
            
            // clone data
            String copyLookup = "INSERT INTO adm_lookup_detail(Master_Reference_code, Detail_Reference_code, Description, priority_indicator, start_date, end_date, status, created_by, created_date, hfc_cd) "
                    + "Select Master_Reference_code, Detail_Reference_code, Description, priority_indicator, start_date, end_date, status, '" + user_id + "', now(), '" + hfc_cd + "' "
                    + "from adm_lookup_detail where hfc_cd = '99_iHIS_99'";

            String copyRole = "insert into adm_role(role_code, role_name, status, created_by, created_date, hfc_cd) "
                    + "select role_code, role_name, status, '" + user_id + "', now(), '" + hfc_cd + "' "
                    + "from adm_role where hfc_cd = '99_iHIS_99'";

            String copyResponsibility = "insert into adm_responsibility(role_code, system_code, module_code, page_code, health_facility_code, status, created_by, created_date) "
                    + "select role_code, system_code, module_code, page_code, '" + hfc_cd + "', status, '" + user_id + "', now() from adm_responsibility "
                    + "WHERE health_facility_code = '99_iHIS_99'";

//            String copyRIS_BS = "Insert into ris_body_system(hfc_cd, modality_cd, body_system_cd, body_system_name, discipline_cd, subdiscipline_cd, created_by, created_date, status) "
//                    + "Select '" + hfc_cd + "', modality_cd, body_system_cd, body_system_name, '001', '001', '" + user_id + "', now(), '0' "
//                    + "from ris_body_system where hfc_cd = '99_iHIS_99'; ";
//
//            String copyRIS_modality = "Insert into ris_modality(hfc_cd, modality_cd, modality_name, discipline_cd, subdiscipline_cd, created_by, created_date, status) "
//                    + "Select '" + hfc_cd + "', modality_cd, modality_name, '001', '001', '" + user_id + "', now(), '0' "
//                    + "from ris_modality where hfc_cd = '99_iHIS_99';";
//
//            String copyRIS_procedure = "insert into ris_procedure_master(hfc_cd, clinical_discipline_cd, body_system_cd, modality_cd, ris_procedure_cd, ris_procedure_name, discipline_cd, subdiscipline_cd, selling_price, buying_price, quantity, created_by, created_date, status) "
//                    + "select '" + hfc_cd + "', clinical_discipline_cd, body_system_cd, modality_cd, ris_procedure_cd, ris_procedure_name, '001', '001', selling_price, buying_price, quantity, '" + user_id + "', now(), '0' "
//                    + "from ris_procedure_master WHERE hfc_cd = '99_iHIS_99';";
//
//            String copyCISPro = "insert into cis_procedure(`PROCEDURE_CD`, `PROCEDURE_NAME`, `STATUS`, hfc_cd, selling_price, buying_price) "
//                    + "select `PROCEDURE_CD`, `PROCEDURE_NAME`, `STATUS`, '" + hfc_cd + "', selling_price, buying_price "
//                    + "from cis_procedure where hfc_cd='99_iHIS_99' ";
//
//            String copyCISPro1 = "insert into cis_procedure_1(`PROCEDURE_1_CD`, `PROCEDURE_1_NAME`, `PROCEDURE_CD`, status, hfc_cd) "
//                    + "select `PROCEDURE_1_CD`, `PROCEDURE_1_NAME`, `PROCEDURE_CD`, `STATUS`, '" + hfc_cd + "' "
//                    + "from cis_procedure_1 where hfc_cd='99_iHIS_99'";
//
//            String copyCISPro2 = "INSERT INTO cis_procedure_2(`PROCEDURE_2_CD`, `PROCEDURE_2_NAME`, `PROCEDURE_1_CD`, `STATUS`, hfc_cd) "
//                    + "select `PROCEDURE_2_CD`, `PROCEDURE_2_NAME`, `PROCEDURE_1_CD`, `STATUS`, '" + hfc_cd + "' "
//                    + "from cis_procedure_2 where hfc_cd='99_iHIS_99'";
//
//            String lis_item_category1 = "INSERT INTO lis_item_category(`category_code`, `category_name`, `status`, hfc_cd)"
//                    + "select `category_code`, `category_name`, `status`, '" + hfc_cd + "' "
//                    + "from lis_item_category where hfc_cd='99_iHIS_99'";
//
//            String lis_item_category2 = "INSERT INTO lis_item_detail(`item_cd`, `item_name`, `test_cat`, spe_source, spe_container, volume, special_inst, status, buy_price, ser_price, hfc_cd) "
//                    + "select `item_cd`, `item_name`, `test_cat`, spe_source, spe_container, volume, special_inst, status, buy_price, ser_price, '" + hfc_cd + "'"
//                    + "from lis_item_detail where hfc_cd='99_iHIS_99'";
//
//            String copyOT_category = "INSERT INTO opt_procedure_category(hfc_cd, category_cd, category_name, created_by, created_date, status) "
//                    + "Select '" + hfc_cd + "', category_cd, category_name, '" + user_id + "', now(), '0' from opt_procedure_category "
//                    + "where hfc_cd='99_iHIS_99';";
//
//            String copyOT_procedure = "INSERT INTO opt_procedure(hfc_cd, category_cd, procedure_cd, `procedure_shortName`, `procedure_longName`, quantity, buying_price, selling_price, status, created_by, created_date) "
//                    + "Select '" + hfc_cd + "', category_cd, procedure_cd, `procedure_shortName`, `procedure_longName`, quantity, buying_price, selling_price, '0', '" + user_id + "', now()  from opt_procedure "
//                    + "where hfc_cd='99_iHIS_99';";

            rmi.setQuerySQL(con.HOST, con.PORT, copyLookup);
            rmi.setQuerySQL(con.HOST, con.PORT, copyRole);
            rmi.setQuerySQL(con.HOST, con.PORT, copyResponsibility);
//            rmi.setQuerySQL(con.HOST, con.PORT, copyRIS_BS);
//            rmi.setQuerySQL(con.HOST, con.PORT, copyRIS_modality);
//            rmi.setQuerySQL(con.HOST, con.PORT, copyRIS_procedure);
//            rmi.setQuerySQL(con.HOST, con.PORT, copyCISPro);
//            rmi.setQuerySQL(con.HOST, con.PORT, copyCISPro1);
//            rmi.setQuerySQL(con.HOST, con.PORT, copyCISPro2);
//            rmi.setQuerySQL(con.HOST, con.PORT, lis_item_category1);
//            rmi.setQuerySQL(con.HOST, con.PORT, lis_item_category2);
//            rmi.setQuerySQL(con.HOST, con.PORT, copyOT_category);
//            rmi.setQuerySQL(con.HOST, con.PORT, copyOT_procedure);
        }
        else{
            String em_msg ="<h3>Good day dear "+user_name+"!</h3>"
                    + "<br/></br>"
                    + "<p>We are sorry to inform you that the registration of "+hfc_name+" is rejected!</p>";
            Emailer emailer = new Emailer(email, "Health Facility Registration Rejection", em_msg);
            emailer.sendTextEmail();
            jMsg ="Registration is rejected! A notification email is sent to "+email;
        }
    }
    else{
        jMsg="Oops! Something went wrong!";
    }
    
    JSONObject json = new JSONObject();
    json.put("msg", jMsg);
    json.put("isValid", isUpdate);
    out.print(json.toString());
%>