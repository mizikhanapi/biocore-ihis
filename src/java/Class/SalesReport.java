/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import dbConn1.Conn;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MH0411
 */
public class SalesReport extends HttpServlet {
    
    private Font recti = new Font(Font.HELVETICA, 16, Font.BOLD);
    private Font rectem = new Font(Font.HELVETICA, 12, Font.BOLD);
    private Font rectemja = new Font(Font.COURIER, 12);
    private Font rectemjaBold = new Font(Font.COURIER, 12, Font.BOLD);
    private Font rectemjaBig = new Font(Font.COURIER, 16, Font.BOLD);
    private Date date = new Date();
    private DecimalFormat df = new DecimalFormat("0.00");
    private String strDay = null;
    private String strMon = null;
    private String strYear = null;
    private String userID = "";
    private String hfc_cd = "";
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        strDay = request.getParameter("day");
        strMon = request.getParameter("month");
        strYear = request.getParameter("year");
        userID = request.getSession().getAttribute("USER_ID").toString();
        hfc_cd = request.getSession().getAttribute("HEALTH_FACILITY_CODE").toString();
        
        String sql = "";
        if (!(strDay == null || strMon == null || strYear == null)){
            sql = "SELECT cd.item_cd, cd.item_desc, SUM(cd.quantity), SUM(cd.item_amt) "
                    + "FROM far_customer_dtl cd, far_customer_hdr ch "
                    + "WHERE cd.bill_no = ch.bill_no "
                    + "AND DATE(cd.txn_date) = '" + strYear + "-" + strMon + "-" + strDay + "' "
                    + "AND ch.hfc_cd = '" + hfc_cd + "' "
                    + "GROUP BY cd.item_cd "
                    + "ORDER BY SUM(cd.quantity) DESC";
            generateDayOrMonthSalesReport(response, sql, "Daily");
            
        } else if (!(strMon == null || strYear == null)){
            sql = "SELECT cd.item_cd, cd.item_desc, SUM(cd.quantity), SUM(cd.item_amt) "
                    + "FROM far_customer_dtl cd, far_customer_hdr ch " 
                    + "WHERE cd.bill_no = ch.bill_no "
                    + "AND MONTH(cd.txn_date) = '" + strMon + "' "
                    + "AND YEAR(cd.txn_date) = '" + strYear + "' "
                    + "AND ch.hfc_cd = '" + hfc_cd + "' "
                    + "GROUP BY cd.item_cd " 
                    + "ORDER BY SUM(cd.quantity) DESC";
            generateDayOrMonthSalesReport(response, sql, "Monthly");
            
        } else if (!(strYear == null)){
            sql = "SELECT MONTHNAME(cd.txn_date), cd.item_cd, cd.item_desc, SUM(cd.quantity), SUM(cd.item_amt) "
                    + "FROM far_customer_dtl cd, far_customer_hdr ch "
                    + "WHERE cd.bill_no = ch.bill_no "
                    + "AND YEAR(cd.txn_date) = '" + strYear + "' "
                    + "AND ch.hfc_cd = '" + hfc_cd + "' "
                    + "GROUP BY cd.item_cd "
                    + "ORDER BY cd.txn_date, SUM(cd.quantity) DESC";
            generateYearSalesReport(response, sql, "Yearly");
        }
    }
    
    private void generateDayOrMonthSalesReport(HttpServletResponse response, String sql, String reportType){
        try {   
            //Create and set PDF format
            Document document = new Document(PageSize.A4, 36, 36, 64, 36); 
            document.setMargins(40, 30, 50, 50); 
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfWriter writer = PdfWriter.getInstance(document, baos);
            document.open();
        
            //----------------------------table header--------------------------------------->
            PdfPTable header = new PdfPTable(4);
            header.setWidths(new float[]{3f, 4f, 3.5f, 4f});
            header.setLockedWidth(true);
            header.setTotalWidth(document.right() - document.left());

            PdfPCell cellTitle = new PdfPCell(new Phrase(reportType + " Sales Report\n\n", recti));
            cellTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
            cellTitle.setBorder(Rectangle.NO_BORDER);
            cellTitle.setColspan(4);
            header.addCell(cellTitle);  
            
            String sql_getHFAddr = 
                    "SELECT hfc_name, address1, address2, address3 "
                    + "FROM adm_health_facility "
                    + "WHERE hfc_cd = '"+ hfc_cd +"'";
            ArrayList<ArrayList<String>> hfData = Conn.getData(sql_getHFAddr);
            String hfName = hfData.get(0).get(0);
            String hfAddr1 = hfData.get(0).get(1);
            String hfAddr2 = hfData.get(0).get(2);
            String hfAddr3 = hfData.get(0).get(3); 
            String addr = 
                    " "+ hfName +", \n"
                    + " "+ hfAddr1 +" \n"
                    + " "+ hfAddr2 +",\n"
                    + " "+ hfAddr3 +"\n\n";
            
            PdfPCell cell31 = new PdfPCell(new Phrase(addr, rectemja));
            cell31.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell31.setColspan(4);
            cell31.setBorder(Rectangle.NO_BORDER);
            
            String temp = "";
            String reportDate = "";
            if (strDay == null){
                temp = "Month";
                reportDate = Month.getFullLetterMonth(strMon) + " " + strYear + "\n\n";
            } else{
                temp = "Date";
                reportDate = strDay + " " + Month.getFullLetterMonth(strMon) + " " + strYear + "\n\n";
            }
            
            PdfPCell cell41 = new PdfPCell(new Phrase("Report " + temp + " : ", rectem));
            cell41.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell41.setColspan(1);
            cell41.setBorder(Rectangle.NO_BORDER);
            PdfPCell cell42 = new PdfPCell(new Phrase(reportDate, rectemja));
            cell42.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell42.setColspan(3);
            cell42.setBorder(Rectangle.NO_BORDER);

            header.addCell(cell31);
            header.addCell(cell41);
            header.addCell(cell42);
            
            //----------------------------table body--------------------------------------->
            
            PdfPTable table = new PdfPTable(5);
            table.setWidths(new float[]{1f, 1.5f, 4f, 2f, 2f});
            table.setLockedWidth(true);
            table.setTotalWidth(document.right() - document.left());
            
            PdfPCell cell61 = new PdfPCell(new Phrase("No.", rectem));
            cell61.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell cell62 = new PdfPCell(new Phrase("Item Code", rectem));
            cell62.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell cell63 = new PdfPCell(new Phrase("Item Name", rectem));
            cell63.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell cell64 = new PdfPCell(new Phrase("Total Quantity", rectem));
            cell64.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell cell65 = new PdfPCell(new Phrase("Total Sales", rectem));
            cell65.setHorizontalAlignment(Element.ALIGN_CENTER);
            
            table.addCell(cell61);
            table.addCell(cell62);
            table.addCell(cell63);
            table.addCell(cell64);
            table.addCell(cell65);

            double grandTotalSales = 0;
            int num = 1;
            ArrayList<ArrayList<String>> saleData = Conn.getData(sql);
            for(int i = 0; i < saleData.size(); i++){
                String no = Integer.toString(num++);

                String itemCode = saleData.get(i).get(0);
                String itemName = saleData.get(i).get(1);
                String totalQty = saleData.get(i).get(2);
                double totalSales = Double.parseDouble(saleData.get(i).get(3));
               
                PdfPCell cell71 = new PdfPCell(new Phrase(no, rectemja));
                cell71.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cell72 = new PdfPCell(new Phrase(itemCode, rectemja));
                cell72.setHorizontalAlignment(Element.ALIGN_LEFT);
                PdfPCell cell73 = new PdfPCell(new Phrase(itemName, rectemja));
                cell73.setHorizontalAlignment(Element.ALIGN_LEFT);
                PdfPCell cell74 = new PdfPCell(new Phrase(totalQty, rectemja));
                cell74.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cell75 = new PdfPCell(new Phrase(df.format(totalSales), rectemja));
                cell75.setHorizontalAlignment(Element.ALIGN_CENTER);
      
                table.addCell(cell71);
                table.addCell(cell72);
                table.addCell(cell73);
                table.addCell(cell74);
                table.addCell(cell75);
                
                grandTotalSales += totalSales;
                
                if (i == saleData.size()-1){
                    PdfPCell cell94 = new PdfPCell(new Phrase("Grand Total", rectem));
                    cell94.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cell94.setColspan(4);
                    PdfPCell cell95 = new PdfPCell(new Phrase(df.format(grandTotalSales), rectem));
                    cell95.setHorizontalAlignment(Element.ALIGN_CENTER);
                    
                    table.addCell(cell94);
                    table.addCell(cell95);
                }
            }
            
            //----------------------------table footer--------------------------------------->
            PdfPTable footer = new PdfPTable(1);
            footer.setWidths(new float[]{10.5f});
            footer.setLockedWidth(true);
            footer.setTotalWidth(document.right() - document.left());
            
            String message1 = "****End of Report****";
            String message2 = "Generated on " + new SimpleDateFormat("dd MMM yyyy").format(date);
            PdfPCell cell160 = new PdfPCell(new Phrase(message1, rectemja));
            cell160.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell160.setBorder(Rectangle.TOP);
            PdfPCell cell170 = new PdfPCell(new Phrase(message2, rectemja));
            cell170.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell170.setBorder(Rectangle.NO_BORDER);
            
            footer.addCell(cell160);
            footer.addCell(cell170);
            
            document.add(header);
            document.add(table);
            document.add(footer);
            
            //Close the PDF for ready to send
            document.close();//close document
            writer.close();
            
            //Send to client browser
            response.setHeader("Expires", "0");
            response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
            response.setHeader("Pragma", "public");
            response.setContentType("application/pdf");
            response.setContentLength(baos.size());
            OutputStream os = response.getOutputStream();
            baos.writeTo(os);
            os.flush();
            os.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private void generateYearSalesReport(HttpServletResponse response, String sql, String reportType){
        try {   
            //Create and set PDF format
            Document document = new Document(PageSize.A4, 36, 36, 64, 36); 
            document.setMargins(40, 30, 50, 50); 
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfWriter writer = PdfWriter.getInstance(document, baos);
            document.open();
        
            //----------------------------table header--------------------------------------->
            PdfPTable header = new PdfPTable(4);
            header.setWidths(new float[]{3f, 4f, 3.5f, 4f});
            header.setLockedWidth(true);
            header.setTotalWidth(document.right() - document.left());

            PdfPCell cellTitle = new PdfPCell(new Phrase(reportType + " Sales Report\n\n", recti));
            cellTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
            cellTitle.setBorder(Rectangle.NO_BORDER);
            cellTitle.setColspan(4);
            header.addCell(cellTitle);  
            
            String sql_getHFAddr = 
                    "SELECT hfc_name, address1, address2, address3 "
                    + "FROM adm_health_facility "
                    + "WHERE hfc_cd = '"+ hfc_cd +"'";
            ArrayList<ArrayList<String>> hfData = Conn.getData(sql_getHFAddr);
            String hfName = hfData.get(0).get(0);
            String hfAddr1 = hfData.get(0).get(1);
            String hfAddr2 = hfData.get(0).get(2);
            String hfAddr3 = hfData.get(0).get(3); 
            String addr = 
                    " "+ hfName +", \n"
                    + " "+ hfAddr1 +" \n"
                    + " "+ hfAddr2 +", \n"
                    + " "+ hfAddr3 +"\n\n";
            
            PdfPCell cell31 = new PdfPCell(new Phrase(addr, rectemja));
            cell31.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell31.setColspan(4);
            cell31.setBorder(Rectangle.NO_BORDER);
            
            PdfPCell cell41 = new PdfPCell(new Phrase("Report Year : ", rectem));
            cell41.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell41.setColspan(1);
            cell41.setBorder(Rectangle.NO_BORDER);
            
            PdfPCell cell42 = new PdfPCell(new Phrase(strYear + "\n\n", rectemja));
            cell42.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell42.setColspan(3);
            cell42.setBorder(Rectangle.NO_BORDER);

            header.addCell(cell31);
            header.addCell(cell41);
            header.addCell(cell42);
            
            //----------------------------table body--------------------------------------->
            
            PdfPTable table = new PdfPTable(5);
            table.setWidths(new float[]{1.5f, 1.5f, 3.5f, 2f, 2f});
            table.setLockedWidth(true);
            table.setTotalWidth(document.right() - document.left());
            
            PdfPCell cell61 = new PdfPCell(new Phrase("Month", rectem));
            cell61.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell cell62 = new PdfPCell(new Phrase("Item Code", rectem));
            cell62.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell cell63 = new PdfPCell(new Phrase("Item Name", rectem));
            cell63.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell cell64 = new PdfPCell(new Phrase("Total Quantity", rectem));
            cell64.setHorizontalAlignment(Element.ALIGN_CENTER);
            PdfPCell cell65 = new PdfPCell(new Phrase("Total Sales", rectem));
            cell65.setHorizontalAlignment(Element.ALIGN_CENTER);
            
            table.addCell(cell61);
            table.addCell(cell62);
            table.addCell(cell63);
            table.addCell(cell64);
            table.addCell(cell65);

            double grandTotalSales = 0;
            ArrayList<ArrayList<String>> saleData = Conn.getData(sql);
            for(int i = 0; i < saleData.size(); i++){
                
                String month = saleData.get(i).get(0);
                String itemCode = saleData.get(i).get(1);
                String itemName = saleData.get(i).get(2);
                String totalQty = saleData.get(i).get(3);
                double totalSales = Double.parseDouble(saleData.get(i).get(4));
                
                PdfPCell cell71 = new PdfPCell(new Phrase(month, rectemja));
                cell71.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cell72 = new PdfPCell(new Phrase(itemCode, rectemja));
                cell72.setHorizontalAlignment(Element.ALIGN_LEFT);
                PdfPCell cell73 = new PdfPCell(new Phrase(itemName, rectemja));
                cell73.setHorizontalAlignment(Element.ALIGN_LEFT);
                PdfPCell cell74 = new PdfPCell(new Phrase(totalQty, rectemja));
                cell74.setHorizontalAlignment(Element.ALIGN_CENTER);
                PdfPCell cell75 = new PdfPCell(new Phrase(df.format(totalSales), rectemja));
                cell75.setHorizontalAlignment(Element.ALIGN_CENTER);
      
                table.addCell(cell71);
                table.addCell(cell72);
                table.addCell(cell73);
                table.addCell(cell74);
                table.addCell(cell75);
                
                grandTotalSales += totalSales;
                
                if (i == saleData.size()-1){
                    PdfPCell cell94 = new PdfPCell(new Phrase("Grand Total", rectem));
                    cell94.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cell94.setColspan(4);
                    PdfPCell cell95 = new PdfPCell(new Phrase(df.format(grandTotalSales), rectem));
                    cell95.setHorizontalAlignment(Element.ALIGN_CENTER);
                    
                    table.addCell(cell94);
                    table.addCell(cell95);
                }
            }
            
            //----------------------------table footer--------------------------------------->
            PdfPTable footer = new PdfPTable(1);
            footer.setWidths(new float[]{10.5f});
            footer.setLockedWidth(true);
            footer.setTotalWidth(document.right() - document.left());
            
            String message1 = "****End of Report****";
            String message2 = "Generated on " + new SimpleDateFormat("dd MMM yyyy").format(date);
            PdfPCell cell160 = new PdfPCell(new Phrase(message1, rectemja));
            cell160.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell160.setBorder(Rectangle.TOP);
            PdfPCell cell170 = new PdfPCell(new Phrase(message2, rectemja));
            cell170.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell170.setBorder(Rectangle.NO_BORDER);
            
            footer.addCell(cell160);
            footer.addCell(cell170);
            
            document.add(header);
            document.add(table);
            document.add(footer);
            
            //Close the PDF for ready to send
            document.close();//close document
            writer.close();
            
            //Send to client browser
            response.setHeader("Expires", "0");
            response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
            response.setHeader("Pragma", "public");
            response.setContentType("application/pdf");
            response.setContentLength(baos.size());
            OutputStream os = response.getOutputStream();
            baos.writeTo(os);
            os.flush();
            os.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
