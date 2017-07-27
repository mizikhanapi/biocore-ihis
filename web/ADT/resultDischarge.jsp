<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--    <input type="text" id="test">-->

<%

    Conn conn = new Conn();
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = new Date();
    String dateBill = dateFormat.format(date);
%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String disb = request.getParameter("Dis");
    String wnameb = request.getParameter("wname");
    String WardTypeb = request.getParameter("WardType");
    String EliSource = request.getParameter("EliSrc");
    String EliTy = request.getParameter("EliTy");
    String AdmTy = request.getParameter("AdmTy");
    String DocTy = request.getParameter("DocTy");
    String pmino = request.getParameter("pmino");
    String tWWC = request.getParameter("tWWC");
    String tWI = request.getParameter("tWI");
    String thfc_cd = request.getParameter("thfc_cd");

    String admissionDate = request.getParameter("admissionDate");

    String totaldays = "";

    String getDate = "SELECT DATEDIFF(now(),episode_date) AS days from wis_inpatient_episode where pmi_no = '" + pmino + "'";
    ArrayList<ArrayList<String>> datediff = conn.getData(getDate);
    for (int i = 0; i < datediff.size(); i++) {
        String days = datediff.get(i).get(0);
        totaldays = days;
%>  
<input   type="hidden" id="totalday"   value="<%=datediff.get(i).get(0)%>"  class="form-control input-md">   
<%
    }
    String totaltransferday = "";

    String gettransferDate = "SELECT DATEDIFF(encounter_date ,episode_date) AS days from wis_inpatient_episode_history where pmi_no = '" + pmino + "'";
    ArrayList<ArrayList<String>> datetransferdiff = conn.getData(gettransferDate);
    if (datetransferdiff.size() > 0) {
        for (int i = 0; i < datetransferdiff.size(); i++) {
            String transferdays = datetransferdiff.get(i).get(0);
            totaltransferday = transferdays;
%>  
<input   type="hidden" id="totaltransferday"   value="<%=datetransferdiff.get(i).get(0)%>"  class="form-control input-md">   

<%
    }

} else {

//                ArrayList<ArrayList<String>> datapnc;
//                datapnc = conn.getData(pnc);
//                
//                int sizepnc = datapnc.size();
//
//                for (int i = 0; i < sizepnc; i++) {
%>
<input   type="hidden" id="totaltransferday"   value="0"  class="form-control input-md">   
<%    }
    String totalelisource = "";

    String eliCat = "select Description from adm_lookup_detail where master_reference_code = '0063' and Detail_Reference_code ='" + EliSource + "' and hfc_cd ='" + hfc + "' ";
    ArrayList<ArrayList<String>> dataEliCat;

    dataEliCat = conn.getData(eliCat);
    for (int i = 0; i < dataEliCat.size(); i++) {
        String elisource = dataEliCat.get(i).get(0);
        totalelisource = elisource;

%>  
<input  type="hidden" id="totalelisource"   value="<%=dataEliCat.get(i).get(0)%>"  class="form-control input-md">   
<%
    }
    String totaleliTy = "";
    String eliTy = "select Description from adm_lookup_detail where master_reference_code = '0034' and Detail_Reference_code ='" + EliTy + "' and hfc_cd ='" + hfc + "' ";
    ArrayList<ArrayList<String>> dataeliTy;

    dataeliTy = conn.getData(eliTy);
    for (int i = 0; i < dataeliTy.size(); i++) {
        String deliTy = dataeliTy.get(i).get(0);
        totaleliTy = deliTy;

%>  
<input  type="hidden" id="totaleliTy"   value="<%=dataeliTy.get(i).get(0)%>"  class="form-control input-md">   
<%
    }
    String totalDis = "";
    String diss = "select discipline_name from adm_discipline where  discipline_cd ='" + disb + "'  and discipline_hfc_cd ='" + hfc + "'";
    ArrayList<ArrayList<String>> datadiss;

    datadiss = conn.getData(diss);
    for (int i = 0; i < datadiss.size(); i++) {
        String dtotalDis = datadiss.get(i).get(0);
        totalDis = dtotalDis;

%>  
<input  type="hidden" id="totaldis"   value="<%=datadiss.get(i).get(0)%>"  class="form-control input-md">   
<%
    }
    String wt = "";
    String wty = "select ward_class_name from wis_ward_class where  ward_class_code ='" + WardTypeb + "' and hfc_cd ='" + hfc + "' ";
    ArrayList<ArrayList<String>> datawty;

    datawty = conn.getData(wty);
    for (int i = 0; i < datawty.size(); i++) {
        String ddatawty = datawty.get(i).get(0);
        wt = ddatawty;

%>  
<input  type="hidden" id="totaldatawty"   value="<%=datawty.get(i).get(0)%>"  class="form-control input-md">   
<%
    }
    String wn = "";
    String wnme = "select ward_name from wis_ward_name where  ward_id ='" + wnameb + "' and hfc_cd ='" + hfc + "' ";
    ArrayList<ArrayList<String>> datawnme;

    datawnme = conn.getData(wnme);
    for (int i = 0; i < datawnme.size(); i++) {
        String ddatawnme = datawnme.get(i).get(0);
        wn = ddatawnme;

%>  
<input  type="hidden" id="totaldatawnme"   value="<%=datawnme.get(i).get(0)%>"  class="form-control input-md">   
<%
    }
    String dctyp = "";
    String dctype = "select Description from adm_lookup_detail where master_reference_code = '0023' and Detail_Reference_code ='" + DocTy + "' and hfc_cd ='" + hfc + "' ";
    ArrayList<ArrayList<String>> datadctype;

    datadctype = conn.getData(dctype);
    for (int i = 0; i < datadctype.size(); i++) {
        String ddatadctype = datadctype.get(i).get(0);
        dctyp = ddatadctype;

%>  
<input  type="hidden" id="datadctype"   value="<%=datadctype.get(i).get(0)%>"  class="form-control input-md">   
<%
    }
    String amt = "";
    String amty = "select Description from adm_lookup_detail where master_reference_code = '0023' and Detail_Reference_code ='" + DocTy + "' and hfc_cd ='" + hfc + "' ";
    ArrayList<ArrayList<String>> dataamty;

    dataamty = conn.getData(amty);
    for (int i = 0; i < dataamty.size(); i++) {
        String ddataamty = dataamty.get(i).get(0);
        amt = ddataamty;

%>  
<input  type="hidden" id="amtye"   value="<%=dataamty.get(i).get(0)%>"  class="form-control input-md">   
<%
    }
