<%-- 
    Document   : timeslip
    Created on : Feb 16, 2017, 5:04:53 AM
    Author     : user
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.io.*"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>


<%

    Conn conn = new Conn();
    String my_1_gamba = "";
    String my_1_nama = "";
    String my_1_role = "";
    String my_1_hfcName = "";
    String my_1_hfc_cd = "";
    String my_1_user_id = "";
    String my_1_dis_cd = "";
    String my_1_sub_cd = "";
    String my_1_dis_name = "";
    String my_1_sub_name = "";

    if (session.getAttribute("USER_NAME") != null) {

        my_1_gamba = session.getAttribute("PICTURE").toString();
        my_1_nama = session.getAttribute("USER_NAME").toString();
        my_1_role = session.getAttribute("ROLE_NAME").toString();
        my_1_hfcName = session.getAttribute("HFC_NAME").toString();
        my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        my_1_user_id = (String) session.getAttribute("USER_ID");
        my_1_dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
        my_1_dis_name = (String) session.getAttribute("DISCIPLINE_NAME");
        my_1_dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
        my_1_sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
        my_1_sub_name = (String) session.getAttribute("SUB_DISCIPLINE_NAME");

    }

    String sql = "SELECT address1, logo FROM adm_health_facility WHERE hfc_cd = '" + my_1_hfc_cd + "'";
    ArrayList<ArrayList<String>> add = conn.getData(sql);
    String name = request.getParameter("name");
    String episode = request.getParameter("episode");
    String pmi = request.getParameter("pmi");
    String start_time = request.getParameter("start_time");
    String end_time = request.getParameter("end_time");
    String comment = request.getParameter("comment");
    String ic = request.getParameter("ic");
    String idNo = request.getParameter("id");
    String episodeDate = request.getParameter("episodeDate");

    LocalDateTime now = LocalDateTime.now();
    SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(now);
    DateTimeFormatter formatOrderTime = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
    String seq = formatOrderTime.format(now);

%>

<div style="text-align: center; margin-bottom: 30px;">
    <img src="<%=add.get(0).get(1)%>" height="70" width="150" />
    <h3><%=my_1_hfcName%></h3>
    <h5><%=add.get(0).get(0)%></h5>
</div>

<div class="row">
    <div class="pull-right" style="padding-right: 20px;">
        <p> <strong> Tarikh : <%=newdate%></strong> </p>
    </div>
</div>
    
<br/>

<div class="row">
    <div class="col-md-12">
        <p>Kepada:&nbsp;<strong>....................................................................................................................<%%></strong></p>
        <p>Saya sahkan bahawa yang bernama Dato'/Datin/Tuan/Puan/Encik/Cik: <strong><%=name%></strong></p>
        <p>No. STAFF/MATRIKS:&nbsp;<strong><%=idNo%></strong>&nbsp;&nbsp;&nbsp;&nbsp; No. KP:&nbsp;<strong><%=ic%></strong></p>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <p>Telah mendapat rawatan di Pusat Kesihatan daripada jam:&nbsp;<strong><%=start_time%> </strong>&nbsp;hingga:&nbsp;<strong><%=end_time%></strong></p>
        <p>Tarikh:&nbsp;<strong><%=episodeDate%></strong></p>
    </div>
</div>

<div class="row">
    <div class="col-md-3" style="float: right">
        <br>
        <br>
        <br>
        <label for="">...............................................</label><br>
        <p style="text-align: center;"><%=my_1_hfcName%></p>
    </div>
</div>

