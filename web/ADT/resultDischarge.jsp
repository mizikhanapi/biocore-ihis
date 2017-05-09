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


    String admissionDate = request.getParameter("admissionDate");
    String totalelisource = "";

    String getDate = "SELECT DATEDIFF(day,'now()',episode_date) AS DiffDate from wis_inpatient_episode";
    ArrayList<ArrayList<String>> deposit3 = conn.getData(getDate);
    for (int i = 0; i < deposit3.size(); i++) {
    }

    String eliCat = "select Description from adm_lookup_detail where master_reference_code = '0063' and Detail_Reference_code ='" + EliSource + "'  ";
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
    String eliTy = "select Description from adm_lookup_detail where master_reference_code = '0034' and Detail_Reference_code ='" + EliTy + "'  ";
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
    String diss = "select discipline_name from adm_discipline where  discipline_cd ='" + disb + "'  ";
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
    String wty = "select ward_class_name from wis_ward_class where  ward_class_code ='" + WardTypeb + "'  ";
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
    String wnme = "select ward_name from wis_ward_name where  ward_id ='" + wnameb + "'  ";
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
    String dctype = "select Description from adm_lookup_detail where master_reference_code = '0023' and Detail_Reference_code ='" + DocTy + "'  ";
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
    String amty = "select Description from adm_lookup_detail where master_reference_code = '0023' and Detail_Reference_code ='" + DocTy + "'  ";
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
<input type="hidden" id="getDate"   value="<%=deposit3%>"  class="form-control input-md">







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
<script>
    $(document).ready(function () {




        var ttlelisource = $('#totalelisource').val();

        var ttleliTy = $('#totaleliTy').val();
        var totaldis = $('#totaldis').val();
        var totaldatawty = $('#totaldatawty').val();
        var datadctype = $('#datadctype').val();
                var totaldatawnme = $('#totaldatawnme').val();
       var amtye = $('#amtye').val();





        var Deposit = $('#dDeposit').val();
        var Discount = $('#dDiscount').val();
        var Rate = $('#dCost').val();
        var admitDate = $('#admitDate').val();
        var dateBill = $('#dateBill').val();
        var newBegin = "";


        var TotalDiscount = (Discount / 100) * Rate;

        var TotalDischarge = Rate - TotalDiscount - Deposit;
        var TotalDate = admitDate - dateBill;

        var TotalDate = new Date(newBegin + dateBill - admitDate);






        $("#EliSrc").val(ttlelisource);
        $("#EliTy").val(ttleliTy);
        $("#Dis").val(totaldis);
        $("#WardType").val(totaldatawty);

        $("#wname").val(totaldatawnme);
                $("#DocTy").val(datadctype);
        $("#AdmTy").val(amtye);




        $("#TotalDischarge").val(TotalDischarge);
        $("#TotalDate").val(TotalDate);


    });

</script>