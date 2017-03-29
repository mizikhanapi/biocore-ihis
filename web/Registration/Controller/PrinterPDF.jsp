<%-- 
    Document   : PrinterPDF
    Created on : Mar 24, 2017, 6:49:17 PM
    Author     : user
--%>

<%@page import="javax.print.DocPrintJob"%>
<%@page import="javax.print.PrintService"%>
<%@page import="javax.print.SimpleDoc"%>
<%@page import="javax.print.PrintServiceLookup"%>
<%@page import="javax.print.attribute.PrintRequestAttributeSet"%>
<%@page import="javax.print.attribute.HashPrintRequestAttributeSet"%>
<%@page import="javax.print.Doc"%>
<%@page import="javax.print.DocFlavor"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%! 


public class PrintTest{
  
   public  void print(){
       
        FileInputStream psStream = null;
        try {
            psStream = new FileInputStream("C:/Users/user/Documents/biocore-ihis/web/Registration/Controller/MedicalReport.pdf");
            } catch (FileNotFoundException ffne) {
              ffne.printStackTrace();
            }
            if (psStream == null) {
                return;
            }
        DocFlavor psInFormat = DocFlavor.INPUT_STREAM.AUTOSENSE;
        Doc myDoc = new SimpleDoc(psStream, psInFormat, null);  
        PrintRequestAttributeSet aset = new HashPrintRequestAttributeSet();
        PrintService[] services = PrintServiceLookup.lookupPrintServices(psInFormat, aset);
         
        // this step is necessary because I have several printers configured
        PrintService myPrinter = null;
        for (PrintService service : services){
         System.out.println("HERE : "+ service);
            if(service.toString().indexOf("M201") != -1)
               {
                     System.out.println("HERE I AM 5850II ");
                     myPrinter = service;
                     break;
           } 
        }
         
        if (myPrinter != null) {            
            DocPrintJob job = myPrinter.createPrintJob();
            try {
            job.print(myDoc, aset);
             
            } catch (Exception pe) {pe.printStackTrace();}
        } else {
            System.out.println("no printer services found");
        }
   }
}

%>

<%
            PrintTest directPrint = new PrintTest();
//            directPrint.printString("E00000000 \n ooo"); 
//            directPrint.printString("1rrrrrr");
             directPrint.print();
%>