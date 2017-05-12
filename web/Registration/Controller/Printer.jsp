<%-- 
    Document   : Printer
    Created on : Feb 21, 2017, 9:39:21 AM
    Author     : user
--%>
<%@page import="java.awt.geom.Rectangle2D"%>
<%@page import="java.awt.FontMetrics"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.poi.util.IOUtils"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
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
 
    private PrintService[] printService;
//    private PrintService Defultservice;
    private PrintService Printer5850II;
    private String text;
    FontMetrics fm;
 
    public DirectPrint() {
          //for Printer named 5850II
        this.printService = PrinterJob.lookupPrintServices(); 
//        for(int i = 0 ;i < printService.length; i++)
//        System.out.println("Normal "+printService[i]);

        //for default printer
//        this.Defultservice = PrintServiceLookup.lookupDefaultPrintService();
//        System.out.println("Defult "+Defultservice);
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
       

//         PageFormat pf = printJob.pageDialog(aset);

//
         PageFormat pf = printJob.defaultPage();
            Paper paper = new Paper();
            double margin = 0; 
            paper.setImageableArea(margin, margin, paper.getWidth() - margin * 2, paper.getHeight()
                - margin * 2);
            pf.setPaper(paper);
 
            printJob.setPrintable(this, pf);
              try {
                       //for Printer named 5850II
                      for(PrintService theprintService : printService)
                        {
                            if(theprintService.toString().indexOf("5850II") != -1)
                             {
                                System.out.println("HERE I AM 5850II ");
                                 Printer5850II = theprintService;
                                 break;
                             } 
                        }
                    printJob.setPrintService(Printer5850II);
//                    for default printer
//                    printJob.setPrintService(Defultservice);

                    printJob.print();
              } catch (PrinterException pp) {
                System.out.println(pp);
              }
//            }
 

//        Paper page = new Paper();
//        page.setImageableArea(100, 100, 1000000, 100);
//        
//        pf = printJob.getPageFormat(aset);
//        printJob.setPrintable(this);

//     try {
//            
//            for(int i = 0; i<printService.length;i++)
//            {
////                System.out.println(printService[i]);
//                  
//            }
//
//            printJob.setPrintService(printService[5]);
//            //index of installed printers on you system
//            //not sure if default-printer is always '0'
//            printJob.print(aset);
//        } catch (PrinterException err) {
//            System.err.println(err);
//        }
    }
 
    public int print(Graphics g, PageFormat pf, int pageIndex) throws PrinterException {
       int y = 0;
       int y2 = 20;
            if (pageIndex != 0)
              return NO_SUCH_PAGE;

    
        Graphics2D g2 = (Graphics2D) g;
        g2.translate(pf.getImageableX(), pf.getImageableY());
        Font currentFont = g.getFont();
        Font newFont = currentFont.deriveFont(currentFont.getSize() * 1.4F);
        g.setFont(newFont);
        g.setFont(new Font("TimesRoman", Font.PLAIN, 10));

        ArrayList<String> lines = new ArrayList<>();
        for (String line : this.text.split("\n"))
              {
                  lines.add(line);

              }

        
        fm = g.getFontMetrics(new Font("TimesRoman", Font.PLAIN, 10));
//        String test ="Join the Stack Overflow Community";

        if (!lines.get(0).equals("MedicalReport")) {

        if (fm.stringWidth(lines.get(0)) > 130) {
//            System.out.println("##"+fm.stringWidth(test));
            ArrayList<String> s = splitLongString(lines.get(0));
            for (int i =0;i<s.size();i++)
{   
           g.drawString(s.get(i),  (138 - fm.stringWidth(s.get(i)))/2  , y += g.getFontMetrics().getHeight());
}
        } else {
                g.drawString(lines.get(0),  (138 - fm.stringWidth(lines.get(0)))/2  , y += g.getFontMetrics().getHeight());
        }
        
        for (int i =1;i<lines.size();i++) {
            
            if(i == 2)
            {
                g.setFont(new Font("TimesRoman", Font.PLAIN, 20));
                g.drawString(lines.get(i),(138 - fm.stringWidth(lines.get(i)))/2 , y += g.getFontMetrics().getHeight());
               
            } else if (i == 3 || i == 1){
                g.setFont(new Font("TimesRoman", Font.PLAIN, 10));
                g.drawString(lines.get(i), (138 - fm.stringWidth(lines.get(i)))/2 , y += g.getFontMetrics().getHeight());
               
            } else if(i == 4)
            {
                g.setFont(new Font("TimesRoman", Font.ITALIC, 7));
                g.drawString(lines.get(i), 10 , y += g.getFontMetrics().getHeight());
            }     
           
        } 

          
          } else {
            
            if (fm.stringWidth(lines.get(1)) > 130) {
//            System.out.println("##"+fm.stringWidth(test));
            ArrayList<String> s = splitLongString(lines.get(1));
            for (int i =0;i<s.size();i++)
            {   
                g.drawString(s.get(i),  (138 - fm.stringWidth(s.get(i)))/2  , y += g.getFontMetrics().getHeight());
            }
        } else {
                g.drawString(lines.get(1),  (138 - fm.stringWidth(lines.get(0)))/2  , y += g.getFontMetrics().getHeight());
        }
        
        for (int i =2;i<lines.size();i++) {
            System.out.println(lines.get(i));
            if (lines.get(i).contains(":") && fm.stringWidth(lines.get(i)) > 130) {
                
                ArrayList<String> tempStr = splitLongString(lines.get(i));
                for (int t =0;t<tempStr.size();t++)
                {   
                    g.drawString(tempStr.get(t),  5 , y2 += g.getFontMetrics().getHeight());
                } 
            } else{
                if (fm.stringWidth(lines.get(i)) > 130) {
                ArrayList<String> tempStr = splitLongString(lines.get(i));
                for (int t =0;t<tempStr.size();t++)
                {   
                    g.drawString(tempStr.get(t),  5 , y2 += g.getFontMetrics().getHeight());
                } 
            } else {
                g.drawString(lines.get(i),  5  , y2 += g.getFontMetrics().getHeight());
        } 

            }
                 
           
        } 
            }
//        try
//                   {
//                       BufferedImage img = ImageIO.read(new File("C:/Users/user/Box Sync/temp/malaysia_ministry_logo33x33px.png")); 
//       //                img = img.getSubimage(50, 50, 500, 500); // 500 x 500
//                       g.drawImage(img, 0, 0, null);
//
//                   }catch(IOException e)
//                   {
//                       e.printStackTrace();
//                   } 


          
//        g.drawString(String.valueOf(this.text), 15, y+= g.getFontMetrics().getHeight());
        //debug(g2, 0, 0, pf.getImageableWidth(), pf.getImageableHeight());

        return PAGE_EXISTS;
    }




    private ArrayList<String> splitLongString(String sentence)
    {
        ArrayList<String> words = new ArrayList<>();
        ArrayList<String> lines = new ArrayList<>();
        String temp="";
         for (String word : sentence.split(" "))
        {

            words.add(word);
        }
        for (String word : words)
        {

        

            if( fm.stringWidth(word+temp) <= 130)
            {
                temp += word+" ";
                                
            }
            else 
            {
                lines.add(temp);
                temp = word+" ";
            }

            if(word.equals(words.get(words.size()-1)))
                lines.add(temp);

        }
       return lines;
    }  
    

}
%>
