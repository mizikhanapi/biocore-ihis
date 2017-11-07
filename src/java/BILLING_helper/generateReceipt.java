/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BILLING_helper;

import Class.EmailSender;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import dbConn1.Conn;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "generateReceipt", urlPatterns = {"/generateReceipt"})

/**
 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
 * methods.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs /**
 *
 * @author Shammugam
 */
/**
 * @see HttpServlet#doGet( HttpServletRequest request, HttpServletResponse
 * response)
 */
public class generateReceipt extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DocumentException {

        response.setContentType("application/pdf");

        // Setting Page Size And PDF Writter
        Document document = new Document(PageSize.A8, 5, 10, 10, 5);
        PdfWriter.getInstance(document, response.getOutputStream());

        // Initialiase The PDF Document
        document.open();

        document.add(new Paragraph("Chilaka"));
        
        document.close();

    }

}
