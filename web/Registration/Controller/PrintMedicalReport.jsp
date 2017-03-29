<%-- 
    Document   : PrintMedicalReport
    Created on : Mar 17, 2017, 2:26:37 AM
    Author     : user
--%>

<%@page import="javax.imageio.ImageIO"%>
<%@page import="javafx.scene.image.Image"%>
<%@page import="javafx.embed.swing.SwingFXUtils"%>
<%@page import="java.awt.image.BufferedImage"%>
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
            
            String pmiNo = request.getParameter("pmiNo").trim();
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://10.73.32.200:3306/emedica?zeroDateTimeBehavior=convertToNull", "root", "qwerty");

                File reportFile = new File(application.getRealPath("//Registration//medicalHistory//MedicalReport.jasper"));

                Map parameters = new HashMap();
                parameters.put("PMI_NO",pmiNo); 
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);

                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                OutputStream outt = new FileOutputStream("MedicalReport.pdf");
                outt.write(bytes);
                outStream.flush();
                outStream.close();  
                outt.close();
                
               
             } catch (Exception ex) {
                out.println("Error: " + ex.getMessage());
            }

        %>