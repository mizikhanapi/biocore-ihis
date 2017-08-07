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
<%@include file="Printer.jsp" %>

        <%
            RMIConnector rmic = new RMIConnector();
            Config.getBase_url(request);
            Config.getFile_url(session);
                
            Conn conn = new Conn();
            
            String pmiNo = request.getParameter("pmiNo").trim();
//            String pmiNo = "051347716";
            String HelathFacility = session.getAttribute("HFC_NAME").toString();
            try {
        String quary="SELECT distinct"
        +" pbd.`NEW_IC_NO` AS pms_patient_biodata_NEW_IC_NO,"
        +" pbd.`PATIENT_NAME` AS pms_patient_biodata_PATIENT_NAME,"
        +" icd_cd.`icd10_desc`  AS diagnosis_Diagnosis,"
        +" IFNULL(lhr_med.`product_name`, 'None') AS lhr_medication_product_name,"
        +" IFNULL(lhr_aller.`allergy_cd`, 'None') AS lhr_allergy_allergy_cd,"
        +" lhr_dia.`Episode_Date` AS lhr_diagnosis_Episode_Date,"
        +" IFNULL(adm_lookup_det.`Description`, 'No Record') AS Textuer_Blood_Type,"

           +" CASE WHEN pbd.`NEW_IC_NO`= '-' THEN 'No Record'"
        +"    ELSE  pbd.`NEW_IC_NO`  END AS pms_patient_biodata_NEW_IC_NO_new,"

           +" CASE WHEN pbd.`BLOOD_TYPE` = '-' THEN 'No Record'"
        +"       ELSE  pbd.`BLOOD_TYPE`  END AS pbd_BLOOD_TYPE_new"

        +"   FROM `pms_patient_biodata` pbd"
        +"   inner join lhr_diagnosis lhr_dia"
        +"    on pbd.`PMI_NO` = lhr_dia.`PMI_no`"
        +"    inner join icd10_codes icd_cd"
        +"    on lhr_dia.`Diagnosis_Cd` = icd_cd.`icd10_code` "
        +"    left join adm_lookup_detail adm_lookup_det"
        +"    on adm_lookup_det.`Detail_Reference_code` =  pbd.`BLOOD_TYPE`"
        +"    and adm_lookup_det.`hfc_cd` = lhr_dia.`hfc_cd`"
        +"   left join adm_lookup_master adm_lookup_mas"
        +"   on adm_lookup_det.`Master_Reference_code` = adm_lookup_mas.`Master_Reference_code`"
        +"   and adm_lookup_mas.`Master_Reference_code` like '0074'"
        +"    left join lhr_medication lhr_med"
        +"    on pbd.`PMI_NO` = lhr_med.pmi_no "
        +"    and lhr_dia.`Episode_Date` = lhr_med.`Episode_Date`"
        +"    left join lhr_allergy lhr_aller"
        +"    on pbd.`PMI_NO` =  lhr_aller.pmi_no"
         +" WHERE pbd.`PMI_NO` = '"+pmiNo+"' "
         +" AND IF(pbd.`BLOOD_TYPE` != '-',adm_lookup_det.`Master_Reference_code`, '0074')"
         +" LIKE '0074'  "
         +" ORDER BY lhr_dia.`Episode_Date` DESC"
         +" LIMIT 3;";
//                + "WHERE "
//          +"   pbd.`PMI_NO` = '"+pmiNo+"' AND lhr_dia.`Episode_Date` = (SELECT MAX(lhr_dia.`Episode_Date`)"
//          +"               FROM `lhr_diagnosis` lhr_dia"
//            +"             WHERE lhr_dia.`PMI_no` = '"+pmiNo+"')  and "
//        +" IF(pbd.`BLOOD_TYPE` != '-',adm_lookup_det.`Master_Reference_code`, '0074') LIKE  '0074' ";
//                
//              out.print(quary); 
                Boolean SQL=false;
                ArrayList<ArrayList<String>> medicalInfo = conn.getData(quary);
               SQL = rmic.setQuerySQL(conn.HOST, conn.PORT, quary);
               out.print(" SQL "+SQL);
               
           if (SQL == true && !medicalInfo.isEmpty() )
           {
//            for(int i=0;i<medicalInfo.size();i++)
//            {   
//                ArrayList<String> medicalInfoSingleReport = medicalInfo.get(i);
//                out.print("<br>"+"<p> ");
//                for (int j=0;j<medicalInfoSingleReport.size();j++)
//                {
//                    out.print(medicalInfoSingleReport.get(j)+"   |   ");
//                }
//                 out.print("</p>");
//            }
//            
                String ic,name,bloodtype,diagnosis,medication,allerg,date,time;
                ic = medicalInfo.get(0).get(0); 
                name = medicalInfo.get(0).get(1);
                bloodtype = medicalInfo.get(0).get(6);
                diagnosis = medicalInfo.get(0).get(2);
                medication = medicalInfo.get(0).get(3);
                allerg = medicalInfo.get(0).get(4);
                date = medicalInfo.get(0).get(5);
                DirectPrint queueprint = new DirectPrint();
//                queueprint.printString("MedicalReport\n"+HelathFacility+"  "+"\nIC NO: "+ic +"\nNAME: "+name +"\nBLOOD TYPE: "+bloodtype +"\nDIAGNOSIS: "+diagnosis+"\nMEDICATION: "+medication+"\nALLERGY: "+allerg);
                
                out.print("Report Printed");
//            queueprint.printString("MedicalReport\n"+HelathFacility+"  "+"\nIC No: \n"+ic +"\nName: \n"+name +"\nBlood Type: \n"+bloodtype +"\nDiagnosis: \n"+diagnosis+"\nMedication: \n"+medication+"\nAllergy: \n"+allerg);
//                out.print("MedicalReport\n"+HelathFacility+"  "+"\nIC No: "+ic +"\nName: "+name +"\nBlood Type: "+bloodtype +"\nDiagnosis: "+diagnosis+"        "+"\nMedication: "+medication+"\nAllergy: "+allerg);
           } else{
                out.print("No Records");
           }
            
//                Class.forName("com.mysql.jdbc.Driver").newInstance();
//                Connection conn = DriverManager.getConnection("jdbc:mysql://10.73.32.200:3306/emedica?zeroDateTimeBehavior=convertToNull", "root", "qwerty");
//
//                File reportFile = new File(application.getRealPath("//Registration//medicalHistory//MedicalReport.jasper"));
//
//                Map parameters = new HashMap();
//                parameters.put("PMI_NO",pmiNo); 
//                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);

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

                
//                
//                response.setContentType("application/pdf");
//                response.setContentLength(bytes.length);
//                ServletOutputStream outStream = response.getOutputStream();
//                outStream.write(bytes, 0, bytes.length);
//                outStream.flush();
//                outStream.close(); 
//                
               
             } catch (Exception ex) {
                out.println("Error: " + ex.getMessage());
            }

        %>