%>






<input type="hidden" id="admitDate"   value="<%=admissionDate%>"  class="form-control input-md">
<input type="hidden" id="dateBill"   value="<%=dateBill%>"  class="form-control input-md">








<div id="depositDiv2">

    <%        String resultEliSrc = "select  Master_Reference_Code, Detail_Reference_Code, Description from adm_lookup_detail where master_reference_code = '0034' and  Detail_Reference_Code like '" + EliTy + "%' and hfc_cd ='" + hfc + "' ";
        ArrayList<ArrayList<String>> dataEliSrc = conn.getData(resultEliSrc);
//                out.print(sqlBedID1);
        int a = dataEliSrc.size();

        for (int E = 0; E < a; E++) {

            if (dataEliSrc.get(E).get(1).equals("002-001")) {
                String pnc = "select non_citizen_deposit,non_citizen_room_cost, non_citizen_discount from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
                ArrayList<ArrayList<String>> deposit = conn.getData(pnc);
                for (int i = 0; i < deposit.size(); i++) {
//                ArrayList<ArrayList<String>> datapnc;
//                datapnc = conn.getData(pnc);
//                
//                int sizepnc = datapnc.size();
//
//                for (int i = 0; i < sizepnc; i++) {
    %>

    <input  type="hidden" id="dDeposit"  value="<%=deposit.get(i).get(0)%>"  class="form-control input-md">
    <input  type="hidden" id="dCost"  value="<%=deposit.get(i).get(1)%>"  class="form-control input-md">
    <input  type="hidden" id="dDiscount"  value="<%=deposit.get(i).get(2)%>"  class="form-control input-md">



    <%
        }

    } else if (dataEliSrc.get(E).get(1).equals("002-002")) {
        String pc = "select citizen_deposit, citizen_room_cost, citizen_discount from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>> datapc = conn.getData(pc);
        // datapc = conn.getData(pc);

        //   int sizepc = datapc.size();
        for (int i = 0; i < datapc.size(); i++) {

    %>

    <input  type="hidden" id="dDeposit"  value="<%=datapc.get(i).get(0)%>"  class="form-control input-md">
    <input  type="hidden" id="dCost"  value="<%=datapc.get(i).get(1)%>"  class="form-control input-md">
    <input  type="hidden" id="dDiscount"  value="<%=datapc.get(i).get(2)%>"  class="form-control input-md">
    <%}
    } else if (dataEliSrc.get(E).get(1).equals("003-001")) {
        String gst = "select citizen_deposit, citizen_room_cost, citizen_discount from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>> datagst = conn.getData(gst);

        for (int i = 0; i < datagst.size(); i++) {
    %>

    <input  type="hidden" id="dDeposit"  value="<%=datagst.get(i).get(0)%>"  class="form-control input-md">
    <input  type="hidden" id="dCost"  value="<%=datagst.get(i).get(1)%>"  class="form-control input-md">
    <input  type="hidden" id="dDiscount"  value="<%=datagst.get(i).get(2)%>"  class="form-control input-md">
    <%
        }
    } else if (dataEliSrc.get(E).get(1).equals("003-002")) {
        String gp = "select pensioner_deposit, pensioner_room_cost, pensioner_discount from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>> datagp = conn.getData(gp);

        for (int i = 0; i < datagp.size(); i++) {
    %>

    <input  type="hidden" id="dDeposit"  value="<%=datagp.get(i).get(0)%>"  class="form-control input-md">
    <input  type="hidden" id="dCost"  value="<%=datagp.get(i).get(1)%>"  class="form-control input-md">
    <input  type="hidden" id="dDiscount"  value="<%=datagp.get(i).get(2)%>"  class="form-control input-md">
    <%
        }
    } else if (dataEliSrc.get(E).get(1).equals("003-003")) {
        String gss = "select citizen_deposit, citizen_room_cost, citizen_discount from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>> datagss = conn.getData(gss);

        for (int i = 0; i < datagss.size(); i++) {
    %>

    <input  type="hidden" id="dDeposit"  value="<%=datagss.get(i).get(0)%>"  class="form-control input-md">
    <input  type="hidden" id="dCost"  value="<%=datagss.get(i).get(1)%>"  class="form-control input-md">
    <input  type="hidden" id="dDiscount"  value="<%=datagss.get(i).get(2)%>"  class="form-control input-md">
    <%
        }
    } else if (dataEliSrc.get(E).get(1).equals("004-001")) {
        String s = "select citizen_deposit, citizen_room_cost, citizen_discount from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
        ArrayList<ArrayList<String>> datas = conn.getData(s);

        for (int i = 0; i < datas.size(); i++) {
    %>

    <input  type="hidden" id="dDeposit"  value="<%=datas.get(i).get(0)%>"  class="form-control input-md">
    <input  type="hidden" id="dCost"  value="<%=datas.get(i).get(1)%>"  class="form-control input-md">
    <input  type="hidden" id="dDiscount"  value="<%=datas.get(i).get(2)%>"  class="form-control input-md">
    <%
                }

            }

        }
    %>

