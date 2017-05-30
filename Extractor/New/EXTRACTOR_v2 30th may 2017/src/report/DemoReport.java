/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package report;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.awt.Desktop;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import main.RMIConnector;
import Config_Pack.Config;

/**
 *
 * @author umarmukhtar
 */
public class DemoReport {
    
    public static void main(String[] args) throws DocumentException, FileNotFoundException {
        
        RMIConnector rc = new RMIConnector();
        
        // example get data from table lhr_signs
        String sql = "SELECT * FROM lhr_medication";
        
        // get data from db server
        ArrayList<ArrayList<String>> data = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, sql);
        
        // create pdf file
        String namafile = "reportSigns.pdf";
        Document d= new Document();
        PdfWriter.getInstance(d, new FileOutputStream(namafile));
        d.open();
        
        // create title inside pdf
        Paragraph paragraph = new Paragraph("Example Data: "+sql+"\n");
        d.add(paragraph);
        
        // create table inside pdf contains data from db server
        int col = data.get(0).size();
        int row = data.size();
        PdfPTable table = new PdfPTable(col);
        
        // create table header column based on sql table's column
        for (int i = 0; i < col; i++) {
            table.addCell("Column "+(i+1));
        }
        
        // insert data into table's cells
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                table.addCell(data.get(i).get(j));
            }
        }
        d.add(table);
        
        // open pdf
        if (Desktop.isDesktopSupported()) {
            try {
                File myFile = new File(namafile);
                Desktop.getDesktop().open(myFile);
            } catch (IOException ex) {
                System.out.println("Cannot open file!");
                // no application registered for PDFs
            }
        }
        
        // close pdf resource after being used
        d.close();
    }
}
