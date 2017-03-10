<%-- 
    Document   : Printer
    Created on : Feb 21, 2017, 9:39:21 AM
    Author     : user
--%>
<%@page import="java.awt.Font"%>
<%@page import="javax.print.attribute.standard.MediaSize"%>
<%@page import="java.awt.print.Paper"%>
<%@page import="java.awt.Stroke"%>
<%@page import="java.awt.BasicStroke"%>
<%@page import="javax.print.attribute.Attribute"%>
<%@page import=" java.awt.Graphics" %>
<%@page import=" java.awt.Graphics2D" %>
<%@page import=" java.awt.print.PageFormat" %>
<%@page import=" java.awt.print.Printable" %>
<%@page import=" java.awt.print.PrinterException" %>
<%@page import=" java.awt.print.PrinterJob" %>
<%@page import=" javax.print.PrintService" %>
<%@page import=" javax.print.attribute.HashPrintRequestAttributeSet" %>
<%@page import=" javax.print.attribute.PrintRequestAttributeSet" %>
<%@page import=" javax.print.attribute.standard.Copies" %>
<%@page import=" javax.print.attribute.standard.PageRanges" %>
<%@page import=" javax.print.PrintServiceLookup" %>
<%! 


 
public class DirectPrint implements Printable {
 
//    private PrintService[] printService;
    private PrintService Defultservice;
//    private PrintService Printer5850II;
    private String text;
 
    public DirectPrint() {
          //for Printer named 5850II
//        this.printService = PrinterJob.lookupPrintServices(); 
//        for(int i = 0 ;i < printService.length; i++)
//        System.out.println("Normal "+printService[i]);

        //for default printer
        this.Defultservice = PrintServiceLookup.lookupDefaultPrintService();
        System.out.println("Defult "+Defultservice);
    }
 
//    public void main(String[] args) {
//        DirectPrint lt = new DirectPrint();
//        lt.printString("If this text gets printed, it will have worked! ;D");
//    }
 
    public void printString(String input) {
 
        this.text = input;
         
        PrintRequestAttributeSet aset = new HashPrintRequestAttributeSet();
        aset.add(new PageRanges(1, 1));
        aset.add(new Copies(1));
        //aset.add(MediaSize.ISO.A8);
        

        PrinterJob printJob = PrinterJob.getPrinterJob();
       

         //PageFormat pf = printJob.pageDialog(aset);


         PageFormat pf = printJob.defaultPage();
            Paper paper = new Paper();
            double margin = 0; 
            paper.setImageableArea(margin, margin, paper.getWidth() - margin * 2, paper.getHeight()
                - margin * 2);
            pf.setPaper(paper);
 
            printJob.setPrintable(this, pf);
              try {
                       //for Printer named 5850II
//                      for(PrintService theprintService : printService)
//                        {
//                            if(theprintService.toString().indexOf("5850II") != -1)
//                             {
//                                System.out.println("HERE I AM 5850II ");
//                                 Printer5850II = theprintService;
//                                 break;
//                             } 
//                        }
//                    printJob.setPrintService(Printer5850II);
                    //for default printer
                    printJob.setPrintService(Defultservice);

                    printJob.print();
              } catch (PrinterException pp) {
                System.out.println(pp);
              }
            }
 

//        Paper page = new Paper();
//        page.setImageableArea(100, 100, 1000000, 100);
//        
//        pf = printJob.getPageFormat(aset);
//        printJob.setPrintable(this);
//
//     try {
//            
//            for(int i = 0; i<printService.length;i++)
//            {
//                System.out.println(printService[i]);
//                  
//            }
//
////            printJob.setPrintService(printService[7]);
//            //index of installed printers on you system
//            //not sure if default-printer is always '0'
//            printJob.print(aset);
//        } catch (PrinterException err) {
//            System.err.println(err);
//        }
//    }
 
    public int print(Graphics g, PageFormat pf, int pageIndex) throws PrinterException {
       int y = 0;
            if (pageIndex != 0)
              return NO_SUCH_PAGE;
        Graphics2D g2 = (Graphics2D) g;
        g2.translate(pf.getImageableX(), pf.getImageableY());
        Font currentFont = g.getFont();
        Font newFont = currentFont.deriveFont(currentFont.getSize() * 1.4F);
        g.setFont(newFont);
        g.setFont(new Font("TimesRoman", Font.PLAIN, 10));
        String [] lines = new String [5];
        //g.drawString(line, 15, y += g.getFontMetrics().getHeight())
        int count = 0;
        for (String line : this.text.split("\n"))
        {
            lines[count]=line;
            count++;
        }
        for (int i =0;i<lines.length;i++)
        {
            if(i == 2)
            {
                g.setFont(new Font("TimesRoman", Font.PLAIN, 40));
            } else if (i == 3){
                g.setFont(new Font("TimesRoman", Font.PLAIN, 10));
            } else if(i == 4)
            {
                g.setFont(new Font("TimesRoman", Font.PLAIN, 7));
            }
            g.drawString(lines[i], 15, y += g.getFontMetrics().getHeight());
        }
//        g.drawString(String.valueOf(this.text), 15, y+= g.getFontMetrics().getHeight());
        //debug(g2, 0, 0, pf.getImageableWidth(), pf.getImageableHeight());

        return PAGE_EXISTS;
    }


//    private void debug(Graphics2D g2, double x, double y, double width, double height)
//    {
//
//        final Stroke oldStroke = g2.getStroke();
//        float dash1[] = {10.0f};
//        BasicStroke dashed = new BasicStroke(1.0f,
//        BasicStroke.CAP_BUTT,
//        BasicStroke.JOIN_MITER,
//        10.0f, dash1, 0.0f);
//        g2.setStroke(dashed);
//        g2.drawRect((int) x, (int) y, (int) width, (int) height);
//        g2.setStroke(oldStroke);
//    }

}
%>

        <%
            DirectPrint directPrint = new DirectPrint();
//            directPrint.printString("E00000000 \n ooo"); 
//            directPrint.printString("1rrrrrr");
             directPrint.printString("        Biocore Lab"+"\n           Your no: "+"\n    "+3+"\n       Current no :"+2+"\n   Data:"+"12-10-22"+" Time:"+"10:50:30");
        %>
 