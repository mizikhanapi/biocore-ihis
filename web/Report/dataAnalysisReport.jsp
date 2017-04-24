<%-- 
    Document   : dataAnalysisReport
    Created on : Apr 23, 2017, 10:44:48 PM
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            String daType = request.getParameter("daType");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");


            try {

                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://10.73.32.200:3306/emedica?zeroDateTimeBehavior=convertToNull", "root", "qwerty");

//                File reportFile = new File(application.getRealPath("//reports//MC22.jasper"));

                if (daType.equals("refferal")) {

                    File reportFile = new File(application.getRealPath("//reports//refferalList.jasper"));

                    Map parameters = new HashMap();
                    parameters.put("startDate", startDate);
                    parameters.put("endDate", endDate);
//             ;

                    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);

                    response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);
                    ServletOutputStream outStream = response.getOutputStream();
                    outStream.write(bytes, 0, bytes.length);
                    outStream.flush();
                    outStream.close();

                } else if (daType.equals("list")) {

                    File reportFile = new File(application.getRealPath("//reports//listOutpatient.jasper"));

                    Map parameters = new HashMap();
                    parameters.put("startDate", startDate);
                    parameters.put("endDate", endDate);

                    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);

                    response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);
                    ServletOutputStream outStream = response.getOutputStream();
                    outStream.write(bytes, 0, bytes.length);
                    outStream.flush();
                    outStream.close();

                } else if (daType.equals("mix")) {

                    File reportFile = new File(application.getRealPath("//reports//agesexandrace.jasper"));

                    Map parameters = new HashMap();
                    parameters.put("startDate", startDate);
                    parameters.put("endDate", endDate);

                    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);

                    response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);
                    ServletOutputStream outStream = response.getOutputStream();
                    outStream.write(bytes, 0, bytes.length);
                    outStream.flush();
                    outStream.close();

                } else {

                    File reportFile = new File(application.getRealPath("//reports//patientReg.jasper"));

                    Map parameters = new HashMap();
                    parameters.put("startDate", startDate);
                    parameters.put("endDate", endDate);

                    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);

                    response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);
                    ServletOutputStream outStream = response.getOutputStream();
                    outStream.write(bytes, 0, bytes.length);
                    outStream.flush();
                    outStream.close();

                }

            } catch (Exception ex) {
                out.println("Error: " + ex.getMessage());
            }


        %>


    </body>
</html>
