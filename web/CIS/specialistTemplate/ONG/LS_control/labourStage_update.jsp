<%-- 
    Document   : labourStage_update
    Created on : Sep 30, 2017, 11:45:37 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="Formatter.ConvertMasa"%>
<%@page import="Formatter.FormatTarikh"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String epDate = (String) session.getAttribute("episodeDate");
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    String creator = (String) session.getAttribute("USER_ID");
    
    String summaryDate = request.getParameter("summaryDate");
    String beginDate= request.getParameter("beginDate");
    String beginTime= request.getParameter("beginTime");
    String membraneDate= request.getParameter("membraneDate");
    String membraneTime= request.getParameter("membraneTime");
    String secondDate= request.getParameter("secondDate");
    String secondTime= request.getParameter("secondTime");
    String bornDate= request.getParameter("bornDate");
    String bornTime= request.getParameter("bornTime");
    String placentaDate= request.getParameter("placentaDate");
    String placentaTime= request.getParameter("placentaTime");
    String hour1= request.getParameter("hour1");
    String minute1= request.getParameter("minute1");
    String hour2= request.getParameter("hour2");
    String minute2= request.getParameter("minute2");
    String hour3= request.getParameter("hour3");
    String minute3= request.getParameter("minute3");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    ConvertMasa cm = new ConvertMasa();
    
    summaryDate = FormatTarikh.formatDate(summaryDate, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    beginDate = FormatTarikh.formatDate(beginDate+" "+beginTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    membraneDate = FormatTarikh.formatDate(membraneDate+" "+membraneTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    secondDate = FormatTarikh.formatDate(secondDate+" "+secondTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    bornDate = FormatTarikh.formatDate(bornDate+" "+bornTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    placentaDate = FormatTarikh.formatDate(placentaDate+" "+placentaTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    
    int min1st = cm.convertHourToMinute(hour1) + Integer.parseInt(minute1);
    int min2nd = cm.convertHourToMinute(hour2) + Integer.parseInt(minute2);
    int min3rd = cm.convertHourToMinute(hour3) + Integer.parseInt(minute3);
    int minTot = min1st + min2nd + min3rd;
    
    String query="UPDATE lhr_ong_labour_summary set labour_begin='"+beginDate+"', membranes_ruptured='"+membraneDate+"', second_stage_labour='"+secondDate+"', "
            + "child_born='"+bornDate+"', placenta_expelled='"+placentaDate+"', `1st_Stage_labour`='"+min1st+"', `2nd_Stage_labour`='"+min2nd+"', "
            + "`3rd_stage_labour`='"+min3rd+"', total_hour='"+minTot+"' "
            + "WHERE pmi_no='"+pmiNo+"' and summary_date='"+summaryDate+"';";
    boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    if(isSuccess)
        out.print("success");
    else
        out.print("fail");
%>
