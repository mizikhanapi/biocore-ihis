<%-- 
    Document   : PrintMedicalReport
    Created on : Mar 17, 2017, 2:26:37 AM
    Author     : user
--%>
    
<%@page import="Config.Config"%>
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
            
            String hfc,status,today,queuename;
            
//             hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
//             today = request.getParameter("pmiNo").trim();
//             status = request.getParameter("pmiNo").trim();// when 0069 look up details = Consult
//             queuename = request.getParameter("pmiNo").trim();
            
                hfc="04010101";
                today = "2017-03-22%";
                queuename = "Normal Queue";
                status = "5";
            
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://10.73.32.200:3306/emedica?zeroDateTimeBehavior=convertToNull", "root", "qwerty");

                File reportFile = new File(application.getRealPath("//Registration//registration//printQueueNO.jasper"));

                Map parameters = new HashMap();
                parameters.put("hfc_cd",hfc); 
                parameters.put("status",status); 
                parameters.put("queue_name",queuename); 
                parameters.put("episode_date",today); 
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);

                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
            } catch (Exception ex) {
                out.println("Error: " + ex.getMessage());
            }


        %>