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
    String isAlreadyRegister = "select a.queue_name from pms_queue_name a left join wis_inpatient_episode b on( a.queue_name = b.ward_id) where (a.hfc_cd = '" + hfc + "' and b.ward_id = '" + wname + "');";
    ArrayList<ArrayList<String>> alreadyRegis = conn.getData(isAlreadyRegister);

    if (alreadyRegis.size() > 0) {
        out.print("Success");
//out.print(queue_now);
    } else {
         out.print("Failed");
      
    }

%>
