/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PIS_helper;

import com.lowagie.text.Document;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
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

@WebServlet(name = "test", urlPatterns = {"/test"})

public class test extends HttpServlet{
    
    
    
    /**
     * @see HttpServlet#doGet( HttpServletRequest request, HttpServletResponse
     * response)
     */
    // Function To Generate Label
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/pdf");

        try {

            // Setting Page Size And PDF Writter
            Document document = new Document(PageSize.A8, 5, 10, 10, 5);
            PdfWriter.getInstance(document, response.getOutputStream());

            // Initialiase The PDF Document
            document.open();
            
            document.add(new Paragraph("Aku Budak Baik..."));


            // step 5
            document.close();

        } catch (Exception de) {
            throw new IOException(de.getMessage());
        }
    }
    
}
