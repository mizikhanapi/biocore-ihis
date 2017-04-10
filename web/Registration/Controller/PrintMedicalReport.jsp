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

//                JRGraphics2DExporter exporter = new JRGraphics2DExporter();
//                BufferedImage bufferedImage = new BufferedImage(595, 860, BufferedImage.TYPE_INT_RGB);
//                Graphics2D g = (Graphics2D)bufferedImage.getGraphics();
//                exporter.setParameter(JRGraphics2DExporterParameter.GRAPHICS_2D, g);
//                exporter.setParameter(JRGraphics2DExporterParameter.ZOOM_RATIO, Float.valueOf(1));
//                exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
//                PrintRequestAttributeSet attrs = new HashPrintRequestAttributeSet();
//                attrs.add(new PrinterResolution(500, 440, ResolutionSyntax.DPI));
//                exporter.setParameter(JRPrintServiceExporterParameter.PRINT_REQUEST_ATTRIBUTE_SET, attrs);
//                exporter.exportReport();
//                g.dispose();
//                ImageIO.write(bufferedImage, "PNG", out);

                
                
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