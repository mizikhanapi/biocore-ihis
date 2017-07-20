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
    String pmi = request.getParameter("pmi");
    String icno = request.getParameter("icno");


    String admissionDate = request.getParameter("admissionDate");

    String totaldays = "";

    String getDate = "SELECT DATEDIFF(now(),episode_date) AS days from wis_inpatient_episode where pmi_no = '" + pmi + "'";
    ArrayList<ArrayList<String>> datediff = conn.getData(getDate);
    for (int i = 0; i < datediff.size(); i++) {
        String days = datediff.get(i).get(0);
        totaldays = days;
%>  
<input   type="hidden" id="totalday"   value="<%=datediff.get(i).get(0)%>"  class="form-control input-md">   
<%
    }

%>  




<input type="hidden" id="admitDate"   value="<%=admissionDate%>"  class="form-control input-md">
<input type="hidden" id="dateBill"   value="<%=dateBill%>"  class="form-control input-md">










 
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
        var totaltransferday = $('#totaltransferday').val();
        var DepositTRANSFER = $('#dDepositTRANSFER').val();
        var DiscountTRANSFER = $('#dDiscountTRANSFER').val();
        var RateTRANSFER = $('#dCostTRANSFER').val();

        var TotalDiscountTRANSFER = (DiscountTRANSFER / 100) * RateTRANSFER;
        var TotalDischargeTRANSFER = (RateTRANSFER * totaltransferday) - TotalDiscountTRANSFER - DepositTRANSFER;

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