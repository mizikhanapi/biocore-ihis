<%-- 
    Document   : getInpatientStatistic
    Created on : Sep 18, 2017, 12:04:41 PM
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
    
    String query="SELECT ld.`Detail_Reference_code`,ld.`Description`, count(distinct(concat(ip.pmi_no, ip.episode_date))) "
            + "FROM adm_lookup_detail ld "
            + "left join pms_patient_biodata pb on pb.`SEX_CODE`=ld.`Detail_Reference_code` "
            + "left join wis_inpatient_episode ip on ip.pmi_no=pb.`PMI_NO` and ip.hfc_cd=ld.hfc_cd "
            + "where ld.`Master_Reference_code`='0041' and ld.hfc_cd='"+hfc_cd+"' "+when
            + "group by ld.`Description`;";
    ArrayList<ArrayList<String>> dataStat = con.getData(query);
    
    String queryID="SELECT ld.`Detail_Reference_code`,ld.`Description`, count(distinct(concat(ip.pmi_no, ip.episode_date))) "
            + "FROM adm_lookup_detail ld "
            + "left join pms_patient_biodata pb on pb.`ID_TYPE`=ld.`Detail_Reference_code` "
            + "left join wis_inpatient_episode ip on ip.pmi_no=pb.`PMI_NO` and ip.hfc_cd=ld.hfc_cd "
            + "where ld.`Master_Reference_code`='0012' and ld.hfc_cd='"+hfc_cd+"' "+when
            + "group by ld.`Description`;";
    ArrayList<ArrayList<String>> dataStatID = con.getData(queryID);
    
    /*
    Gender: 001 - male; 002 - female; 003 - other
    ID type: 004 - Matric no; 005 - Staff no; else - other    
    */
    
    try{
        int total = 0, intMale=0, intFemale=0, intOther=0, intStudent=0, intStaff=0, intOtherID=0;
        for(int i=0; i<dataStat.size(); i++){
        
            String sex_code = dataStat.get(i).get(0);
            if(sex_code.equalsIgnoreCase("001"))
                intMale= Integer.parseInt(dataStat.get(i).get(2));
            else if(sex_code.equalsIgnoreCase("002"))
                intFemale = Integer.parseInt(dataStat.get(i).get(2));
            else
                intOther += Integer.parseInt(dataStat.get(i).get(2));
            
            total += Integer.parseInt(dataStat.get(i).get(2));
            
        }//end for loop
        
        for(int i=0; i<dataStatID.size(); i++){
            
            String id_code = dataStatID.get(i).get(0);
            if(id_code.equalsIgnoreCase("004"))
                intStudent = Integer.parseInt(dataStatID.get(i).get(2));
            else if(id_code.equalsIgnoreCase("005"))
                intStaff = Integer.parseInt(dataStatID.get(i).get(2));
            else
                intOtherID += Integer.parseInt(dataStatID.get(i).get(2));
        }//end for loop
        
        //out.print(total+"|"+intMale+"|"+intFemale+"|"+intOther);
        
%>
 <div class="text-center">
    <div class="bed-booking-title">Total InPatient</div>

    <span class="bed-booking-total"><%=total%></span>
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
    }
    catch(Exception e){
        response.sendError(response.SC_INTERNAL_SERVER_ERROR);
    }
    
%>
