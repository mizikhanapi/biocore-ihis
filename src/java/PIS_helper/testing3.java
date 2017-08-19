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
import java.io.IOException;
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
@WebServlet(name = "testing3", urlPatterns = {"/testing3"})

public class testing3 extends HttpServlet {

    // Declaring Variable
    public String labelData = "";

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
            String splittedMainData[] = labelData.split("\\<split>", -1);

            // Setting Page Size And PDF Writter
            Document document = new Document(PageSize.A8, 5, 10, 10, 5);
            PdfWriter.getInstance(document, response.getOutputStream());

            // Initialiase The PDF Document
            document.open();

            // Loop To Generate The Label
            for (int i = 0; i < splittedMainData.length; i++) {

                String splittedDetailData[] = splittedMainData[i].split("\\|", -1);
                String data1 = splittedDetailData[0];
                String data2 = splittedDetailData[1];
                String data3 = splittedDetailData[2];
                String data4 = splittedDetailData[3];
                String data5 = splittedDetailData[4];

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
                Paragraph labelHFCName = new Paragraph(data1, labelHFCFont);
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
                Paragraph labelFrequency = new Paragraph(data2, labelFrequencyFont);
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
                Paragraph labelPatientName = new Paragraph("Name : " + WordUtils.capitalizeFully(data3), labelNameDateFont);
                labelPatientName.setAlignment(Element.ALIGN_CENTER);
                // Paragraph For Date
                Paragraph labelDate = new Paragraph("Date : " + data3, labelNameDateFont);
                labelDate.setAlignment(Element.ALIGN_CENTER);
                document.add(labelPatientName);
                document.add(labelDate);
                // Name And Date Declaration

                // Medi Name Declaration
                // Font For Medi Name
                Font labelMediNameFont = new Font();
                labelMediNameFont.setSize(9);
                // Paragraph For Medi Name
                Paragraph labelMediName = new Paragraph(data4 + " (" + data4 + ")", labelMediNameFont);
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
                Paragraph labelCaution = new Paragraph(data5, labelCautionFont);
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
