<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page import="net.sf.jasperreports.engine.export.JRGraphics2DExporterParameter"%>
<%@page import="javax.print.attribute.standard.PrinterResolution"%>
<%@page import="javax.print.attribute.ResolutionSyntax"%>
<%@page import="net.sf.jasperreports.engine.export.JRPrintServiceExporterParameter"%>
<%@page import="javax.print.attribute.PrintRequestAttributeSet"%>
<%@page import="javax.print.attribute.HashPrintRequestAttributeSet"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="net.sf.jasperreports.engine.export.JRGraphics2DExporter"%>
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
                FileInputStream fis = null;
                InputStreamReader isr = null;
                Map parameters = new HashMap();
                parameters.put("PMI_NO",pmiNo); 
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);
//
//		out.print("aaaaaaaaa");
////                InputStream bis = new ByteArrayInputStream(bytes);
//                fis = new FileInputStream("C:/Users/user/Documents/biocore-ihis V1.1/web/Registration/medicalHistory/MedicalReport.jrxml");
//                isr = new InputStreamReader(fis);
//
//                out.print(bytes);
//                JasperPrint print = JasperFillManager.fillReport(fis, parameters, conn);
//                out.print("bbbbbbbbbb");
//          
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
//                
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
//                 
//                ImageIO.write(bufferedImage, "PNG", response.getOutputStream());
//                  
                outStream.flush();
                outStream.close(); 
                
               
             } catch (Exception ex) {
                out.println("Error: " + ex.getMessage());
            }

        %>