</div>


<div id="TRANSFERDiv2">

    <%        String resultTRANSFER = "select  Master_Reference_Code, Detail_Reference_Code, Description from adm_lookup_detail where master_reference_code = '0034' and  Detail_Reference_Code like '" + EliTy + "%' and hfc_cd ='" + hfc + "' ";
        ArrayList<ArrayList<String>> dataTRANSFER = conn.getData(resultTRANSFER);
//                out.print(sqlBedID1);
        int aT = dataTRANSFER.size();

        for (int E = 0; E < aT; E++) {

            if (dataTRANSFER.get(E).get(1).equals("002-001")) {
                String pncTRANSFER = "select non_citizen_deposit,non_citizen_room_cost, non_citizen_discount from wis_ward_name where hfc_cd ='" + thfc_cd + "' and ward_class_code = '" + tWWC + "' AND ward_id =  '" + tWI + "'";
                ArrayList<ArrayList<String>> depositTRANSFER = conn.getData(pncTRANSFER);

                if (depositTRANSFER.size() > 0) {

                    for (int i = 0; i < depositTRANSFER.size(); i++) {
//                ArrayList<ArrayList<String>> datapnc;
//                datapnc = conn.getData(pnc);
//                
//                int sizepnc = datapnc.size();
//
//                for (int i = 0; i < sizepnc; i++) {
    %>

    <input  type="hidden" id="dDepositTRANSFER"  value="<%=depositTRANSFER.get(i).get(0)%>"  class="form-control input-md">
    <input  type="hidden" id="dCostTRANSFER"  value="<%=depositTRANSFER.get(i).get(1)%>"  class="form-control input-md">
    <input  type="hidden" id="dDiscountTRANSFER"  value="<%=depositTRANSFER.get(i).get(2)%>"  class="form-control input-md">



    <%
        }

    } else {

//                ArrayList<ArrayList<String>> datapnc;
//                datapnc = conn.getData(pnc);
//                
//                int sizepnc = datapnc.size();
//
//                for (int i = 0; i < sizepnc; i++) {
    %>

    <input  type="hidden" id="dDepositTRANSFER"  value="0"  class="form-control input-md">
    <input  type="hidden" id="dCostTRANSFER"  value="0"  class="form-control input-md">
    <input  type="hidden" id="dDiscountTRANSFER"  value="0"  class="form-control input-md">



    <%}

    } else if (dataTRANSFER.get(E).get(1).equals("002-002")) {
        String pcTRANSFER = "select citizen_deposit, citizen_room_cost, citizen_discount from wis_ward_name where hfc_cd ='" + thfc_cd + "' and ward_class_code = '" + tWWC + "' AND ward_id =  '" + tWI + "'";
        ArrayList<ArrayList<String>> datapcTRANSFER = conn.getData(pcTRANSFER);
        // datapc = conn.getData(pc);

        //   int sizepc = datapc.size();
        if (datapcTRANSFER.size() > 0) {
            for (int i = 0; i < datapcTRANSFER.size(); i++) {

    %>

    <input  type="hidden" id="dDepositTRANSFER"  value="<%=datapcTRANSFER.get(i).get(0)%>"  class="form-control input-md">
    <input  type="hidden" id="dCostTRANSFER"  value="<%=datapcTRANSFER.get(i).get(1)%>"  class="form-control input-md">
    <input  type="hidden" id="dDiscountTRANSFER"  value="<%=datapcTRANSFER.get(i).get(2)%>"  class="form-control input-md">
    <%
        }

    } else {

//                ArrayList<ArrayList<String>> datapnc;
//                datapnc = conn.getData(pnc);
//                
//                int sizepnc = datapnc.size();
//
//                for (int i = 0; i < sizepnc; i++) {
    %>

    <input  type="hidden" id="dDepositTRANSFER"  value="0"  class="form-control input-md">
    <input  type="hidden" id="dCostTRANSFER"  value="0"  class="form-control input-md">
    <input  type="hidden" id="dDiscountTRANSFER"  value="0"  class="form-control input-md">

    <%}
    } else if (dataTRANSFER.get(E).get(1).equals("003-001")) {
        String gstTRANSFER = "select citizen_deposit, citizen_room_cost, citizen_discount from wis_ward_name where hfc_cd ='" + thfc_cd + "' and ward_class_code = '" + tWWC + "' AND ward_id =  '" + tWI + "'";
        ArrayList<ArrayList<String>> datagstTRANSFER = conn.getData(gstTRANSFER);
        if (datagstTRANSFER.size() > 0) {
            for (int i = 0; i < datagstTRANSFER.size(); i++) {
    %>

    <input  type="hidden" id="dDepositTRANSFER"  value="<%=datagstTRANSFER.get(i).get(0)%>"  class="form-control input-md">
    <input  type="hidden" id="dCostTRANSFER"  value="<%=datagstTRANSFER.get(i).get(1)%>"  class="form-control input-md">
    <input  type="hidden" id="dDiscountTRANSFER"  value="<%=datagstTRANSFER.get(i).get(2)%>"  class="form-control input-md">
    <%
        }

    } else {

//                ArrayList<ArrayList<String>> datapnc;
//                datapnc = conn.getData(pnc);
//                
//                int sizepnc = datapnc.size();
//
//                for (int i = 0; i < sizepnc; i++) {
    %>

    <input  type="hidden" id="dDepositTRANSFER"  value="0"  class="form-control input-md">
    <input  type="hidden" id="dCostTRANSFER"  value="0"  class="form-control input-md">
    <input  type="hidden" id="dDiscountTRANSFER"  value="0"  class="form-control input-md">

    <%        }
    } else if (dataTRANSFER.get(E).get(1).equals("003-002")) {
        String gpTRANSFER = "select pensioner_deposit, pensioner_room_cost, pensioner_discount from wis_ward_name where hfc_cd ='" + thfc_cd + "' and ward_class_code = '" + tWWC + "' AND ward_id =  '" + tWI + "'";
        ArrayList<ArrayList<String>> datagpTRANSFER = conn.getData(gpTRANSFER);
        if (datagpTRANSFER.size() > 0) {

            for (int i = 0; i < datagpTRANSFER.size(); i++) {
    %>

    <input  type="hidden" id="dDepositTRANSFER"  value="<%=datagpTRANSFER.get(i).get(0)%>"  class="form-control input-md">
    <input  type="hidden" id="dCostTRANSFER"  value="<%=datagpTRANSFER.get(i).get(1)%>"  class="form-control input-md">
    <input  type="hidden" id="dDiscountTRANSFER"  value="<%=datagpTRANSFER.get(i).get(2)%>"  class="form-control input-md">
    <%
        }

    } else {


    %>

    <input  type="hidden" id="dDepositTRANSFER"  value="0"  class="form-control input-md">
    <input  type="hidden" id="dCostTRANSFER"  value="0"  class="form-control input-md">
    <input  type="hidden" id="dDiscountTRANSFER"  value="0"  class="form-control input-md">
    <%        }
    } else if (dataTRANSFER.get(E).get(1).equals("003-003")) {
        String gssTRANSFER = "select citizen_deposit, citizen_room_cost, citizen_discount from wis_ward_name where hfc_cd ='" + thfc_cd + "' and ward_class_code = '" + tWWC + "' AND ward_id =  '" + tWI + "'";
        ArrayList<ArrayList<String>> datagssTRANSFER = conn.getData(gssTRANSFER);
        if (datagssTRANSFER.size() > 0) {

            for (int i = 0; i < datagssTRANSFER.size(); i++) {
    %>

    <input  type="hidden" id="dDepositTRANSFER"  value="<%=datagssTRANSFER.get(i).get(0)%>"  class="form-control input-md">
    <input  type="hidden" id="dCostTRANSFER"  value="<%=datagssTRANSFER.get(i).get(1)%>"  class="form-control input-md">
    <input  type="hidden" id="dDiscountTRANSFER"  value="<%=datagssTRANSFER.get(i).get(2)%>"  class="form-control input-md">
    <%
        }

    } else {


    %>

    <input  type="hidden" id="dDepositTRANSFER"  value="0"  class="form-control input-md">
    <input  type="hidden" id="dCostTRANSFER"  value="0"  class="form-control input-md">
    <input  type="hidden" id="dDiscountTRANSFER"  value="0"  class="form-control input-md">
    <%        }
    } else if (dataTRANSFER.get(E).get(1).equals("004-001")) {
        String sTRANSFER = "select citizen_deposit, citizen_room_cost, citizen_discount from wis_ward_name where hfc_cd ='" + thfc_cd + "' and ward_class_code = '" + tWWC + "' AND ward_id =  '" + tWI + "'";
        ArrayList<ArrayList<String>> datasTRANSFER = conn.getData(sTRANSFER);
        if (datasTRANSFER.size() > 0) {
            for (int i = 0; i < datasTRANSFER.size(); i++) {
    %>

    <input  type="hidden" id="dDepositTRANSFER"  value="<%=datasTRANSFER.get(i).get(0)%>"  class="form-control input-md">
    <input  type="hidden" id="dCostTRANSFER"  value="<%=datasTRANSFER.get(i).get(1)%>"  class="form-control input-md">
    <input  type="hidden" id="dDiscountTRANSFER"  value="<%=datasTRANSFER.get(i).get(2)%>"  class="form-control input-md">
    <%
        }

    } else {


    %>

    <input  type="hidden" id="dDepositTRANSFER"  value="0"  class="form-control input-md">
    <input  type="hidden" id="dCostTRANSFER"  value="0"  class="form-control input-md">
    <input  type="hidden" id="dDiscountTRANSFER"  value="0"  class="form-control input-md">
    <%                }

            }

        }
    %>

