<%-- 
    Document   : registerqueue
    Created on : Jan 13, 2017, 10:53:48 AM
    Author     : shay
--%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String now = request.getParameter("now");
    String pmino = request.getParameter("pmino");
    String epiDate = request.getParameter("epiDate");
    String poic = request.getParameter("poic");
    String pid = request.getParameter("pid");
    String MRN = request.getParameter("MRN");
    String pname = request.getParameter("pname");
    String pnic = request.getParameter("pnic");
    String pidno = request.getParameter("pidno");
    String EliSource = request.getParameter("EliSource");
    String AdmissionType = request.getParameter("AdmissionType");
    String Refer = request.getParameter("Refer");
    String DocType = request.getParameter("DocType");
    String GL = request.getParameter("GL");
    String EliTy = request.getParameter("EliTy");
    String AdmissionReason = request.getParameter("AdmissionReason");
    String PoliceCase = request.getParameter("PoliceCase");
    String DocNo = request.getParameter("DocNo");
    String payer = request.getParameter("payer");
    String Dis = request.getParameter("Dis");
    String wname = request.getParameter("wname");
    String Deposit = request.getParameter("Deposit");
    String WardType = request.getParameter("WardType");
    String BedID = request.getParameter("BedID");
    String guardInd = request.getParameter("guardInd");
    String referNo = request.getParameter("referNo");
    String gruGuard = request.getParameter("gruGuard");
    String glExpDate = request.getParameter("glExpDate");
    String epiTime = request.getParameter("epiTime");
    String stat = request.getParameter("stat");
    String hfc = request.getParameter("hfc");
    String referHfc = "referHfc";
    String referDis = "referDis";
    String orderNo = request.getParameter("orderNo");
    String queueSql = "";
    String updateBed = "";
    String updateMaster = "";
    String updateDetail = "";
    String OrderStatus = request.getParameter("OrderStatus");

    String subDis = "sub Discipline";
    String patCat = "003";
    String visTy = "Visit Type";
    String emTy = "Emergency Type";
    String order = "Order By";
    String sub = request.getParameter("sub");

    String createdBy = request.getParameter("createdBy");

    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    Date dateobj = new Date();
    df.format(dateobj);
    Boolean regis, updBed, upMaster, upDetail;
    int queue_now = 0;
    int newQueueNo = 0;

    String insertEpisode = "";
    String insertEpisode2 = "";

    String isAlreadyRegister = "select pmi_no from wis_inpatient_episode where pmi_no = '" + pmino + "';";
    ArrayList<ArrayList<String>> alreadyRegis = conn.getData(isAlreadyRegister);

    if (alreadyRegis.size() > 0) {
        out.print("already");
//out.print(queue_now);
    } else {
        insertEpisode = "INSERT INTO wis_inpatient_episode(hfc_cd, pmi_no, episode_date, discipline_cd, subdiscipline_cd, "
                + "ward_class_code, ward_id, bed_id, patient_category_cd, visit_type_cd,"
                + "emergency_type_cd, eligibility_type_cd, eligibility_category_cd, referred_from_hfc, referred_from_discipline, referred_reference_no, order_by,"
                + "admission_reason, admission_description, guardian_ind, group_guardian,inpatient_status, created_by, created_date,"
                + "NEW_IC_NO, OLD_IC_NO, ID_TYPE, ID_NO, POLICE_CASE, PAYER_GROUP, gl_expiry_date, DEPOSIT_INPATIENT, DOCUMENT_TYPE, DOCUMENT_NO, PATIENT_NAME)"
                + "VALUES ('" + hfc + "','" + pmino + "','" + epiDate + "','" + Dis + "','" + sub + "',"
                + "'" + WardType + "','" + wname + "','" + BedID + "','" + patCat + "','" + visTy + "',"
                + "'" + emTy + "','" + EliTy + "','" + EliSource + "','" + referHfc + "','" + referDis + "','" + referNo + "','" + order + "',"
                + "'" + AdmissionType + "','" + AdmissionReason + "',"
                + "'" + guardInd + "','" + gruGuard + "','" + stat + "', '" + createdBy + "', now() ,"
                + "'" + pnic + "','" + poic + "','" + pid + "','" + pidno + "','" + PoliceCase + "','" + payer + "','" + GL + "','" + Deposit + "','" + DocType + "', '" + DocNo + "', '" + pname + "');";
        
        updateBed = "UPDATE wis_bed_id SET bed_status = 'Occupied' where hfc_cd ='" + hfc + "' and discipline_cd ='" + Dis + "' and bed_id ='" + BedID + "' ";
                 updateMaster = "UPDATE wis_order_master SET order_status = '1' where pmi_no ='" + pmino + "' and order_no ='" + orderNo + "'  ";
                  updateDetail = "UPDATE  wis_order_detail SET order_status = '1' where  order_no ='" + orderNo + "'  ";

//         System.out.println(orderNo);
//        if (OrderStatus.equals("NoOrder")) {
//
//            insertEpisode = "INSERT INTO wis_inpatient_episode(hfc_cd, pmi_no, episode_date, discipline_cd, subdiscipline_cd, "
//                    + "ward_class_code, ward_id, bed_id, patient_category_cd, visit_type_cd,"
//                    + "emergency_type_cd, eligibility_type_cd, eligibility_category_cd, referred_from_hfc, referred_from_discipline, referred_reference_no, order_by,"
//                    + "admission_reason, admission_description, guardian_ind, group_guardian,inpatient_status, created_by, created_date,"
//                    + "NEW_IC_NO, OLD_IC_NO, ID_TYPE, ID_NO, POLICE_CASE, PAYER_GROUP, gl_expiry_date, DEPOSIT_INPATIENT, DOCUMENT_TYPE, DOCUMENT_NO, PATIENT_NAME)"
//                    + "VALUES ('" + hfc + "','" + pmino + "','" + epiDate + "','" + Dis + "','" + sub + "',"
//                    + "'" + WardType + "','" + wname + "','" + BedID + "','" + patCat + "','" + visTy + "',"
//                    + "'" + emTy + "','" + EliTy + "','" + EliSource + "','" + referHfc + "','" + referDis + "','" + referNo + "','" + order + "',"
//                    + "'" + AdmissionType + "','" + AdmissionReason + "',"
//                    + "'" + guardInd + "','" + gruGuard + "','" + stat + "', '" + createdBy + "', now() ,"
//                    + "'" + pnic + "','" + poic + "','" + pid + "','" + pidno + "','" + PoliceCase + "','" + payer + "','" + GL + "','" + Deposit + "','" + DocType + "', '" + DocNo + "', '" + pname + "');";
//
//        } else if (OrderStatus.equals("YesOrder")) {
//            insertEpisode = "INSERT INTO wis_inpatient_episode(hfc_cd, pmi_no, episode_date, discipline_cd, subdiscipline_cd, "
//                    + "ward_class_code, ward_id, bed_id, patient_category_cd, visit_type_cd,"
//                    + "emergency_type_cd, eligibility_type_cd, eligibility_category_cd, referred_from_hfc, referred_from_discipline, referred_reference_no, order_by,"
//                    + "admission_reason, admission_description, guardian_ind, group_guardian,inpatient_status, created_by, created_date,"
//                    + "NEW_IC_NO, OLD_IC_NO, ID_TYPE, ID_NO, POLICE_CASE, PAYER_GROUP, gl_expiry_date, DEPOSIT_INPATIENT, DOCUMENT_TYPE, DOCUMENT_NO, PATIENT_NAME)"
//                    + "VALUES ('" + hfc + "','" + pmino + "','" + epiDate + "','" + Dis + "','" + sub + "',"
//                    + "'" + WardType + "','" + wname + "','" + BedID + "','" + patCat + "','" + visTy + "',"
//                    + "'" + emTy + "','" + EliTy + "','" + EliSource + "','" + referHfc + "','" + referDis + "','" + referNo + "','" + order + "',"
//                    + "'" + AdmissionType + "','" + AdmissionReason + "',"
//                    + "'" + guardInd + "','" + gruGuard + "','" + stat + "', '" + createdBy + "', now() ,"
//                    + "'" + pnic + "','" + poic + "','" + pid + "','" + pidno + "','" + PoliceCase + "','" + payer + "','" + GL + "','" + Deposit + "','" + DocType + "', '" + DocNo + "', '" + pname + "');";
//            updateBed = "UPDATE wis_bed_id SET bed_status = 'Occupied' where hfc_cd ='" + hfc + "' and discipline_cd ='" + Dis + "' and bed_id ='" + BedID + "' ";
//            updateMaster = "UPDATE wis_order_master SET order_status = '1' where pmi_no ='" + pmino + "' and order_no ='" + orderNo + "'  ";
//            updateDetail = "UPDATE  wis_order_detail SET order_status = '1' where  order_no ='" + orderNo + "'  ";
//        }
        regis = rmic.setQuerySQL(conn.HOST, conn.PORT, insertEpisode);
        updBed = rmic.setQuerySQL(conn.HOST, conn.PORT, updateBed);
         upMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, updateMaster);
          upDetail = rmic.setQuerySQL(conn.HOST, conn.PORT, updateDetail);
// && upDetail == true
//
        if ( regis == true && updBed == true && upMaster == true&& upDetail == true) {
            out.print("Success");
        } else {
            out.print("false");
            //out.print(insertEpisode);
        }

    }

%>
