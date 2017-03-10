package org.apache.jsp.Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.awt.Font;
import javax.print.attribute.standard.MediaSize;
import java.awt.print.Paper;
import java.awt.Stroke;
import java.awt.BasicStroke;
import javax.print.attribute.Attribute;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.print.PageFormat;
import java.awt.print.Printable;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import javax.print.PrintService;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.standard.Copies;
import javax.print.attribute.standard.PageRanges;
import javax.print.PrintServiceLookup;

public final class Printer_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 


 
public class DirectPrint implements Printable {
 
    private PrintService[] printService;
    private PrintService Defultservice;
    private String text;
 
    public DirectPrint() {
        this.printService = PrinterJob.lookupPrintServices();
        this.Defultservice = PrintServiceLookup.lookupDefaultPrintService(); 
        for(int i = 0 ;i < printService.length; i++)
        System.out.println("Normal "+printService[i]);
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
            PrintService Printer5850II=null;
            String eprintService="";
              try {
                      for(PrintService theprintService : printService)
                        {
                           
                            if(eprintService.indexOf("5850II") != -1)
                             {
                               eprintService = theprintService.toString();
                                System.out.println("HERE I AM 5850II ");
                                System.out.println(theprintService);
                                 Printer5850II = theprintService;
                                 break;
                             } 
                        }
                    if(Printer5850II != null)
                    printJob.setPrintService(Printer5850II);
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

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");

            DirectPrint directPrint = new DirectPrint();
//            directPrint.printString("E00000000 \n ooo"); 
//            directPrint.printString("1rrrrrr");
             directPrint.printString("        Biocore Lab"+"\n           Your no: "+"\n    "+3+"\n       Current no :"+2+"\n   Data:"+"12-10-22"+" Time:"+"10:50:30");
        
      out.write('\n');
      out.write(' ');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
