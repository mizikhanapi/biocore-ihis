<%-- 
    Document   : getOutpatientStatistic
    Created on : Sep 18, 2017, 3:15:37 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    Conn con = new Conn();
    
    String how = request.getParameter("how");
    String leDate = request.getParameter("leDate");
    String dateFrom = request.getParameter("dateFrom");
    String dateTo = request.getParameter("dateTo");
    
    String when = "";
    
    if(how.equalsIgnoreCase("d")){
        when="and date_format(ip.episode_date, '%Y-%m-%d')=date_format('"+leDate+"', '%Y-%m-%d')";
    }
    else if(how.equalsIgnoreCase("m")){
        when="and date_format(ip.episode_date, '%Y-%m')=date_format('"+leDate+"', '%Y-%m')";
    }
    else if(how.equalsIgnoreCase("y")){
        when="and date_format(ip.episode_date, '%Y')=date_format('"+leDate+"', '%Y')";
    }
    else{
        when="and date(ip.episode_date) between date('"+dateFrom+"') AND date('"+dateTo+"') ";
    }
    
    String sqlGenderStat = "SELECT ld.`Detail_Reference_code`,ld.`Description`, count(distinct(concat(ip.pmi_no, ip.episode_date))) "
            + "FROM adm_lookup_detail ld "
            + "left join pms_patient_biodata pb on pb.`SEX_CODE`=ld.`Detail_Reference_code` "
            + "left join pms_episode ip on ip.pmi_no=pb.`PMI_NO` and ip.`HEALTH_FACILITY_CODE`=ld.hfc_cd "+when
            + "where ld.`Master_Reference_code`='0041' and ld.hfc_cd='"+hfc_cd+"' "
            + "group by ld.`Description`;";
    ArrayList<ArrayList<String>> dataGender = con.getData(sqlGenderStat);
    
    String sqlIDStat = "SELECT ld.`Detail_Reference_code`,ld.`Description`, count(distinct(concat(ip.pmi_no, ip.episode_date))) "
            + "FROM adm_lookup_detail ld "
            + "left join pms_patient_biodata pb on pb.`ID_TYPE`=ld.`Detail_Reference_code` "
            + "left join pms_episode ip on ip.pmi_no=pb.`PMI_NO` and ip.`HEALTH_FACILITY_CODE`=ld.hfc_cd "+when
            + "where ld.`Master_Reference_code`='0012' and ld.hfc_cd='"+hfc_cd+"' "
            + "group by ld.`Description`;";
    ArrayList<ArrayList<String>> dataID = con.getData(sqlIDStat);
    
     /*
    Gender: 001 - male; 002 - female; 003 - other
    ID type: 004 - Matric no; 005 - Staff no; else - other    
    */
    
    try{
        
        int intTotal=0, intMale=0, intFemale=0, intOther=0, intStaff=0, intStudent=0, intOtherID=0;
        
        for(int i =0; i<dataGender.size(); i++){
            String leCode = dataGender.get(i).get(0);
            
            if(leCode.equalsIgnoreCase("001"))
                intMale= Integer.parseInt(dataGender.get(i).get(2));
            else if(leCode.equalsIgnoreCase("002"))
                intFemale = Integer.parseInt(dataGender.get(i).get(2));
            else
                intOther += Integer.parseInt(dataGender.get(i).get(2));
            
            intTotal += Integer.parseInt(dataGender.get(i).get(2));
        }//end for loop
        
        for(int i =0; i<dataID.size(); i++){
            String leCode = dataID.get(i).get(0);
            
            if(leCode.equalsIgnoreCase("004"))
                intStudent= Integer.parseInt(dataID.get(i).get(2));
            else if(leCode.equalsIgnoreCase("005"))
                intStaff = Integer.parseInt(dataID.get(i).get(2));
            else
                intOtherID += Integer.parseInt(dataID.get(i).get(2));
            
        }//end for loop
    
%>
<div class="text-center">
    <div class="bed-booking-title">Total OutPatient</div>

    <span class="bed-booking-total"><%=intTotal%></span>
    <div>
        <span><b>By gender: </b></span>
        <span class="bed-booking-a" style="color: deepskyblue"><i class="fa fa-square"></i> Males:&nbsp;<%=intMale%></span> 
        <span class="bed-booking-p" style="color: hotpink"><i class="fa fa-square"></i> Females:&nbsp;<%=intFemale%></span>
        <span class="bed-booking-o" style="color: green"><i class="fa fa-square"></i> Others:&nbsp;<%=intOther%></span>
    </div>
    
     <div>
        <span><b>By ID type: </b></span>
        <span class="bed-booking-a" style="color: cornflowerblue"><i class="fa fa-square"></i> Staff:&nbsp;<%=intStaff%></span> 
        <span class="bed-booking-p" style="color: crimson"><i class="fa fa-square"></i> Student:&nbsp;<%=intStudent%></span>
        <span class="bed-booking-o" style="color: orange"><i class="fa fa-square"></i> Others:&nbsp;<%=intOtherID%></span>
    </div>
</div>
<%
    }//end try
    catch(Exception e){
        response.sendError(response.SC_INTERNAL_SERVER_ERROR);
    }
%>