</div>    
<script>
    $(document).ready(function () {




        var ttlelisource = $('#totalelisource').val();

        var ttleliTy = $('#totaleliTy').val();
        var totaldis = $('#totaldis').val();
        var totaldatawty = $('#totaldatawty').val();
        var datadctype = $('#datadctype').val();
        var totaldatawnme = $('#totaldatawnme').val();
        var amtye = $('#amtye').val();


        //var admitDate = $('#admitDate').val();
        //var dateBill = $('#dateBill').val();
        //var newBegin = "";


///////total normal discharge/////
        var totalday = $('#totalday').val();
        var Deposit = $('#dDeposit').val();
        var Discount = $('#dDiscount').val();
        var Rate = $('#dCost').val();

        var TotalDiscount = (Discount / 100) * Rate;
        var TotalDischargeNORMAL = (Rate * totalday) - TotalDiscount - Deposit;

///////total transfer discharge/////
        // var totaltransferday = $('#totaltransferday').val();
        var totaltransferday = $('#totaltransferday').val();
        var DepositTRANSFER = $('#dDepositTRANSFER').val();
        var DiscountTRANSFER = $('#dDiscountTRANSFER').val();
        var RateTRANSFER = $('#dCostTRANSFER').val();

        var TotalDiscountTRANSFER = (DiscountTRANSFER / 100) * RateTRANSFER;
        var TotalDischargeTRANSFER = (RateTRANSFER * totaltransferday) - TotalDiscountTRANSFER - DepositTRANSFER;

        //    var TotalDischarge = TotalDischargeTRANSFER + TotalDischargeNORMAL;


        var TotalDischarge = TotalDischargeTRANSFER + TotalDischargeNORMAL;

        // var TotalDate = admitDate - dateBill;

        //var TotalDate = new Date(newBegin + dateBill - admitDate);





        $("#day").val(totalday);
        $("#EliSrc").val(ttlelisource);
        $("#EliTy").val(ttleliTy);
        $("#Dis").val(totaldis);
        $("#WardType").val(totaldatawty);

        $("#wname").val(totaldatawnme);
        $("#DocTy").val(datadctype);
        $("#AdmTy").val(amtye);



        $("#totaltransferday").val(totaltransferday);
        $("#TotalDischarge").val(TotalDischarge);
        $("#TotalDischargeNORMAL").val(TotalDischargeNORMAL);
        $("#TotalDischargeTRANSFER").val(TotalDischargeTRANSFER);


        //$("#TotalDate").val(TotalDate);


    });

</script>