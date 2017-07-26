/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PIS_helper;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfWriter;
import com.lowagie.text.pdf.draw.DottedLineSeparator;
import dBConn.Conn;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.WordUtils;

/**
 *
 * @author Shammugam
 */
@WebServlet(name = "generatePharmacyLabel", urlPatterns = {"/generatePharmacyLabel"})

public class generatePharmacyLabel extends HttpServlet {

    Conn conn = new Conn();

    // Declaring Variable
    private String labelData = "";

    /**
     * @see HttpServlet#doGet( HttpServletRequest request, HttpServletResponse
     * response)
     */
    // Function To Generate Label
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/pdf");

        try {

            // Getting Long Data For The Label Generation And Spliting The Data
            labelData = request.getParameter("labelData");
            String splittedData[] = labelData.split("\\|", -1);

            // Creating Variable For The Splitted Data
            String orderNo, patientPMI, patientName, hfc_cd, hfcName, discipline, sub_discipline, dateToday;
            orderNo = splittedData[0];
            patientPMI = splittedData[1];
            patientName = splittedData[2];
            hfc_cd = splittedData[3];
            hfcName = splittedData[4];
            discipline = splittedData[5];
            sub_discipline = splittedData[6];
            dateToday = splittedData[7];

            // Setting Page Size And PDF Writter
            Document document = new Document(PageSize.A8, 5, 10, 10, 5);
            PdfWriter.getInstance(document, response.getOutputStream());

            // Initialiase The PDF Document
            document.open();

            // Getting Data For Loop
            ArrayList<ArrayList<String>> data = new ArrayList<>();
            String sql = " SELECT IFNULL(om.ORDER_NO,'-'),IFNULL(om.DRUG_ITEM_CODE,'-'),IFNULL(om.DRUG_ITEM_DESC,'-'),IFNULL(om.DRUG_FREQUENCY,'-'),IFNULL(om.DRUG_STRENGTH,'-'),IFNULL(mdc.D_CAUTION_CODE,'-') "
                    + " FROM pis_order_detail om LEFT JOIN pis_mdc2 mdc ON (om.`DRUG_ITEM_CODE` = mdc.`UD_MDC_CODE`) "
                    + " WHERE mdc.hfc_cd = '" + hfc_cd + "' AND mdc.discipline_cd = '" + discipline + "' AND om.ORDER_NO='" + orderNo + "' AND om.STATUS='1'; ";
            data = conn.getData(sql);

            // Loop To Generate The Label
            for (int i = 0; i < data.size(); i++) {

                String arrayOrderNo = data.get(i).get(0);
                String arrayItemCode = data.get(i).get(1);
                String arrayItemDesc = data.get(i).get(2).trim();
                String arrayItemFreq = data.get(i).get(3).trim();
                String arrayItemStrength = data.get(i).get(4).trim();
                String arrayItemCaution = data.get(i).get(5).trim();

                // Checking For Null Or Empty Spaces
                if (arrayOrderNo == null) {
                    arrayOrderNo = "-";
                }

                if (arrayItemCode == null) {
                    arrayItemCode = "-";
                }

                if (arrayItemDesc == null || arrayItemDesc.equals("")) {
                    arrayItemDesc = "-";
                }

                if (arrayItemFreq == null || arrayItemFreq.equals("")) {
                    arrayItemFreq = "-";
                }

                if (arrayItemStrength == null || arrayItemStrength.equals("")) {
                    arrayItemStrength = "-";
                }

                if (arrayItemCaution == null || arrayItemCaution.equals("")) {
                    arrayItemCaution = "No Caution";
                }
                // Checking For Null Or Empty Spaces

                // Initializing New Page
                document.newPage();
                // Initializing New Page

                // Rectangle For Border
                Rectangle labelRectBorder = new Rectangle(144, 5, 4, 205);
                labelRectBorder.setBorder(Rectangle.BOX);
                labelRectBorder.setBorderWidth(2);
                document.add(labelRectBorder);
                // Rectangle For Border

                // HFC Name Declaration
                // Font For HFC Name
                Font labelHFCFont = new Font();
                labelHFCFont.setStyle(Font.BOLD);
                labelHFCFont.setSize(11);
                // Paragraph For HFC Name
                Paragraph labelHFCName = new Paragraph(hfcName, labelHFCFont);
                DottedLineSeparator dottedline = new DottedLineSeparator();
                dottedline.setOffset(-3);
                dottedline.setGap(3f);
                labelHFCName.add(dottedline);
                labelHFCName.setAlignment(Element.ALIGN_CENTER);
                labelHFCName.setSpacingBefore(1);
                document.add(labelHFCName);
                // HFC Name Declaration

                // Frequency Declaration
                // Font For Frequency
                Font labelFrequencyFont = new Font();
                labelFrequencyFont.setStyle(Font.BOLD);
                labelFrequencyFont.setSize(13);
                // Paragraph For Frequency
                Paragraph labelFrequency = new Paragraph(arrayItemFreq, labelFrequencyFont);
                labelFrequency.setAlignment(Element.ALIGN_CENTER);
                labelFrequency.setSpacingBefore(14);
                labelFrequency.setSpacingAfter(14);
                document.add(labelFrequency);
                // Frequency Declaration

                // Name And Date Declaration
                // Font For Name And Date
                Font labelNameDateFont = new Font();
                labelNameDateFont.setSize(8);
                // Paragraph For Patient Name
                Paragraph labelPatientName = new Paragraph("Name : " + WordUtils.capitalizeFully(patientName), labelNameDateFont);
                labelPatientName.setAlignment(Element.ALIGN_CENTER);
                // Paragraph For Date
                Paragraph labelDate = new Paragraph("Date : " + dateToday, labelNameDateFont);
                labelDate.setAlignment(Element.ALIGN_CENTER);
                document.add(labelPatientName);
                document.add(labelDate);
                // Name And Date Declaration

                // Medi Name Declaration
                // Font For Medi Name
                Font labelMediNameFont = new Font();
                labelMediNameFont.setSize(9);
                // Paragraph For Medi Name
                Paragraph labelMediName = new Paragraph(arrayItemDesc + " (" + arrayItemStrength + ")", labelMediNameFont);
                labelMediName.setAlignment(Element.ALIGN_CENTER);
                labelMediName.setSpacingBefore(13);
                labelMediName.setSpacingAfter(13);
                document.add(labelMediName);
                // Medi Name Declaration

                // Caution Declaration
                // Font For Caution
                Font labelCautionFont = new Font();
                labelCautionFont.setStyle(Font.BOLD);
                labelCautionFont.setSize(6);
                // Paragraph For Caution
                Paragraph labelCaution = new Paragraph(arrayItemCaution, labelCautionFont);
                labelCaution.setAlignment(Element.ALIGN_CENTER);
                document.add(labelCaution);
                // Caution Declaration

            }

            // step 5
            document.close();

        } catch (Exception de) {
            throw new IOException(de.getMessage());
        }
    }
}

// ================== ================= Library That Can Be Used ================== ================= //
// ----------------------- Setting Page Size ----------------------- //
// Rectangle two = new Rectangle(700, 400);
// document.setPageSize(two);
// ----------------------- Setting Page Size ----------------------- //
// ----------------------- Setting Paragraph Format ----------------------- //
// Paragraph p = new Paragraph();
// p.add("This is my paragraph 1");
// p.setAlignment(Element.ALIGN_CENTER);
//
// document.add(p);
//
// Paragraph p2 = new Paragraph();
// p2.add("This is my paragraph 2"); //no alignment
//
// document.add(p2);
//
// Font f = new Font();
// f.setStyle(Font.BOLD);
// f.setSize(8);
//
// document.add(new Paragraph("This is my paragraph 3", f));
// ----------------------- Setting Paragraph Format ----------------------- //

// ================== ================= Library That Can Be Used ================== ================= //
