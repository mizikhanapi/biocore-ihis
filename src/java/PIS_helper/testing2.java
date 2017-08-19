/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PIS_helper;

import com.lowagie.text.Document;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Shammugam
 */
@WebServlet(name = "testing2", urlPatterns = {"/testing2"})

public class testing2 extends HttpServlet {

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

                // Initializing New Page
                document.newPage();
                // Initializing New Page

                // Rectangle For Border
                Rectangle labelRectBorder = new Rectangle(144, 5, 4, 205);
                labelRectBorder.setBorder(Rectangle.BOX);
                labelRectBorder.setBorderWidth(2);
                document.add(labelRectBorder);
                // Rectangle For Border

                document.add(new Paragraph(splittedDetailData[0]));
                document.add(new Paragraph(splittedDetailData[1]));
                document.add(new Paragraph(splittedDetailData[2]));
                document.add(new Paragraph(splittedDetailData[3]));


            }

            // step 5
            document.close();

        } catch (Exception de) {
            throw new IOException(de.getMessage());
        }
    }

}
