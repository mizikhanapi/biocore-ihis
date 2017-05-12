<%-- 
    Document   : PrintMedicalReport
    Created on : Mar 17, 2017, 2:26:37 AM
    Author     : user
--%>
    
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.io.*"%> 
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@include file="Printer.jsp" %>


        <%
            Config.getBase_url(request);
            Config.getFile_url(session);
                
            Conn conn = new Conn();
   
            String hfc = "",status= "1",today= "",time ="", queuename= "";
//            String hfc = "04010101",status= "1",today= "2017-05-05",queuename= "Normal Queue";
            
             hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
             today = request.getParameter("today").trim();
             time = request.getParameter("time").trim();
//             status = request.getParameter("status").trim();// when 0069 look up details = Consult
             queuename = request.getParameter("queuename").trim();
  
                String quary="	SELECT MAX(`queue_no`) AS pms_pat_que"
                        + " FROM `pms_patient_queue`"
                        + " WHERE  `hfc_cd` =  '"+hfc+"' "
                        + " and  `episode_date` like '"+today+"%'"
                        + " and `queue_name`= '"+queuename+"'  and `status`='"+status+"'"
                        + " UNION"
                        + " SELECT `last_queue_no` AS pms_last_queue_no"
                        + " from `pms_last_queue_no`"
                        + " WHERE  `hfc_cd` =  '"+hfc+"' "
                        + " and  `episode_date` like '"+today+"%'  "
                        + " and `queue_name`= '"+queuename+"' ";
                
                 ArrayList<ArrayList<String>> QueueNo = conn.getData(quary);
                 
                 String CurrentNo, PatientNewNo, HelathFacility;
                 CurrentNo =QueueNo.get(0).get(0);
                 PatientNewNo= QueueNo.get(1).get(0);
                 HelathFacility = session.getAttribute("HFC_NAME").toString(); 
                 
                String day="";
                
                
                try {
                
                    SimpleDateFormat format1=new SimpleDateFormat("yyyy-MM-dd");
                    Date dt1=format1.parse(today);
                    DateFormat format2=new SimpleDateFormat("EEEE"); 
                    day=format2.format(dt1);
                    
                } catch (ParseException e) {
                    e.printStackTrace();
                }

                
                 
                if(CurrentNo == null)
                {
                    CurrentNo = "0";
                }
                DirectPrint queueprint = new DirectPrint();
                queueprint.printString(HelathFacility+"  "+"\nNombor anda:\n"+PatientNewNo +"\nCurrent no :"+CurrentNo +"\n"+day+": "+today+"        "+"Time: "+time); 

                 
                 
//                 out.print("    "+HelathFacility+" "+"\nNombor anda:"+PatientNewNo +"\nCurrent no :"+CurrentNo +"\n  Monday"+"12-10-22"+"        "+"10:50");
//            try {
//                Class.forName("com.mysql.jdbc.Driver").newInstance();
//                Connection conn = DriverManager.getConnection("jdbc:mysql://10.73.32.200:3306/emedica?zeroDateTimeBehavior=convertToNull", "root", "qwerty");
//
//                File reportFile = new File(application.getRealPath("//Registration//registration//printQueueNO.jasper"));
//
//                Map parameters = new HashMap();
//                parameters.put("hfc_cd",hfc); 
//                parameters.put("status",status); 
//                parameters.put("queue_name",queuename); 
//                parameters.put("episode_date",today); 
//                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);
//
//                response.setContentType("application/pdf");
//                response.setContentLength(bytes.length);
//                ServletOutputStream outStream = response.getOutputStream();
//                outStream.write(bytes, 0, bytes.length);
//                outStream.flush();
//                outStream.close();
//            } catch (Exception ex) {
//                out.println("Error: " + ex.getMessage());
//            }




        %>